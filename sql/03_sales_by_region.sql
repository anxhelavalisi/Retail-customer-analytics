-- Total sales by region
SELECT 
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(DISTINCT order_id) AS num_orders,
    COUNT(DISTINCT customer_id) AS num_customers
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;