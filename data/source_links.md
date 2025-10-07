# 📊 Dataset Source Links

This file documents all primary and secondary data sources used in our capstone project, including public datasets, synthetic data from academic papers, and any exploratory alternatives we considered.

---

## 🔹 1. Synthetic Drift Dataset (DNN Autoencoder Paper)

- **Source**: *"Drift Detection Based on Deep Neural Networks and Autoencoders"*
- **Authors**: Thomas Haselhorst, Jörg Frochte
- **Download Link**: [GitHub Repo](https://github.com/thomas-haselhorst/drift-detection-dnn-autoencoder)
- **Description**: Provides synthetic datasets tailored for drift experiments using deep learning architectures. This was used as a **benchmark dataset** for our early validation and modeling pipeline setup.
- **Usage in Project**: Used for replication of baseline model and comparative evaluation of drift sensitivity metrics.

---

## 🔹 2. LendingClub Loan Data (Historical Drift Use Case)

- **Source**: [Kaggle LendingClub Dataset](https://www.kaggle.com/datasets/wordsforthewise/lending-club)
- **Host**: Kaggle
- **Description**: A rich dataset of consumer lending behavior, including loan application attributes, repayment statuses, and issue dates.
- **Usage in Project**: Used to simulate a **real-world model drift scenario**, where credit risk models become less accurate over time due to changing borrower profiles and macroeconomic conditions.

---

## 🔹 3. FRED Economic Indicators (Macroeconomic Overlay)

- **Source**: [Federal Reserve Economic Data (FRED)](https://fred.stlouisfed.org/)
- **Selected Series**:
  - **GDP Growth**: [GDP](https://fred.stlouisfed.org/series/GDP)
  - **Unemployment Rate**: [UNRATE](https://fred.stlouisfed.org/series/UNRATE)
  - **Consumer Price Index (CPI)**: [CPIAUCSL](https://fred.stlouisfed.org/series/CPIAUCSL)
- **Usage in Project**: Overlayed as **external drift drivers** to test macro-level influence on prediction quality deterioration.

---

## 🔹 4. UCI Credit Approval Dataset (Exploratory Use)

- **Source**: [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/credit+approval)
- **Description**: Smaller dataset used for initial pipeline experimentation. Includes anonymized credit approval features.
- **Usage in Project**: Explored during early modeling drafts; not used in final evaluation.

---

## 🔹 5. Smart City / Energy Datasets (Experimental)

- **Sources**:
  - NYC Open Data – [Energy Benchmarking](https://data.cityofnewyork.us/Environment/NYC-Building-Energy-Benchmarking/2k7d-ruhb)
  - DOE Open Data – [Building Energy Use](https://openei.org/datasets/dataset/building-energy-usage)
- **Usage in Project**: Potentially used for domain transfer learning / exploratory transfer tests.
- **Status**: Tagged as experimental — not used in final drift analysis.

---

## 🧠 Notes & References

- Any data transformation, cleaning scripts, or engineered features based on these datasets are stored in `/code/data_prep.R` and described in `/data/data_dictionary.md`.
- Licensing: All sources are open-access or publicly available for academic/non-commercial use.
