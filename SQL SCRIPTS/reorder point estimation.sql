WITH latest_date AS (
    -- Step 1: Get latest date per store & product
    SELECT
        Store_ID,
        Product_ID,
        MAX(Date) AS max_date
    FROM sales
    GROUP BY Store_ID, Product_ID
),

rolling_60d AS (
    -- Step 2: Get last 60 days sales for each store & product
    SELECT
        s.Store_ID,
        s.Product_ID,
        s.Units_Sold,
        l.max_date
    FROM sales s
    JOIN latest_date l
        ON s.Store_ID = l.Store_ID
        AND s.Product_ID = l.Product_ID
    WHERE s.Date BETWEEN DATE_SUB(l.max_date, INTERVAL 60 DAY)
                     AND l.max_date
),

demand_stats AS (
    -- Step 3: Calculate mean and standard deviation
    SELECT
        Store_ID,
        Product_ID,
        AVG(Units_Sold) AS avg_daily_demand,
        STDDEV_POP(Units_Sold) AS stddev_daily_demand
    FROM rolling_60d
    GROUP BY Store_ID, Product_ID
)

-- Step 4: Final Reorder Point Calculation
SELECT
    Store_ID,
    Product_ID,
    avg_daily_demand,
    stddev_daily_demand,

    -- Demand during lead time
    (avg_daily_demand * 5) AS demand_during_lead_time,

    -- Safety Stock (Z * stddev * sqrt(LeadTime))
    (1.65 * stddev_daily_demand * SQRT(5)) AS safety_stock,

    -- Final Reorder Point
    (
        (avg_daily_demand * 5)
        +
        (1.65 * stddev_daily_demand * SQRT(5))
    ) AS reorder_point

FROM demand_stats
ORDER BY Store_ID, Product_ID;
