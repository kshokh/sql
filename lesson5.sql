SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

SELECT DISTINCT d.*
FROM departments d
JOIN employees e ON e.department_id = d.id
WHERE e.salary > 10000;

SELECT p.id, p.name, SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id, p.name
ORDER BY total_quantity DESC;

SELECT c.id,
       c.name,
       COUNT(o.id) AS order_count
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name
ORDER BY order_count DESC;

SELECT d.id,
       d.name,
       AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e ON e.department_id = d.id
GROUP BY d.id, d.name
ORDER BY avg_salary DESC
LIMIT 3;

SELECT c.id, c.name, c.city
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
WHERE o.id IS NULL;

SELECT *
FROM employees e
WHERE salary > ALL (
    SELECT DISTINCT m.salary
    FROM employees m
    WHERE m.id IN (SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL)
);

SELECT d.id, d.name
FROM departments d
JOIN employees e ON e.department_id = d.id
GROUP BY d.id, d.name
HAVING MIN(e.salary) > 5000;
