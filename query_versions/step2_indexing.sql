
CREATE DATABASE assignment2;
USE assignment2


CREATE INDEX idx_segment_sales_cat_subcat
  ON superstore_final_dataset(segment, sales, region, category, sub_category);

EXPLAIN ANALYZE 
WITH filtered AS (
  SELECT
    region,
    category,
    sub_category,
    COUNT(DISTINCT order_id) AS num_orders,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_order_value,
    MAX(order_date) AS last_order_date
  FROM superstore_final_dataset FORCE INDEX (idx_segment_sales_cat_subcat)
  WHERE segment = 'Consumer'
    AND sales > 120
  GROUP BY region, category, sub_category
)
SELECT *
FROM filtered
WHERE total_sales > 10000
ORDER BY
  total_sales DESC,
  avg_order_value DESC; 
