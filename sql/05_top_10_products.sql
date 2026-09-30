-- Top 10 products by total revenue
SELECT 
    product_name,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(*) AS times_sold
FROM superstore
GROUP BY product_name, category
ORDER BY total_sales DESC
LIMIT 10;