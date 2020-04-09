# Write your MySQL query statement below
SELECT c.customer_id, customer_name
FROM customers c
INNER JOIN(
SELECT distinct customer_id from orders
where customer_id in(SELECT customer_id from orders 
where product_name = 'A') and product_name = 'B' and customer_id NOT IN (select customer_id from orders where product_name = 'C')) t
ON c.customer_id = t.customer_id
ORDER BY c.customer_id
