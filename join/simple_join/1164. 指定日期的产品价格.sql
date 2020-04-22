SELECT p1.product_id, IFNULL(p2.new_price,10) as price
FROM(SELECT DISTINCT product_id FROM products) p1
LEFT JOIN(
SELECT product_id, new_price
FROM products
WHERE(product_id, change_date) IN(
SELECT product_id, max(change_date) 
FROM products
WHERE change_date <= '2019-08-16'
GROUP BY product_id)) p2
ON p1.product_id = p2.product_id
