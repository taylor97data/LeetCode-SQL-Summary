SELECT u.user_id as buyer_id, join_date, ifnull(temp.order_count,0) as orders_in_2019
FROM users u
LEFT JOIN(
SELECT buyer_id, count(order_id) as order_count
FROM orders
WHERE datediff('2019-12-31',order_date) < 365
GROUP BY buyer_id) temp
ON temp.buyer_id = u.user_id;

