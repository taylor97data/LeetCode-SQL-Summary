SELECT s.product_id,year as first_year,quantity,price
FROM sales s
WHERE (product_id,year) in (
SELECT product_id, min(year) FROM sales GROUP BY product_id)



SELECT s.product_id,first_year,quantity,price
FROM sales s
INNER JOIN
(SELECT product_id, min(year) as first_year FROM sales
GROUP BY product_id) t
ON s.product_id = t.product_id and s.year = t.first_year
