-- Overall business KPIs: total revenue, total orders, total customers
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(AVG(sales), 2) AS avg_sale_value
FROM superstore;