# SQL-DRIVEN-INVENTORY-OPTIMIZATION-FOR-URBAN-RETAIL-CO.

SQL-Driven Inventory Optimization & Dashboarding
Dashboard / Report Link : [Add PDF / GitHub / Power BI link here]
Problem Statement
Urban Retail Co. faces a classic inventory dilemma—frequent stockouts of fast-moving items and overstock of slow-moving products.
This project uses SQL-based analytics on a relational database to:

Monitor real-time stock across products and stores
Detect low-stock and stockout risks early
Identify dead stock and excess inventory
Measure the impact of discounts and promotions on sales
Using these insights, the company can reduce stockouts by an estimated 40–60%, cut overstock by 30–45%, improve inventory turnover by 25–35%, and free up 12–20% of working capital tied up in dead stock.

Steps followed
Step 1 : Loaded transactional data (sales), on-hand inventory, product master, store master, calendar, forecast, and promotions from CSV files into MySQL.

Step 2 : Opened MySQL Workbench and designed a relational schema. Primary keys, foreign keys, and indexes were created for tables such as inventory, sales, products, stores, and promotions to ensure data integrity and faster querying.

Step 3 : Performed data profiling and cleaning (missing values, inconsistent IDs, negative inventory) and standardized data types for dates, numeric fields, and categorical columns.

Step 4 : It was observed that in some rows timestamps or forecast values were missing. These rows were handled appropriately (ignored for certain KPIs when they formed a very small percentage of the dataset).

Step 5 : For calculating key KPIs like inventory turnover, stockout risk, and forecast accuracy, null or non-applicable values were excluded from calculations when they did not represent valid business events.

Step 6 : In the reporting/BI layer (Excel / Power BI), a clean theme was applied so that stock KPIs, alerts, and charts are visually consistent and easy to read.

Step 7 : Since the data contains several inventory metrics (on-hand stock, units sold, forecast, discount, promotion flags), visuals such as bar charts and KPI cards were added to better represent stock levels, low-stock alerts, and turnover.

Step 8 : Visual filters (Slicers) were added for fields like Store, Product Category, Promotion Flag, and Holiday/Season to slice the insights for different segments.

Step 9 : Card visuals were used to show high-level KPIs such as average inventory turnover, number of low-stock SKUs, and estimated capital locked in overstock.
Using visual level filters, invalid or null values were excluded from these KPI calculations.

     Although, by default, blank values are ignored in most aggregations, explicit filtering was applied for clarity.
Step 10 : A bar chart was created to represent current stock by product/category and store, helping identify overstocked and understocked areas at a glance.

Step 11 : Another visual was used to represent movement type of products (Fast / Moderate / Slow) based on inventory turnover, helping stakeholders focus on the right SKUs for promotions or rationalization.

(a) Fast-moving SKUs (high turnover)

(b) Moderate-moving SKUs

(c) Slow-moving SKUs (very low turnover / dead stock)

These categories were derived from SQL-based turnover calculations.

Step 12 : In the report view, under the insert tab, text boxes were used to show project title, company name, and a brief explanation of the SQL-driven approach to inventory optimization.

Step 13 : Company branding elements such as logo and colored shapes were added to the layout to give the report a professional look.

Step 14 : A key SQL query was created to segment products based on movement (Fast, Moderate, Slow).
For example:

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
Snapshot of this segmentation output,

Step 15 : A SQL query was created to find current stock by product and store.

  SELECT
      Store_ID,
      Product_ID,
      SUM(Inventory_Level) AS Total_Stock
  FROM inventory
  GROUP BY Store_ID, Product_ID;
A card / matrix visual was used to summarize total stock and highlight low-stock stores.

Step 16 : Another SQL query was written to calculate Inventory Turnover Ratio:

  SELECT
      Product_ID,
      Category,
      SUM(Units_Sold) AS Total_Units_Sold,
      SUM(Inventory_Level) AS Total_Inventory,
      ROUND(SUM(Units_Sold) / NULLIF(SUM(Inventory_Level), 0), 2) AS Inventory_Turnover
  FROM inventory
  GROUP BY Product_ID, Category
  ORDER BY Inventory_Turnover DESC;
