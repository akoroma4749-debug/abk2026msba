# 🧩 Capstone Branch: Drift Detection Model Implementation

This branch contains the **technical foundation** of our NYU MSBA capstone project — focused on detecting and visualizing **concept drift** in decision systems using deep learning.  
It expands upon the overview in the [`main`](../../tree/main) branch with full code, experiments, and supporting artifacts.

---

## 🧱 Project Scope

**Objective:**  
To design and evaluate machine learning models that detect **concept drift** — subtle, time-dependent shifts in data that can degrade predictive model accuracy and decision quality.

**Context:**  
Our case study simulates a historical **Lending Club** scenario to demonstrate how drift-aware AI can act as an early warning system for financial risk.

---

## 🧠 Methodology Overview

| Step | Description |
|------|--------------|
| **1. Data Preparation** | Synthetic Lending Club datasets were cleaned, transformed, and aligned to monthly cycles |
| **2. Model Architecture** | Deep autoencoders implemented for unsupervised drift detection |
| **3. Counterfactual Simulation** | Simulated alternative data states to test robustness |
| **4. Macroeconomic Overlay** | Integrated external signals (interest rates, credit trends) |
| **5. Visualization** | Drift timeline plots, anomaly heatmaps, and reconstruction error trends |

---

## 🧰 Technical Stack

- **Languages:** Python, R  
- **Libraries:** scikit-learn, Keras, pandas, matplotlib, seaborn  
- **Environment:** Jupyter Notebooks, GitHub, VS Code  
- **Visualization Tools:** Tableau (for presentation overlay)

---

## 📂 Folder Guide

| Folder | Contents |
|--------|-----------|
| `code/` | Core modeling scripts, drift detection logic, and utility functions |
| `data/` | Includes data documentation such as `data_dictionary.md` and `source_links.md` |
| `model/` | Model architectures, autoencoder configurations, and training outputs |
| `outputs/` | Generated results, performance summaries, and drift metrics |
| `team/` | Team roles, contributions, and collaboration details |
| `visualization code/` | Visualization scripts and supporting files for exploratory and presentation visuals |
| `images/` | Exported plots, charts, and final presentation visuals |
| `placeholder/` | Reserved for future expansion or additional reference files |

---

## 📊 Sample Outputs

| Visualization | Description |
|----------------|-------------|
| 🧮 **Reconstruction Error Plot** | Shows spikes during data drift intervals |
| 🌊 **Drift Timeline** | Illustrates how model performance evolves over time |
| 🧩 **Counterfactual Comparison** | Highlights data behavior under alternate simulated scenarios |

---

## 💡 Key Technical Insights

- **Early drift detection** enables faster strategic course corrections before model performance declines.  
- **Autoencoder-based anomaly scoring** effectively captures non-linear data shifts.  
- **Integrating macroeconomic overlays** reduces false positives and contextualizes model signals.  

These findings reinforce the importance of combining AI interpretability with business context to maintain trust and resilience in deployed decision systems.

---

## 👥 Team Contributors

| Name | Role |
|------|------|
| **Kevin Cardoso** | Lead Modeler (Autoencoder design, drift logic) |
| **Abdul Koroma** | Data Architecture, Repository Structure |
| **Alexandra Nieves** | EDA & Visualization |
| **Marissa Giron** | Business Context & Data Cleaning |
| **Antoni Jarecki** | Counterfactual Modeling |
| **Ellen Huang** | Macroeconomic Overlay Development |

---

## 🧭 Navigation

🔙 Return to the [`main`](../../tree/main) branch for:
- Full project overview  
- Team bios and academic context  
- Related repositories (Marketing Mix Model, Portfolio Homepage)

---

## 📬 Contact

📧 [akoroma4749@gmail.com](mailto:akoroma4749@gmail.com)  
🔗 [LinkedIn](https://www.linkedin.com/in/abdul-koroma-61019397)

