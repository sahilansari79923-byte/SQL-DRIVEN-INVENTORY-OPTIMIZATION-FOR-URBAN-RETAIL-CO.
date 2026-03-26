# Inventory Optimization Analysis (SQL + BI)

## Problem Statement  

A product goes out of stock — sales are lost.  
Another sits in storage for months — capital is blocked.  

Urban Retail Co. is facing both.

This project analyzes inventory data across stores and warehouses to answer a simple but critical question:

**How do we reduce stockouts *and* overstock at the same time?**

Using SQL-driven analytics, the project builds a system to monitor stock, detect risks early, and optimize inventory decisions.

---

## Project Overview  

Urban Retail Co. is a mid-sized retailer managing **5,000+ SKUs** across multiple locations.

The project focuses on:

- Tracking real-time inventory levels  
- Identifying low-stock and stockout risks  
- Detecting excess and dead stock  
- Measuring demand patterns and promotion impact  
- Building decision-ready KPIs for business teams  

Pipeline:

**Raw Data → Cleaning → SQL Analysis → KPI Layer → Power BI Dashboard**

---

## Key Insights  

- Stock imbalances exist across categories — some products frequently stock out while others remain unsold  
- Fast-moving products require tighter reorder planning to avoid revenue loss  
- Slow-moving inventory locks working capital and increases holding cost  
- Promotions significantly influence demand patterns and need better alignment with inventory planning  
- Inventory turnover varies widely across product categories — highlighting inefficiencies  

---
## Project Structure  

inventory-optimization/
│
├── data/
│ ├── raw/
│ └── processed/
│
├── sql/
│ ├── stock_availability.sql
│ ├── low_stock_alert.sql
│ ├── inventory_turnover.sql
│ ├── demand_forecasting.sql
│ ├── reorder_point.sql
│ └── reorder_quantity.sql
│
├── dashboard/
│ └── inventory_dashboard.pbix
│
├── erd/
│ └── schema_design.png
│
├── report/
│ └── executive_summary.docx
│
└── README.md


---

## Approach  

### 1. Data Preparation  
- Imported datasets: sales, inventory, products, stores, calendar, forecasts, promotions  
- Cleaned missing values, inconsistent IDs, and negative inventory  
- Standardized data types and handled null timestamps  

### 2. Database Design  
- Built relational schema using MySQL Workbench  
- Defined primary & foreign keys  
- Optimized queries using indexing  

### 3. SQL Analysis  
- Calculated key inventory KPIs  
- Segmented products (Fast / Moderate / Slow) using turnover  
- Built logic for stock alerts and reorder recommendations  

### 4. Visualization  
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

- Reduced stockout risk through early alerts  
- Identified excess inventory to free up working capital  
- Improved demand planning using data insights  
- Enabled better decision-making with clear KPIs  

---

## Tools Used  

- MySQL  
- Excel  
- Power BI  
- MySQL Workbench  

---

## Final Note  

This project focuses on **turning raw inventory data into actionable business decisions** — not just dashboards, but insights that directly impact revenue and operations.
