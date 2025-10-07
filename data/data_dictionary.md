# 🧬 Capstone Data Dictionary

This file provides a unified schema for all variables used across our primary datasets (synthetic, LendingClub, and FRED macroeconomic overlay). Each entry includes the variable name, type, source, and a short description.

---

### 🔹 Synthetic Drift Dataset (Haselhorst et al.)

| Variable        | Type      | Description                                       |
|----------------|-----------|---------------------------------------------------|
| feature_1       | Numeric   | Artificial feature simulating gradual drift       |
| feature_2       | Numeric   | Static feature across time                        |
| label           | Categorical | Target variable (0 = negative, 1 = positive)    |
| drift_period    | Integer   | Time-step label where drift begins                |

---

### 🔹 LendingClub Dataset (Kaggle)

| Variable               | Type      | Description                                               |
|------------------------|-----------|-----------------------------------------------------------|
| loan_amnt              | Numeric   | Total amount funded by the lender                         |
| term                   | Categorical | Loan term in months (e.g., "36 months", "60 months")   |
| int_rate               | Numeric   | Interest rate on the loan                                 |
| installment            | Numeric   | Monthly payment amount due                                |
| grade                  | Categorical | Credit rating assigned by LendingClub                    |
| emp_length             | Categorical | Length of employment (e.g., "10+ years", "<1 year")     |
| home_ownership         | Categorical | Type of home ownership (e.g., RENT, MORTGAGE)            |
| annual_inc             | Numeric   | Annual income reported by the borrower                    |
| purpose                | Categorical | Stated loan purpose (e.g., "debt_consolidation")         |
| addr_state             | Categorical | U.S. state of borrower                                    |
| dti                    | Numeric   | Debt-to-income ratio                                      |
| delinq_2yrs            | Numeric   | Number of delinquencies in the past 2 years               |
| total_acc              | Numeric   | Total number of credit lines                              |
| issue_d                | Date      | Loan issue date                                           |
| loan_status            | Categorical | Current loan status (e.g., "Fully Paid", "Charged Off") |

---

### 🔹 FRED Macroeconomic Overlay

| Variable      | Type      | Description                                         |
|---------------|-----------|-----------------------------------------------------|
| GDP           | Numeric   | Quarterly U.S. Gross Domestic Product ($ Billions) |
| UNRATE        | Numeric   | Monthly Unemployment Rate (%)                      |
| CPIAUCSL      | Numeric   | Consumer Price Index (All Urban Consumers)         |
| date          | Date      | Timestamp associated with each macro datapoint     |

---

## 📌 Notes

- Feature engineering (e.g., `log_annual_inc`, `int_rate_bucket`, `dti_score`) is handled in the modeling pipeline under `/code/feature_engineering.R`
- Missing value imputation and variable binning is documented in `/code/data_prep.R`
- Variable usage by model type is outlined in `/model/model_coverage.md` (WIP)
