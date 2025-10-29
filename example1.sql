SELECT region, SUM(amount) AS total_sales
FROM sales
GROUP BY region;

SELECT region, AVG(amount) AS avg_sales
FROM sales
GROUP BY region
HAVING COUNT(*) > 1;

SELECT region, COALESCE(SUM(amount), 0) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC     
LIMIT 1;

SELECT
    COUNT(*) AS total_sales,
    COUNT(amount) AS non_zero_sales   
FROM sales;

SELECT region, SUM(amount) AS total_sales
FROM sales
GROUP BY region
HAVING SUM(amount) > (
    SELECT AVG(amount) FROM sales
);
