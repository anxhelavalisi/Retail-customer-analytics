-- Monthly sales trend over time
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;