# 🧠 Baseline Model Summary: Random Forest Classifier

This file summarizes the baseline classification model used to predict borrower default risk in the Lending Club dataset. The model is trained on historical loan data and uses engineered features from the preprocessed dataset (`lending_features.csv`).

---

## 🔍 Objective

To predict the binary outcome of **loan default** using structured Lending Club loan data. The model serves as a starting point for further refinement and drift analysis.

---

## ⚙️ Model Type

- **Model**: Random Forest Classifier
- **Framework**: `caret` (R)
- **Tuning**: 5-fold cross-validation using AUC as performance metric
- **Data Split**: 80% training / 20% testing (stratified by default rate)

---

## 🧱 Feature Engineering

The model used features such as:

- **Numerical**: `loan_amnt`, `annual_inc`, `fico_range_high`, `dti`, etc.
- **Categorical (dummy-encoded)**: `home_ownership`, `verification_status`, `application_type`, etc.
- **Engineered**: `income_to_loan_ratio`, `fico_gap`, etc.

Removed variables with high cardinality or ambiguity: `emp_title`, `sub_grade`, `purpose`, `term`.

---

## 📊 Performance Metrics (on Holdout Set)

| Metric           | Value   |
|------------------|---------|
| AUC (ROC)        | 0.84    |
| Accuracy         | 0.79    |
| Precision        | 0.72    |
| Recall (Sensitivity) | 0.68 |
| F1 Score         | 0.70    |

> 📌 *Note: These are sample numbers. You’ll update them based on actual training output from `model_training.R`.*

---

## 📁 Artifacts

- Trained model object: `outputs/model/rf_model.rds`
- Predictions (test set): `outputs/model/test_predictions.csv`
- Model training script: [`model_training.R`](model_training.R)

---

## 🚧 Next Steps

- Run drift detection using autoencoders and domain shifts
- Evaluate second model (XGBoost, LightGBM)
- Integrate dashboard/app for model transparency
