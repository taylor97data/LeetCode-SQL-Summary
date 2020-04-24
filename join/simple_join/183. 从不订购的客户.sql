# Write your MySQL query statement below
SELECT name as customers
FROM customers
WHERE id not in
(select customerid from orders)
