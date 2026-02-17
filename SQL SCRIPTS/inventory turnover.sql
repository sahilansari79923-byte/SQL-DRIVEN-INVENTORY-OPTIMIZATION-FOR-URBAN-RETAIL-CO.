WITH latest_date AS (
    SELECT MAX(Date) AS max_date
    FROM sales
),

sales_60d AS (
    SELECT
        Store_ID,
        Product_ID,
        SUM(Units_Sold) AS total_units_sold
    FROM sales s
    JOIN latest_date l
        ON s.Date BETWEEN DATE_SUB(l.max_date, INTERVAL 60 DAY)
                      AND l.max_date
    GROUP BY Store_ID, Product_ID
),

inventory_60d AS (
    SELECT
        Store_ID,
        Product_ID,
        AVG(Inventory_Level) AS avg_inventory
    FROM inventory i
    JOIN latest_date l
        ON i.Date BETWEEN DATE_SUB(l.max_date, INTERVAL 60 DAY)
                      AND l.max_date
    GROUP BY Store_ID, Product_ID
)

SELECT
    s.Store_ID,
    s.Product_ID,
    s.total_units_sold,
    i.avg_inventory,

    (s.total_units_sold / NULLIF(i.avg_inventory, 0)) AS inventory_turnover,

    CASE
        WHEN (s.total_units_sold / NULLIF(i.avg_inventory, 0)) >= 5 THEN 'Fast moving'
        WHEN (s.total_units_sold / NULLIF(i.avg_inventory, 0)) >= 2 THEN 'Healthy'
        WHEN (s.total_units_sold / NULLIF(i.avg_inventory, 0)) >= 1 THEN 'Slow moving'
        ELSE 'Dead stock'
    END AS turnover_category

FROM sales_60d s
JOIN inventory_60d i
    ON s.Store_ID = i.Store_ID
    AND s.Product_ID = i.Product_ID
ORDER BY inventory_turnover DESC;
