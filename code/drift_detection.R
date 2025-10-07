# 📦 Libraries
library(tidyverse)
library(lubridate)
library(janitor)
library(rsample)        # for data splitting
library(recipes)        # for preprocessing
library(keras)          # for autoencoder
library(caret)          # optional for diagnostics
library(ks)             # for density-based drift (optional)

# 📂 Load Data
df <- read_csv("data/processed/lending_features.csv") %>%
  clean_names()

# 📌 Step 1: Define Pre/Post-Drift Periods
df <- df %>%
  mutate(issue_year = year(mdy(issue_d))) %>%
  filter(issue_year %in% c(2015, 2016)) %>%
  mutate(period = if_else(issue_year == 2015, "train", "monitor"))

train_data <- df %>% filter(period == "train")
monitor_data <- df %>% filter(period == "monitor")

# 📌 Step 2: Define Recipe for Autoencoder Features
feature_recipe <- recipe(~ ., data = train_data) %>%
  update_role(id, period, issue_d, issue_year, purpose, loan_status, new_role = "id") %>%
  step_rm(all_nominal(), -all_outcomes()) %>%
  step_medianimpute(all_numeric()) %>%
  step_normalize(all_numeric())

# 📌 Step 3: Prep and Bake
prep_recipe <- prep(feature_recipe)
x_train <- bake(prep_recipe, train_data) %>% as.matrix()
x_monitor <- bake(prep_recipe, monitor_data) %>% as.matrix()

# 📌 Step 4: Build Autoencoder
input_dim <- ncol(x_train)

autoencoder <- keras_model_sequential() %>%
  layer_dense(units = round(input_dim / 2), activation = "relu", input_shape = input_dim) %>%
  layer_dense(units = input_dim, activation = "linear")

autoencoder %>% compile(
  optimizer = "adam",
  loss = "mean_squared_error"
)

autoencoder %>% fit(
  x = x_train,
  y = x_train,
  epochs = 30,
  batch_size = 32,
  validation_split = 0.1,
  verbose = 0
)

# 📌 Step 5: Compute Residuals
recon_train <- predict(autoencoder, x_train)
recon_monitor <- predict(autoencoder, x_monitor)

resid_train <- rowSums((x_train - recon_train)^2)
resid_monitor <- rowSums((x_monitor - recon_monitor)^2)

# 📊 Step 6: Visualize Drift in Residuals
drift_df <- tibble(
  residual = c(resid_train, resid_monitor),
  period = rep(c("train", "monitor"), c(length(resid_train), length(resid_monitor)))
)

ggplot(drift_df, aes(x = residual, fill = period)) +
  geom_density(alpha = 0.5) +
  labs(title = "Autoencoder Residuals: Drift Detection",
       x = "Reconstruction Error", y = "Density")

# 📈 Step 7: KS-Test for Drift Quantification
ks_result <- ks.test(resid_train, resid_monitor)

print(glue::glue("KS p-value: {ks_result$p.value}"))
