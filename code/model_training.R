# 📦 Libraries
library(tidyverse)
library(janitor)
library(recipes)
library(caret)
library(lubridate)
library(glue)

# 📂 Load Cleaned Data
df <- read_csv("data/processed/lending_features.csv") %>%
  clean_names()

# 🧹 Step 1: Define Target Variable
df <- df %>%
  mutate(default_flag = if_else(loan_status %in% c("Charged Off", "Default", "Late (31-120 days)"), 1, 0))

# 🎯 Step 2: Train-Test Split
set.seed(2025)
split <- initial_split(df, prop = 0.8, strata = default_flag)
train_data <- training(split)
test_data <- testing(split)

# 🧪 Step 3: Create Recipe
model_recipe <- recipe(default_flag ~ ., data = train_data) %>%
  update_role(id, issue_d, issue_year, loan_status, new_role = "id") %>%
  step_rm(purpose, grade, sub_grade, term, emp_title) %>%  # Drop high-cardinality vars
  step_medianimpute(all_numeric()) %>%
  step_dummy(all_nominal(), -all_outcomes()) %>%
  step_normalize(all_numeric())

# 🔁 Step 4: Preprocess
prep_recipe <- prep(model_recipe)
x_train <- bake(prep_recipe, train_data)
x_test <- bake(prep_recipe, test_data)

# ⚙️ Step 5: Train Model
control <- trainControl(method = "cv", number = 5, classProbs = TRUE, summaryFunction = twoClassSummary)

rf_model <- train(
  x = select(x_train, -default_flag),
  y = factor(if_else(x_train$default_flag == 1, "Default", "Paid")),
  method = "rf",
  trControl = control,
  metric = "ROC",
  tuneLength = 3
)

# 📈 Step 6: Evaluate
pred_probs <- predict(rf_model, newdata = select(x_test, -default_flag), type = "prob")
pred_classes <- predict(rf_model, newdata = select(x_test, -default_flag))

conf_matrix <- confusionMatrix(pred_classes, factor(if_else(x_test$default_flag == 1, "Default", "Paid")))
roc_auc <- pROC::roc(response = x_test$default_flag, predictor = pred_probs$Default)

# 🧾 Step 7: Save Output
saveRDS(rf_model, file = "outputs/model/rf_model.rds")
write_csv(data.frame(obs = x_test$default_flag, pred = pred_probs$Default), "outputs/model/test_predictions.csv")

# 📊 Step 8: Print Results
print(conf_matrix)
print(glue("AUC: {round(pROC::auc(roc_auc), 4)}"))
