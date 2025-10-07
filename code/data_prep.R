# 📦 Load Libraries
library(tidyverse)
library(janitor)
library(lubridate)
library(readr)

# 📂 Load Datasets
# Adjust paths as needed depending on your repo structure
lending_raw <- read_csv("data/raw/lendingclub.csv") %>% clean_names()
synthetic_raw <- read_csv("data/raw/synthetic_drift.csv") %>% clean_names()
macro_raw <- read_csv("data/raw/fred_macro.csv") %>% clean_names()

# 🧼 LendingClub Cleaning
lending_clean <- lending_raw %>%
  mutate(
    term = str_trim(term),
    emp_length = na_if(emp_length, "n/a"),
    emp_length = factor(emp_length, ordered = TRUE),
    issue_d = mdy(issue_d),
    annual_inc = ifelse(annual_inc < 0, NA, annual_inc),
    log_annual_inc = log1p(annual_inc),
    int_rate = as.numeric(str_remove(int_rate, "%")),
    dti = ifelse(dti < 0 | dti > 100, NA, dti),
    loan_status = factor(loan_status)
  ) %>%
  drop_na(loan_amnt, int_rate, loan_status)

# 🧼 Synthetic Drift Dataset
synthetic_clean <- synthetic_raw %>%
  mutate(
    drift_period = as.integer(drift_period),
    label = factor(label, levels = c(0, 1), labels = c("Negative", "Positive"))
  )

# 🧼 FRED Macroeconomic Data
macro_clean <- macro_raw %>%
  mutate(
    date = ymd(date),
    quarter = paste0(year(date), " Q", quarter(date))
  ) %>%
  select(-date)  # optional: drop raw date if merging on quarter

# 💾 Save Cleaned Files (Optional)
write_csv(lending_clean, "data/processed/lending_clean.csv")
write_csv(synthetic_clean, "data/processed/synthetic_clean.csv")
write_csv(macro_clean, "data/processed/macro_clean.csv")
