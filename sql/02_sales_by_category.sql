-- Total sales by category
SELECT 
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(DISTINCT order_id) AS num_orders
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;
