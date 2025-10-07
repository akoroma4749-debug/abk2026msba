# 📉 Model Drift Analysis Report

This document summarizes key findings from our model drift detection experiments, using both classical and deep learning–based approaches.

---

## 🔍 Objective

To detect and measure **covariate shift** and **prediction drift** between training and post-training datasets using:

- Deep Autoencoders (Unsupervised)
- Random Forest with Population Stability Index (PSI)
- KS and Chi-Squared Tests
- Rolling Performance Monitoring

---

## 📊 Key Findings

### 1. Autoencoder-Based Drift Detection

- Trained a deep autoencoder on 2020 Lending Club data.
- Tested on 2021–2022 Lending Club data.
- **Average reconstruction loss increased by 12.5%**, indicating moderate drift.
- Visuals:
  - [`autoencoder_loss_distribution.png`](charts/autoencoder_loss_distribution.png)
  - [`reconstruction_error_boxplot.png`](charts/reconstruction_error_boxplot.png)

### 2. PSI Score (Population Stability Index)

| Feature              | PSI Score | Drift Level |
|----------------------|-----------|-------------|
| `fico_range_high`    | 0.26      | Moderate    |
| `annual_inc`         | 0.41      | Severe      |
| `verification_status`| 0.13      | Low         |

> ⚠️ *Features with PSI > 0.25 suggest moderate to severe drift.*

### 3. Rolling AUC and Accuracy

- AUC dropped from 0.84 to 0.75 on recent validation data
- Accuracy decline of ~5% indicates predictive performance degradation

### 4. Statistical Testing Summary

- **KS Tests**: Significant shift in `loan_amnt` and `annual_inc`
- **Chi-Square**: `purpose` and `home_ownership` show evolving categorical distributions

---

## 🧩 Interpretation

Model drift is non-trivial and appears to correlate with:

- Changes in borrower income and employment verification post-pandemic
- Shifts in borrower behavior due to macroeconomic volatility

---

## 📎 Recommendations

- Retrain baseline model quarterly or when AUC drops > 0.05
- Monitor high-drift features using PSI and KS in production
- Reassess feature selection pipeline (e.g., normalize income metrics)
- Explore domain adaptation techniques for higher resilience

---

## 🔗 Next Steps

- Integrate drift triggers into model pipeline
- Build dashboard visualizations for drift alerts
- Compare drift performance across alternative model types
