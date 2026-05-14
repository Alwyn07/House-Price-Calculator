# 🏠 House Price Prediction — Linear Regression in MATLAB

A supervised machine learning project that predicts house prices using **Multiple Linear Regression**, built entirely in MATLAB. Trained and evaluated on a combined dataset of 8,000 housing records.

---

## 📊 Results

| Metric | Value |
|--------|-------|
| **R² Score** | 0.9193 |
| **RMSE** | $100,671.29 |
| **Adjusted R²** | 0.918 |
| **F-statistic** | 1.78 × 10⁴ (p = 0) |
| **Observations** | 8,000 |

> The model explains **~92% of variance** in house prices — all features statistically significant (p ≈ 0).

---

## 📁 Project Structure

```
├── AI_project.m       # Main MATLAB script
├── housing.csv        # Dataset 1
├── housing 2.csv      # Dataset 2
└── README.md
```

---

## 🔧 Features Used

| Feature | Description |
|---------|-------------|
| `Avg_AreaIncome` | Average income of area residents |
| `Avg_AreaNumberOfRooms` | Average number of rooms |
| `Avg_AreaNumberOfBedrooms` | Average number of bedrooms |
| `Avg_AreaHouseAge` | Average age of houses in the area |
| `AreaPopulation` | Population of the area |

**Target:** `Price` (house sale price in USD)

---

## ⚙️ Pipeline

```
Data Collection → Integration → Cleaning → Feature Selection
→ Normalization → Train/Test Split (80/20) → fitlm → Evaluation → Visualization
```

1. **Data Integration** — Two CSV datasets merged with `[data1; data2]`
2. **Cleaning** — Removed missing values (`rmmissing`) and duplicates (`unique`)
3. **Normalization** — Z-score normalization via `normalize()`
4. **Split** — 80% train / 20% test using `cvpartition` with `HoldOut`
5. **Model** — `fitlm()` (Ordinary Least Squares)
6. **Evaluation** — RMSE and R² computed on test set

---

## 📈 Visualizations

| Plot | Insight |
|------|---------|
| Actual vs Predicted | Points tightly follow the perfect-fit line |
| Error Distribution | Near-normal, centered at 0 — no systematic bias |
| Residuals vs Predicted | Random scatter — assumptions satisfied |
| Feature Importance | Income and House Age are top predictors |

---

## 🚀 How to Run

**Requirements:** MATLAB R2020b or later (Statistics and Machine Learning Toolbox)

```matlab
% Clone or download the repo, then in MATLAB:
run('AI_project.m')
```

Make sure `housing.csv` and `housing 2.csv` are in the same directory as the script.

---

## 📦 Dependencies

- MATLAB Statistics and Machine Learning Toolbox
  - `fitlm` — linear model fitting
  - `cvpartition` — cross-validation partitioning
  - `normalize` — feature scaling

---

## 📌 Key Findings

- **Income** (x1) has the strongest effect on price (coeff ≈ 2.30 × 10⁵)
- **Bedrooms** (x3) had the weakest and only marginally significant effect (p = 0.062)
- Residuals are well-behaved → linear regression assumptions hold

---

## 👤 Author

> Add your name, institution, and LinkedIn/GitHub here.

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
