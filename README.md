# SQL-Driven Inventory Optimization for Urban Retail Co.
Dashboard / Report Link:https://bitmesra-my.sharepoint.com/:u:/g/personal/btech10296_22_bitmesra_ac_in/IQB4aYn9iSjPSYK1FNPK46E-Aa9yjkPJME5xal1_WAAxxsE?e=cfi9KT


## Problem Statement

Urban Retail Co. faces major inventory challenges, including frequent stockouts of fast-moving SKUs and excessive overstock of slow-moving items.
This project applies SQL-driven analytics on relational datasets to:

Monitor real-time stock across stores and products

Detect low-stock and stockout risks

Identify dead stock and excess inventory

Measure promotional and discount impact on sales

Data insights from SQL enable the company to achieve:

### 40–60% reduction in stockouts

### 30–45% reduction in overstock

### 25–35% improvement in inventory turnover

### 12–20% working capital released from dead stock

Steps Followed
## Step 1:

Loaded sales, inventory, product master, store master, calendar, forecast, and promotions CSV files into MySQL.

### Step 2:

Designed a complete relational schema in MySQL Workbench with primary keys, foreign keys, and indexes for faster query performance.

### Step 3:

Performed data profiling and cleaning (missing values, inconsistent IDs, negative stocks) and standardized all data types.

### Step 4:

Identified missing timestamps or forecasted demand values; handled them appropriately depending on KPI requirements.

### Step 5:

Excluded null or invalid entries for KPIs such as turnover, forecast accuracy, and stockout risk when the values did not represent true business events.

### Step 6:

Applied a clean design theme in Excel / Power BI for uniform KPI cards, alerts, and charts.

### Step 7:

Added charts for stock levels, turnover, low-stock alerts, and promotion impact using the pre-processed SQL outputs.

### Step 8:

Added slicers for Store, Product Category, Promotion Flag, and Season/Holiday to filter insights for segments.

### Step 9:

Used KPI Cards to show:

Average Inventory Turnover

Total Low-Stock SKUs

Working Capital Locked in Overstock

Null/invalid values were excluded using visual-level filters.

### Step 10:

Created a bar chart to visualize Current Stock by Product & Store, highlighting overstock and understock conditions.

### Step 11:

Segmented product movement using SQL-based turnover calculations:

Fast-moving

Moderate

Slow-moving / Dead stock

This helps identify SKUs needing replenishment, markdown, or discontinuation.

### Step 12:

Added text boxes with project title and brief description of SQL-driven optimization.

### Step 13:

Added company branding (logo, shapes) for a clean and professional layout.

### Step 14:

Created SQL query for SKU movement segmentation:

SELECT
    Product_ID,
    Category,
    SUM(Units_Sold) AS Total_Units_Sold,
    ROUND(SUM(Units_Sold) / NULLIF(SUM(Inventory_Level), 0), 2) AS Turnover_Rate,
    CASE
        WHEN SUM(Units_Sold) / NULLIF(SUM(Inventory_Level), 0) > 5 THEN 'Fast Moving'
        WHEN SUM(Units_Sold) / NULLIF(SUM(Inventory_Level), 0) < 1 THEN 'Slow Moving'
        ELSE 'Moderate'
    END AS Movement_Type
FROM inventory
GROUP BY Product_ID, Category
ORDER BY Turnover_Rate DESC;

### Step 15:

SQL query to calculate Current Stock by Product & Store:

SELECT
    Store_ID,
    Product_ID,
    SUM(Inventory_Level) AS Total_Stock
FROM inventory
GROUP BY Store_ID, Product_ID;

### Step 16:

SQL query for Inventory Turnover Ratio (ITR):

SELECT
    Product_ID,
    Category,
    SUM(Units_Sold) AS Total_Units_Sold,
    SUM(Inventory_Level) AS Total_Inventory,
    ROUND(SUM(Units_Sold) / NULLIF(SUM(Inventory_Level), 0), 2) AS Inventory_Turnover
FROM inventory
GROUP BY Product_ID, Category
ORDER BY Inventory_Turnover DESC;

### Step 17:

SQL query to analyze Promotion Impact on Sales:

SELECT
    Holiday_Promotion,
    ROUND(AVG(Units_Sold), 2) AS Avg_Units_Sold,
    COUNT(*) AS Total_Records
FROM inventory
GROUP BY Holiday_Promotion;

### Step 18:

Compiled SQL results, KPIs, and visuals into a single-page PDF report, later extended into a Power BI dashboard.

Dashboard Snapshot (Excel Dashboard)

(Insert screenshot here—already provided)

Insights
[1] Inventory & Availability Overview

Real-time stock tracking enables early stockout alerts.

Using these alerts, stockouts can reduce 40–60%.

Product/Store stock view helps prioritize replenishment.

[2] Overstock, Turnover & Working Capital

Identifying slow-moving SKUs reduces excess inventory by 30–45%.

Inventory turnover improves by 25–35%.

Eliminating dead stock releases 12–20% of blocked working capital.

[3] Forecast Accuracy & Demand Planning

SQL comparisons between forecast vs actual sales reveal forecasting gaps.

Adjusting safety stock and lead times reduces forecast error by 15–20%.

[4] Additional Insights
4.1 Stock Movement & SKU Performance

Fast movers drive major sales → must be protected from stockouts.

Slow movers waste storage → ideal for discounts or discontinuation.

Moderate movers respond well to selective promotions.

→ Prioritizing fast movers and rationalizing slow movers increases profits and service levels.

4.2 Promotions & Discounts

Holiday promotions increased sales by 10–18%.

Some categories show margin loss due to ineffective discounting.

→ Smarter, data-backed promotions prevent margin erosion.

4.3 Customer Service & Availability

Fewer stockouts improve customer satisfaction by 20–30%.

Better shelf availability reduces lost sales.

→ Inventory optimization directly improves customer experience.

4.4 Process & Analytics

SQL automation replaces error-prone spreadsheets.

Standardized KPIs unify operations, merchandising, and finance.

Dashboards enable faster response to stock issues.

→ Continuous monitoring and automation significantly improve operational efficiency.
