# 📦 Load Libraries
library(tidyverse)
library(janitor)
library(lubridate)
library(forcats)
library(readr)

# 📂 Load Cleaned Lending Data
lending <- read_csv("data/processed/lending_clean.csv")

# 🧠 Custom Feature Engineering
lending_features <- lending %>%
  mutate(
    # 1️⃣ Income Buckets
    income_bracket = case_when(
      annual_inc < 40000 ~ "Low",
      annual_inc >= 40000 & annual_inc < 80000 ~ "Medium",
      annual_inc >= 80000 ~ "High",
      TRUE ~ NA_character_
    ),
    
    # 2️⃣ DTI Buckets
    dti_bucket = case_when(
      dti < 10 ~ "Low",
      dti >= 10 & dti < 20 ~ "Medium",
      dti >= 20 ~ "High",
      TRUE ~ NA_character_
    ),
    
    # 3️⃣ Credit-to-Income Ratio
    credit_income_ratio = loan_amnt / (annual_inc + 1),
    
    # 4️⃣ Term Encoding (if needed for tree-based models)
    term_binary = if_else(term == "36 months", 0, 1),
    
    # 5️⃣ Interaction Term: Interest Rate * Term
    rate_term_interact = int_rate * term_binary,
    
    # 6️⃣ Loan Purpose Simplification
    purpose_grouped = fct_collapse(purpose,
      "debt_consolidation" = c("debt_consolidation"),
      "credit_card" = c("credit_card"),
      "major_purchase" = c("major_purchase", "home_improvement"),
      "small_business" = c("small_business", "renewable_energy"),
      "other" = c("moving", "vacation", "medical", "other")
    ),
    
    # 7️⃣ Log Feature for Skewed Variables
    log_credit_ratio = log1p(credit_income_ratio)
  ) %>%
  mutate(
    across(c(income_bracket, dti_bucket, purpose_grouped), factor)
  )

# 💾 Save Engineered Dataset
write_csv(lending_features, "data/processed/lending_features.csv")
