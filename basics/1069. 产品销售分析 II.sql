SELECT s.product_id, sum(s.quantity) as total_quantity
FROM sales as s
LEFT JOIN product as p
USING(product_id)
GROUP BY s.product_id;
