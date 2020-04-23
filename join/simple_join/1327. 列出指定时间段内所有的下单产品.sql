# Write your MySQL query statement below
SELECT p.product_name, SUM(o.unit) UNIT
FROM products p
LEFT JOIN orders o
ON p.product_id = o.product_id
WHERE month(o.order_date) = 2
AND year(o.order_date) = 2020
GROUP BY p.product_name
HAVING sum(o.unit) >= 100
