# 🧠 NYU MSBA Capstone: Drift Detection & Strategic Insights

![Capstone Banner](images/capstone_banner.png)

> *Exploring how concept drift and anomaly detection can identify early risk signals in dynamic business systems — bridging data science, governance, and strategic decision-making.*

---

## 🔍 Project Overview

- **Goal:** Develop and evaluate machine learning models that detect drift and structural shifts in real-world decision systems.  
- **Case Focus:** Historical **Lending Club** data, reframed through forward-looking drift modeling to simulate early warning signals of portfolio deterioration.  
- **Value Proposition:** Demonstrates how **AI reliability and model interpretability** can inform proactive business strategy, reducing risk and improving decision transparency.

**Why It Matters:**  
In volatile environments — whether financial, operational, or customer-facing — drift modeling provides an early lens into when models or assumptions start to fail. This bridges **AI accountability** with **business foresight**, a key theme across responsible-AI practices.

---

## 🧮 Modeling Techniques

| Technique | Objective |
|------------|------------|
| **Deep Autoencoders** | Unsupervised drift detection via reconstruction error analysis |
| **Counterfactual Simulations** | Stress testing model outputs across synthetic and real-world data |
| **Macroeconomic Overlays** | External variable integration to capture systemic signals |
| **Anomaly Tracking Dashboards** | Visualizing drift magnitude and behavioral impact over time |

---

## 📊 Visualizations

### 🧭 Overview  
These visuals illustrate how drift was detected, quantified, and contextualized — bridging the technical model outputs with strategic business implications.  
Each figure represents a different dimension of interpretability and foresight in the drift detection pipeline.

---

### 1️⃣ **Feature-Level Drift Overview**
![Drift Heatmap](images/drift_heatmap.png)  
*Monthly feature drift intensity (KS-statistic). Higher scores indicate structural instability across loan and borrower attributes.*

🔹 **Purpose:** Establishes *where* drift occurs across features and *when* the data began to diverge.  
🔹 **Key Insight:** Borrower-related variables (income ratio, DTI, loan purpose) show consistent instability during 2016–2017 — preceding LendingClub’s risk inflection point.

---

### 2️⃣ **Model Performance Sensitivity**
![Autoencoder Reconstruction Error](images/reconstruction_error.png)  
*Reconstruction error over time. Spikes correspond to months with significant deviations between predicted and actual data distributions.*

🔹 **Purpose:** Demonstrates how the autoencoder detects drift in latent feature space.  
🔹 **Key Insight:** Error spikes correlate with observed performance degradation — validating unsupervised drift monitoring as an early-warning signal.

---

### 3️⃣ **Feature Interpretability**
![Feature Drift (SHAP Summary)](images/feature_drift.png)  
*Top 10 features influencing model drift, highlighting the shift in borrower income ratios and loan purposes.*

🔹 **Purpose:** Explains *why* drift occurs through feature importance and SHAP interpretability.  
🔹 **Key Insight:** Income- and credit-based features contributed most to instability, suggesting evolving borrower profiles as a key driver.

---

### 4️⃣ **Temporal Risk Pattern**
![Temporal Drift Magnitude](images/drift_timeseries.png)  
*Overall drift magnitude index over time. Early signals emerge several months before LendingClub’s performance inflection point.*

🔹 **Purpose:** Summarizes the cumulative drift pattern, visualizing *when* structural change first emerged.  
🔹 **Key Insight:** Drift signals consistently preceded macro performance shifts by 2–3 quarters, confirming predictive value for early intervention.

---

### 5️⃣ **External Context & Correlation**
![Macroeconomic Overlay](images/macro_overlay.png)  
*Overlay of macroeconomic indicators (interest rate spread, unemployment rate) against drift magnitude — illustrating external correlation.*

🔹 **Purpose:** Connects model drift to external business and economic factors.  
🔹 **Key Insight:** Drift magnitude increases during tightening interest rate spreads and rising unemployment, underscoring the model’s sensitivity to macro conditions.

---

### 🧩 Section Summary  
Together, these visuals move from **detection → explanation → timing → context** — showing not only how drift occurs, but *why it matters* to business strategy and operational stability.  
This aligns directly with the goals of **reliable AI systems** and **data-informed decision frameworks** central to Anthropic’s mission.

---

## 👥 Team Contributions

| Name | Role(s) |
|------|----------|
| **Kevin Cardoso** | Lead Strategist, Lead Modeler (Autoencoder, drift logic) |
| **Abdul Koroma** | Data Architecture, Pipeline Optimization, GitHub Structuring |
| **Alexandra Nieves** | Exploratory Data Analysis, BI Visualization |
| **Marissa Giron** | Business Context Framing, Data Cleaning, BI Support |
| **Antoni Jarecki** | Counterfactual Scenario Modeling |
| **Ellen Huang** | Macroeconomic Overlay Construction |

🧠 Detailed team breakdown: [`/team/team_contributions.md`](team/team_contributions.md)

---

## ⚙️ Tech Stack
`Python • Scikit-learn • PyTorch • Pandas • R • Tableau • Jupyter • VS Code`

---

## 📂 Folder Guide

| Folder | Description |
|--------|--------------|
| `notebooks/` | Machine learning experiments & drift modeling notebooks |
| `data/` | Preprocessed datasets and documentation |
| `methodology/` | Write-ups of model logic, comparisons, and findings |
| `team/` | Member roles, contributions, and coordination files |
| `presentation/` | Final deck and visuals used for stakeholder presentation |
| `visuals_code/` | Lightweight Python scripts used to generate visuals |
| `images/` | Static exported visuals referenced in the README |

---

## 🧠 Key Takeaways

- Autoencoder-based drift detection outperformed classical tests for multidimensional drift.  
- Integration of macroeconomic and counterfactual data enhanced interpretability.  
- The framework can extend beyond fintech — e.g., **customer success drift**, **operational reliability**, or **AI validation pipelines**.

---

## 🤝 Collaboration Principles

This project was developed using AI tools (ChatGPT, Claude, etc.) for refinement and documentation — not fabrication — aligning with **Anthropic’s values of reliability, interpretability, and human-centered AI**.

---

## 📬 Contact

**Abdul Koroma** — Data Architecture & Strategy  
📫 [akoroma4749@gmail.com](mailto:akoroma4749@gmail.com) | [LinkedIn](https://www.linkedin.com/in/abdul-koroma-61019397)

---

*© 2025 NYU MSBA Capstone Team. For educational and professional demonstration purposes only.*

