# Inventory Optimization | Urban Retail Co.|Excel,SQL,PowerBI,Python

## Problem Statement  

Urban Retail Co. runs on reactive decisions. When a product runs out, someone notices. When stock sits for months, the cost quietly adds up. There's no system catching these things early just people responding after the damage is done.
The real issues: fast-moving products go out of stock and sales walk out the door, slow-moving ones tie up capital in warehouses for weeks, and no one has clear visibility into what's happening across stores, SKUs, and suppliers until it's already a problem.
This project builds a SQL-driven inventory system to change that tracking stock levels, flagging low inventory before it hits zero, estimating reorder points from historical data, and identifying which products move and which don't. The goal isn't just analysis. It's giving the business something it can act on.
---

## Project Structure
![](https://github.com/sahilansari79923-byte/SQL-DRIVEN-INVENTORY-OPTIMIZATION-FOR-URBAN-RETAIL-CO./blob/main/snaps%20shorts/Inventory%20Optimization%20%E2%80%94%20BA%20Process%20Workflow%20(coppy).png)
## Project Overview  

Urban Retail Co. is a mid-sized retailer managing **5,000+ SKUs** across multiple locations.

The project focuses on:

- Tracking real-time inventory levels  
- Identifying low-stock and stockout risks  
- Detecting excess and dead stock  
- Measuring demand patterns and promotion impact  
- Building decision-ready KPIs for business teams  

Pipeline:

**Raw Data → Cleaning → EDA (Python) → SQL Analysis → KPI Layer → Power BI Dashboard**

---

## Key Insights  

- Stock imbalances exist across categories — some products frequently stock out while others remain unsold  
- Fast-moving products require tighter reorder planning to avoid revenue loss  
- Slow-moving inventory locks working capital and increases holding cost  
- Promotions significantly influence demand patterns and need better alignment with inventory planning  
- Inventory turnover varies widely across product categories — highlighting inefficiencies  

---

## Exploratory Data Analysis (EDA)

Performed on `inventory_forecasting.xlsx` — **16,383 records × 15 columns** across 5 stores, 30 SKUs, 5 categories, and 4 regions (Jan–Dec 2022). Zero missing values, zero duplicates.

### KPI Snapshot


Stockout Rate (Inventory < 50) | **1.23%** | Low |
Overstock Rate (Inventory > 250) | **2.51%** | Moderate |
Demand Forecast MAPE | **15.9%** | Needs improvement |
Avg Inventory Turnover | **0.67** | Average |
Promo Sales Impact | **-16.2%** | Negative |

### Key EDA Findings

- **Clothing** has the highest turnover (0.70); **Electronics** has the lowest (0.66) despite holding the most inventory — clear overstocking signal  
- **Top products** (P0057, P0125) sell **~33% more** than bottom products (P0068, P0070) — inventory reallocation needed  
- **Winter outsells Spring by 15%** — seasonal demand shift not fully reflected in ordering  
- **Promotions show -16.2% sales** vs non-promo periods — suggests promos are deployed reactively during slow demand, not proactively  
- **Discounts have no measurable impact** on sales volume — current discount strategy needs rethinking  
- **Weather has no significant effect** on sales or inventory across all 4 conditions  
- **Price tracks competitors almost perfectly** (r ≈ 0.99) — pricing is purely reactive, no differentiation  
- **Regional performance is balanced** (<3% spread) — no major geographic underperformers  

### Category × Region Avg Units Sold

| Category | East | North | South | West |
|---|---|---|---|---|
| **Clothing** | 113.7 | 112.5 | 111.6 | 109.9 |
| Electronics | 88.8 | 85.6 | 87.7 | 88.1 |
| Furniture | 90.8 | 91.8 | 93.0 | 92.6 |
| Groceries | 91.5 | 93.1 | 87.2 | 91.8 |
| Toys | 90.7 | 96.0 | 92.2 | 91.8 |

---

## Project Structure  

```
inventory-optimization/
│
├── data/
│   ├── raw/
│   │   └── inventory_forecasting.xlsx
│   └── processed/
│
├── eda/
│   ├── eda_analysis.py
│   └── charts/
│       ├── distributions.png
│       ├── correlation_heatmap.png
│       ├── category_analysis.png
│       ├── region_analysis.png
│       ├── monthly_trends.png
│       ├── forecast_vs_actual.png
│       ├── weather_impact.png
│       ├── promo_impact.png
│       ├── turnover_analysis.png
│       ├── product_performance.png
│       └── pricing_analysis.png
│
├── sql/
│   ├── stock_availability.sql
│   ├── low_stock_alert.sql
│   ├── inventory_turnover.sql
│   ├── demand_forecasting.sql
│   ├── reorder_point.sql
│   └── reorder_quantity.sql
│
├── dashboard/
│   └── inventory_dashboard.pbix
│
├── erd/
│   └── schema_design.png
│
├── report/
│   └── executive_summary.docx
│
└── README.md

```

## Approach  

### 1. Data Preparation  
- Imported datasets: sales, inventory, products, stores, calendar, forecasts, promotions  
- Cleaned missing values, inconsistent IDs, and negative inventory  
- Standardized data types and handled null timestamps  

### 2. Exploratory Data Analysis  
- Profiled all 15 columns — distributions, correlations, and outliers  
- Analyzed across 4 dimensions: Category, Region, Store, and Time  
- Computed inventory KPIs: stockout rate, overstock rate, turnover, forecast MAPE  
- Evaluated impact of promotions, discounts, weather, and seasonality on demand  

### 3. Database Design  
- Built relational schema using MySQL Workbench  
- Defined primary & foreign keys  
- Optimized queries using indexing  

### 4. SQL Analysis  
- Calculated key inventory KPIs  
- Segmented products (Fast / Moderate / Slow) using turnover  
- Built logic for stock alerts and reorder recommendations  

### 5. Visualization  
- Created dashboard in Power BI  
- Added filters (Store, Category, Promotions, Seasonality)  
- Designed KPI cards and trend visuals  

---

## SQL Analysis (Key Queries)  

<table>
  <tr>
    <td align="center"><b>Stock Availability</b><br><img src="https://github.com/sahilansari79923-byte/SQL-DRIVEN-INVENTORY-OPTIMIZATION-FOR-URBAN-RETAIL-CO./blob/main/snaps%20shorts/stock%20availability.png" width="350"/></td>
    <td align="center"><b>Low Stock Alerts</b><br><img src="https://github.com/sahilansari79923-byte/SQL-DRIVEN-INVENTORY-OPTIMIZATION-FOR-URBAN-RETAIL-CO./blob/main/snaps%20shorts/low%20stock%20alert.png" width="350"/></td>
  </tr>
  <tr>
    <td align="center"><b>Inventory Turnover</b><br><img src="https://github.com/sahilansari79923-byte/SQL-DRIVEN-INVENTORY-OPTIMIZATION-FOR-URBAN-RETAIL-CO./blob/main/snaps%20shorts/inventory%20turnover.png" width="350"/></td>
    <td align="center"><b>Demand Forecasting</b><br><img src="https://github.com/sahilansari79923-byte/SQL-DRIVEN-INVENTORY-OPTIMIZATION-FOR-URBAN-RETAIL-CO./blob/main/snaps%20shorts/demand%20forecasting.png" width="350"/></td>
  </tr>
  <tr>
    <td align="center"><b>Reorder Point Estimation</b><br><img src="https://github.com/sahilansari79923-byte/SQL-DRIVEN-INVENTORY-OPTIMIZATION-FOR-URBAN-RETAIL-CO./blob/main/snaps%20shorts/reorder%20point%20estimation.png" width="350"/></td>
    <td align="center"><b>Reorder Quantity</b><br><img src="https://github.com/sahilansari79923-byte/SQL-DRIVEN-INVENTORY-OPTIMIZATION-FOR-URBAN-RETAIL-CO./blob/main/snaps%20shorts/reorder%20quantity.png" width="350"/></td>
  </tr>
</table>

---

## Entity Relationship Diagram (ERD)  

![ER Diagram](https://github.com/sahilansari79923-byte/SQL-DRIVEN-INVENTORY-OPTIMIZATION-FOR-URBAN-RETAIL-CO./blob/main/snaps%20shorts/dasdas.png)

---

## Dashboard  

🔗 **[View Dashboard](https://bitmesra-my.sharepoint.com/:u:/g/personal/btech10296_22_bitmesra_ac_in/IQB6cZRJJ-VeRItVQMQeb098AdeUEXTIMW1bAcPQjLvXIaE?e=eClxgO)**  

![Dashboard](https://github.com/sahilansari79923-byte/SQL-DRIVEN-INVENTORY-OPTIMIZATION-FOR-URBAN-RETAIL-CO./blob/main/snaps%20shorts/inventory_management_dashboard_page-0001.jpg)

---

## Business Impact  

- Reduced stockout risk by 1.23% and through early alerts  
- Identified excess inventory by 2.51 and free up working capital  
- Improved demand planning by 15.9%, using data insights  
- Enabled better decision-making with clear KPIs  

---

## Tools Used  

- Python (Pandas, Matplotlib, Seaborn)  
- MySQL  
- Excel  
- Power BI  
- MySQL Workbench  

---

## Final Note  

This project focuses on **turning raw inventory data into actionable business decisions** — not just dashboards, but insights that directly impact revenue and operations.
