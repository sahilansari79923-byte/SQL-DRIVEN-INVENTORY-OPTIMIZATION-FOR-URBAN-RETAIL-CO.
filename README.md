# SOLVING INVENTORY INEFFICIENCIES USING SQL (SQL SCRIPTS, SCHEMA DESIGN, KPI DASHBOARD, EXECUTIVE SUMMARY)
### Project Overview:
This project tackles inventory management inefficiencies at “Urban Retail Co”, a mid-sized retailer with >5,000 SKUs across stores and warehouses. The goal is to use SQL-based analytics to reduce stockouts and overstocking by generating key metrics (stock levels, reorder points, turnover, supplier KPIs).
### Deliverables:
* SQL scripts
* Entity Relationship Diagram (ERD)
* Inventory KPI dashboard/report
* executive summary
### Problem Statement
Urban Retail Co. faces a classic inventory dilemma—frequent stockouts of fast-moving items and overstock of slow-moving products.
This project uses SQL-based analytics on a relational database to:

* Monitor real-time stock across products and stores
* Detect low-stock and stockout risks early
* Identify dead stock and excess inventory
* Measure the impact of discounts and promotions on sales
### Steps followed
 * Loaded CSV data (sales, inventory, product master, store master, calendar, forecast, promotions) into MySQL.
 * Designed relational schema in MySQL Workbench with primary keys, foreign keys, and indexes.
 * Performed data cleaning & profiling (missing values, inconsistent IDs, negative inventory, datatype standardization).
 * Handled null timestamps & forecast values, excluding them from KPIs when appropriate.
 * Calculated key KPIs (inventory turnover, stockout risk, forecast accuracy) using clean data only.
 * Built reporting layer in Excel/Power BI with a clean, consistent visual theme.
 * Added visuals (bar charts, KPI cards) for stock levels, low-stock alerts, and turnover insights.
 * Added slicers for Store, Category, Promotion Flag, Holiday/Season filters.
 * Used card visuals to show turnover, low-stock SKUs, and capital locked in overstock (invalid/null values filtered).
 * Created stock distribution charts by product, category, and store for overstock/understock insights.
 * Classified product movement types (Fast / Moderate / Slow) using SQL-based turnover logic.
 * Added report text boxes for project title, company name, and SQL-driven approach summary.
 * Applied branding elements (logo, colors) for a professional dashboard look.
 * Wrote SQL for movement segmentation (Fast/Moderate/Slow) using turnover rate.
 * Wrote SQL for current stock by store and product (matrix used for low-stock alerts).
 * Calculated Inventory Turnover Ratio using SQL and visualized it with KPI cards and bar charts.
 * Analyzed promotion impact on sales using SQL and compared with visuals.
 * Exported final report as PDF and prepared it for Power BI dashboard integration.

![Dashboard Preview](https://github.com/sahilansari79923-byte/SQL-DRIVEN-INVENTORY-OPTIMIZATION-FOR-URBAN-RETAIL-CO./blob/main/snaps%20shorts/Screenshot%202025-12-04%20145611.png)

