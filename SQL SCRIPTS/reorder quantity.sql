WITH latest_date AS (
    -- Latest available date
    SELECT MAX(Date) AS max_date
    FROM sales
),

--  last 60 days sales per Store + Product
sales_60d AS (
    SELECT
        s.Store_ID,
        s.Product_ID,
        s.Units_Sold
    FROM sales s
    JOIN latest_date l
        ON s.Date BETWEEN DATE_SUB(l.max_date, INTERVAL 60 DAY)
                      AND l.max_date
),

-- demand statistics
demand_stats AS (
    SELECT
        Store_ID,
        Product_ID,
        AVG(Units_Sold) AS avg_daily_demand,
        STDDEV_POP(Units_Sold) AS stddev_daily_demand
    FROM sales_60d
    GROUP BY Store_ID, Product_ID
),

-- Reorder Point
reorder_point_calc AS (
    SELECT
        Store_ID,
        Product_ID,
        avg_daily_demand,
        stddev_daily_demand,
        (avg_daily_demand * 5) +
        (1.65 * stddev_daily_demand * SQRT(5)) AS reorder_point
    FROM demand_stats
),

--  latest inventory snapshot
latest_inventory AS (
    SELECT
        i.Store_ID,
        i.Product_ID,
        i.Inventory_Level
    FROM inventory i
    JOIN (
        SELECT Store_ID, Product_ID, MAX(Date) AS max_date
        FROM inventory
        GROUP BY Store_ID, Product_ID
    ) l
    ON i.Store_ID = l.Store_ID
    AND i.Product_ID = l.Product_ID
    AND i.Date = l.max_date
)

-- final Reorder Quantity
SELECT
    li.Store_ID,
    li.Product_ID,
    li.Inventory_Level AS current_stock,
    rp.reorder_point as reorderpoint_leadtime_fivedays,

    CASE
        WHEN li.Inventory_Level < rp.reorder_point
        THEN ROUND(rp.reorder_point - li.Inventory_Level)
        ELSE 0
    END AS reorder_quantity

FROM latest_inventory li
JOIN reorder_point_calc rp
    ON li.Store_ID = rp.Store_ID
    AND li.Product_ID = rp.Product_ID
ORDER BY li.Store_ID, li.Product_ID;
