# Retail Customer Analytics

End-to-end analysis of retail sales and customer behavior using **Python, SQL, Tableau and machine learning (K-Means customer segmentation)**.

---

## Project Overview

This project analyzes four years (2015-2018) of transaction data from a retail superstore to understand how sales perform across product categories, regions and customer segments, and to identify which customers drive the most revenue.

It covers a complete analytics workflow: data cleaning and EDA in Python, business queries in SQL, an interactive Tableau dashboard, and a K-Means model that groups customers into actionable segments.

---

## Business Questions

1. Which **product categories** generate the most revenue, and which sell most often?
2. How do **regions** compare in orders, customers and revenue?
3. Which **products** drive the highest sales?
4. How do sales change **over time**, and is there seasonality?
5. Which **customer groups** are the most valuable, and how should they be targeted?

---

## Dataset

- **Source:** Superstore Sales dataset (Kaggle) - [add link]
- **Period:** 2015-2018
- **Scope:** 4,922 orders from 793 customers
- **Key fields:** Order ID, Order Date, Customer ID, Segment, Region, Category, Sub-Category, Product Name, Sales

The raw CSV is not stored in this repository. See `data/dataset_source.md` for download instructions.

---

## Tools & Technologies

| Tool | Purpose |
| ---- | ------- |
| **Python** (pandas, NumPy, matplotlib, seaborn, scikit-learn) | Data cleaning, EDA, customer segmentation |
| **Jupyter / VS Code** | Notebook development |
| **SQL** (MySQL) | Business KPI and aggregation queries |
| **DBeaver** | Database management and SQL query execution |
| **Tableau Cloud** | Interactive dashboard |
| **Git / GitHub** | Version control and portfolio hosting |

> While Excel is commonly used for initial data exploration, this project uses Python for more scalable and reproducible analysis.

---

## Workflow

### 1. Data Cleaning & EDA (Python)
`python/01_data_cleaning_eda.ipynb`

- Checked shape, column types and missing values
- Converted date columns from strings to `datetime`
- Kept missing values as `NaN` since they do not affect the analysis
- Verified **0 duplicate rows**
- Profiled `Sales`: mean $230.77 vs. median $54.49, which shows a **right-skewed distribution** (many small sales, a few very large ones)
- Used a **log-scale histogram** to make the distribution readable despite outliers (most sales fall between $10 and $500)

### 2. Business Queries (SQL)
`sql/`

Six queries executed in **DBeaver**, each cross-checked against the Python results:

| # | Query | Finding |
| - | ----- | ------- |
| 1 | KPI overview | 4,922 orders, 793 customers, $2,261,536.78 revenue, $230.77 average sale |
| 2 | Sales by Category | Office Supplies has the most orders (3,676) but lower revenue: cheap products that sell often |
| 3 | Sales by Region | The South has fewer orders **and** fewer customers, not just lower spend per customer |
| 4 | Monthly Sales Trend | Growth from 2015 to 2018, with peaks in Nov-Dec and a dip in January |
| 5 | Top 10 Products | Canon imageCLASS 2200 Copier ranks #1 with $61,599 from only 5 sales |
| 6 | Segment x Category | Technology leads in all three segments (Consumer, Corporate, Home Office) |

### 3. Dashboard (Tableau Cloud)
Four sheets: Sales by Category, Sales by Region, Monthly Sales Trend (by month and year), and Top 10 Products.

[View the dashboard on Tableau](#) - *add public link*

![Dashboard](dashboard/dashboard_preview.png)

### 4. Customer Segmentation (K-Means)
`python/02_customer_segmentation.ipynb`

- Built **RFM-style features** for each of the 793 customers: Frequency (distinct orders) and Monetary (total sales)
- Scaled features with `StandardScaler`, since Frequency and Monetary are on very different scales and K-Means is distance-based
- Chose **K = 4** with the Elbow Method (tested K = 1 to 10)
- Named the clusters by business meaning:

| Segment | Customers | Profile |
| ------- | --------- | ------- |
| **VIP** | 70 (8.8%) | Avg. spend $9,185, **28.43% of total revenue** |
| **Loyal Regular** | 175 | Orders often (avg. 9.39 orders), moderate value |
| **Average** | 300 (largest group) | 34.13% of total revenue |
| **Occasional** | 248 | Lowest frequency and spend |

---

## Key Insights

- **8.8% of customers (VIPs) generate about 28% of revenue**, the Pareto (80/20) pattern at customer level.
- **A few expensive products drive a large share of revenue**: the #1 product earned $61,599 from just 5 sales.
- **Office Supplies wins on volume, not revenue**: the most orders, but lower-priced items.
- **Technology dominates every customer segment**, not just one.
- **Sales grow year over year and are seasonal**: peaks in November-December, a dip in January.
- **The South underperforms on both orders and customer count**, which points to a reach problem rather than a spending problem.

### Business Recommendations
- Protect and reward **VIP** customers (loyalty perks, early access, dedicated service).
- Turn **Loyal Regulars** into VIPs with bundles and upsells.
- Run re-engagement campaigns for **Occasional** customers.
- Plan inventory and marketing around the **Nov-Dec** peak.
- Investigate acquisition in the **South** region.

---

## Repository Structure

```
retail-customer-analytics/
│
├── data/
│   └── dataset_source.md
│
├── python/
│   ├── 01_data_cleaning_eda.ipynb
│   └── 02_customer_segmentation.ipynb
│
├── sql/
│   └── business_queries.sql
│
├── dashboard/
│   └── dashboard_preview.png
│
├── .gitignore
└── README.md
```

---

## How to Run

```bash
git clone https://github.com/anxhelavalisi/retail-customer-analytics.git
cd retail-customer-analytics
python -m venv venv
venv\Scripts\activate        # Windows  (Mac/Linux: source venv/bin/activate)
pip install pandas numpy matplotlib seaborn jupyter scikit-learn openpyxl
```

Download the dataset (see `data/dataset_source.md`), place it in `data/` as `superstore.csv`, then open the notebooks in `python/`.

---

## Author

**Anxhela Valisi**
Aspiring Data Analyst | Python · SQL · Tableau · Machine Learning

[LinkedIn](#) · [GitHub](https://github.com/anxhelavalisi)
