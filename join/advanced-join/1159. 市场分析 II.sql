SELECT user_id as seller_id,
CASE WHEN count(o.item_id) < 2 THEN 'no'
WHEN (SELECT i1.item_brand FROM items i1, orders o1, users u1
WHERE i1.item_id = o1.item_id and u1.user_id = o1.seller_id and u1.user_id = u.user_id
ORDER BY order_date ASC LIMIT 1,1) = u.favorite_brand THEN 'yes'
ELSE 'no' END AS 2nd_item_fav_brand
FROM users u
LEFT JOIN orders o
ON u.user_id = o.seller_id
GROUP BY user_id
