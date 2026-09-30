-- Sales breakdown by customer segment and category
SELECT 
    segment,
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY segment, category
ORDER BY segment, total_sales DESC;