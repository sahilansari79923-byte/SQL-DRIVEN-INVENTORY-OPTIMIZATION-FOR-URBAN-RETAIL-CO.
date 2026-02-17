WITH latest_date AS (
    SELECT MAX(Date) AS max_date
    FROM sales
),

sales_30d AS (
    SELECT
        s.Store_ID,
        s.Product_ID,
        SUM(s.Units_Sold) AS total_units_30d
    FROM sales s
    JOIN latest_date l
        ON s.Date BETWEEN DATE_SUB(l.max_date, INTERVAL 30 DAY)
                      AND l.max_date
    GROUP BY s.Store_ID, s.Product_ID
),

daily_avg AS (
    SELECT
        Store_ID,
        Product_ID,
        total_units_30d / 30.0 AS avg_daily_demand
    FROM sales_30d
)

SELECT
    Store_ID,
    Product_ID,
    avg_daily_demand,

    -- Forecast next 7 days
    (avg_daily_demand * 7) AS forecast_next_7_days,

    -- Forecast next 30 days
    (avg_daily_demand * 30) AS forecast_next_30_days

FROM daily_avg
ORDER BY Store_ID, Product_ID;