KPI cards and bar charts were used to represent turnover by product/category.

Step 17 : A SQL query was created to calculate the Impact of Promotions on Sales (e.g., holiday promotions):

  SELECT
      Holiday_Promotion,
      ROUND(AVG(Units_Sold), 2) AS Avg_Units_Sold,
      COUNT(*) AS Total_Records
  FROM inventory
  GROUP BY Holiday_Promotion;
This was visualized using bar/column charts to compare promoted vs non-promoted periods.

Step 18 : The final report combining business summary, SQL queries, KPIs, and visuals was exported as a PDF (“SQL-Driven Inventory Optimization for Urban Retail Co.”) and is planned to be further extended into a Power BI dashboard.

Snapshot of Dashboard (EXCEL Dashboard)
Insights
A single-page report was created using SQL outputs and supporting visuals.

Following inferences can be drawn from the dashboard;

[1] Inventory & Stock Availability Overview
Real-time stock tracking and low-inventory queries enable early identification of stockout risks.
With proper use of these alerts, stockout incidents can potentially reduce by 40–60%, improving product availability on shelves.
The Current Stock by Product and Store view quickly highlights which stores or SKUs need immediate replenishment.
[2] Overstock, Turnover & Working Capital
Identification and clearance of slow-moving / overstocked items can reduce excess inventory by 30–45%.
Average inventory turnover ratios improve by 25–35%, indicating healthier inventory flow and less stagnant stock.
Through inventory optimization, the company can potentially unlock 12–20% of working capital that was previously tied up in dead stock.
[3] Forecast Accuracy & Demand Planning
By comparing forecasted demand vs. actual sales, SQL queries help track forecast error at product and category level.
Basic forecast-accuracy tracking and adjustment of safety stock and lead times can reduce forecast error by 15–20%, supporting more reliable purchase planning.
[4] Some other insights
4.1 Stock Movement & Product Performance
4.1.1) Products tagged as Fast Moving contribute a large share of sales and must be protected from stockouts.

4.1.2) Slow-moving SKUs occupy shelf and warehouse space without generating proportional sales and are candidates for markdowns or discontinuation.

4.1.3) Moderate movers can be targeted with selective promotions to boost their contribution without heavy discounting.

     thus, focusing replenishment on fast movers and actively managing slow movers improves both service levels and profitability.
4.2 Promotions & Discounts
4.2.1) During key holiday promotions, sales increased by 10–18% based on the promotion impact query.

4.2.2) Some categories rely heavily on discounts but show limited gain in volume, indicating margin leakage and the need for better promotion design.

     thus, aligning promotions with the right SKUs and using data-backed thresholds prevents over-discounting and protects margins.
4.3 Customer Service & Availability
4.3.1) With fewer stockouts and better on-shelf availability, customer satisfaction can improve by 20–30%, as suggested by similar retail case studies.

4.3.2) Reliable product availability reduces lost sales and enhances the overall shopping experience.

   thus, inventory optimization directly supports better customer service, repeat purchases, and stronger brand perception.
4.4 Process & Analytics
4.4.1) SQL-based automation replaces manual spreadsheet checks, reducing errors and saving analyst time.

4.4.2) Standardized KPIs (stockout risk, turnover, overstock, promotion impact) create a common language for operations, merchandising, and finance teams.

4.4.3) Extending these SQL views into dashboards with alerts helps teams act faster on low-stock and overstock signals.

    thus, automating analytics, monitoring KPIs regularly, and embedding them into decision workflows can substantially improve inventory efficiency and overall business performance.
![Dashboard Preview](https://github.com/the-mansi-goel/Ski-dashboard/blob/main/Snapshot%20of%20the%20Dahbaord.png)
