# Customer Segmentation & Sales Performance Analysis
### UK Online Retailer | SQL + Python + Power BI | 2009-2011

End-to-end data analytics project analyzing 1 million+ real e-commerce transactions to identify high-value customers, top-performing products, and seasonal revenue patterns.

---

## Dashboard Preview

### Page 1 - Executive Overview
![Executive Overview](images/page1_executive_overview.png)

### Page 2 - Product Performance
![Product Performance](images/page2_product_performance.png)

### Page 3 - Customer Segmentation
![Customer Segmentation](images/page3_customer_segmentation.png)

### Page 4 - Trends & Seasonality
![Trends & Seasonality](images/page4_trends_seasonality.png)

---

## Business Problem

A UK-based online retailer wanted answers to three core business questions:

1. Which customers drive the most revenue and are we at risk of losing them?
2. Which products should we prioritize for stock, pricing, and marketing?
3. When and where does revenue concentrate and how should we plan for it?

---

## Key Findings

| Finding | Detail |
|---|---|
| Revenue concentration | Champions segment (839 customers, 14% of base) generated £9.88M — 57% of total revenue |
| Customer loyalty | 72.39% repeat customer rate |
| Q4 seasonality | November (£2.07M) and December (£2.32M) are 2x the H1 monthly average |
| Geographic concentration | 83% of revenue from UK |
| B2B buying pattern | Peak orders Thursday 10am-12pm — near-zero weekend activity |
| At risk customers | 880 customers previously bought frequently but have not recently |

---

## Tools Used

| Tool | Purpose |
|---|---|
| Python (Pandas) | Data cleaning and RFM segmentation |
| PostgreSQL | Database storage and SQL business queries |
| SQLAlchemy | Python-to-PostgreSQL connection |
| Power BI (DAX) | Interactive 4-page dashboard |
| Jupyter Notebook | Cleaning and segmentation notebooks |

---

## Repository Structure

```
retail-analytics-project/
├── README.md
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_load_to_sql.ipynb
│   └── 03_rfm_segmentation.ipynb
├── sql/
│   ├── q1_monthly_revenue.sql
│   ├── q2_top_products.sql
│   ├── q3_revenue_by_country.sql
│   ├── q4_repeat_customers.sql
│   └── q5_avg_order_value.sql
├── powerbi/
│   └── retail_dashboard.pbix
├── data/
│   └── cleaned/
│       ├── rfm_segments.csv
│       └── README.md
├── reports/
│   └── findings_and_recommendations.pdf
└── images/
    ├── page1_executive_overview.png
    ├── page2_product_performance.png
    ├── page3_customer_segmentation.png
    └── page4_trends_seasonality.png
```

---

## Phase 1 - Data Cleaning (Python/Pandas)

**Notebook:** notebooks/01_data_cleaning.ipynb

Raw dataset: 1,067,371 rows with multiple quality issues.

| Issue | Rows affected | Action taken |
|---|---|---|
| Missing CustomerID | ~243,000 (23%) | Dropped — cannot segment unknown customers |
| Cancelled orders | ~9,288 | Filtered out — not completed sales |
| Negative quantity | Several thousand | Filtered (Quantity > 0) |
| Zero or negative price | Several hundred | Filtered (UnitPrice > 0) |
| Exact duplicate rows | Some | Removed with drop_duplicates() |

**Result: 779,425 clean rows ready for analysis.**

Additional steps:
- Created TotalPrice column (Quantity x UnitPrice)
- Renamed columns to standard names
- Converted InvoiceDate to proper datetime format

---

## Phase 2 - SQL Analysis (PostgreSQL)

**Notebook:** notebooks/02_load_to_sql.ipynb

Loaded cleaned data into PostgreSQL and wrote 5 business queries:

| Query file | Business question |
|---|---|
| q1_monthly_revenue.sql | Is revenue growing? When does it peak? |
| q2_top_products.sql | Which products drive the most revenue? |
| q3_revenue_by_country.sql | Where are customers geographically concentrated? |
| q4_repeat_customers.sql | What share of customers ever came back? |
| q5_avg_order_value.sql | How much does a customer spend per order visit? |

---

## Phase 3 - RFM Customer Segmentation (Python)

**Notebook:** notebooks/03_rfm_segmentation.ipynb

RFM (Recency, Frequency, Monetary) model segmenting 5,878 customers:

| Segment | Customers | % of base | Revenue | % of revenue |
|---|---|---|---|---|
| Champions | 839 | 14.3% | £9,883,516 | 56.9% |
| Loyal Customers | 1,220 | 20.8% | £3,446,019 | 19.8% |
| At Risk | 880 | 15.0% | £2,165,028 | 12.5% |
| Potential Loyalist | 2,167 | 36.9% | £1,626,686 | 9.4% |
| Lost | 772 | 13.1% | £253,556 | 1.5% |

---

## Phase 4 - Power BI Dashboard

**File:** powerbi/retail_dashboard.pbix

4-page interactive dashboard with DAX measures, cross-filtering slicers, navigation buttons, reset bookmarks, conditional formatting heatmap, and custom tooltips.

| Page | Key visuals |
|---|---|
| Executive Overview | 5 KPI cards, monthly revenue line, country bar chart, YoY comparison, day-of-week chart |
| Product Performance | Top 10 by revenue, top 10 by units, product detail table with slicers |
| Customer Segmentation | RFM donut, revenue by segment bar, scatter plot, segment summary table |
| Trends & Seasonality | Monthly trend with average line, hour-of-day chart, day/hour heatmap, quarterly YoY |

---

## Business Recommendations

**1. Protect Champions — prioritize retention over acquisition**

Losing 10% of Champions removes approximately £988K annually. Implement a loyalty program for this segment before spending on new customer acquisition.

**2. Plan for Q4 — build inventory in September**

November and December generate more than double the H1 monthly average. Inventory and staffing increases should begin in September.

**3. Re-engage At Risk customers immediately**

880 customers previously bought frequently but have not recently. A targeted win-back campaign is far more cost-effective than acquiring new customers.

**4. Eliminate weekend marketing spend**

Saturday generated only 30 orders across the entire 2-year dataset. Redirect budget to Thursday morning campaigns when ordering peaks.

**5. Evaluate international expansion**

EIRE and Netherlands show £0.6M revenue each with likely zero targeted marketing. Small localization investment could yield disproportionate returns.

---

## Dataset

**Online Retail II (UCI)**

- Source: [Kaggle](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci)
- Size: 1,067,371 transactions
- Period: December 2009 to December 2011
- Countries: 38+

The cleaned dataset (cleaned_retail_data.csv) is not stored here due to file size (~55MB). See data/cleaned/README.md for download instructions.

---

## How to Reproduce

```bash
# 1. Clone this repository
git clone https://github.com/jubayer-cse/retail-analytics-project.git

# 2. Install Python dependencies
pip install pandas numpy sqlalchemy psycopg2-binary jupyter

# 3. Download dataset from Kaggle
# https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci

# 4. Run notebooks in order
# 01_data_cleaning.ipynb
# 02_load_to_sql.ipynb
# 03_rfm_segmentation.ipynb

# 5. Open Power BI file
# powerbi/retail_dashboard.pbix
```

---

## About

**Md. Jubayer** — Data Analyst

Open to Data Analyst opportunities globally.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](www.linkedin.com/in/md-jubayer-cse-ml)
[![GitHub](https://img.shields.io/badge/GitHub-Profile-black)](https://github.com/jubayer-cse)
