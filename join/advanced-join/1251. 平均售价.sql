SELECT p.product_id,ROUND(sum(p.price*u.units)/sum(u.units),2) as average_price
FROM prices p
INNER JOIN unitssold u
ON p.product_id = u.product_id
AND u.purchase_date between start_date and end_date
GROUP BY p.product_id
