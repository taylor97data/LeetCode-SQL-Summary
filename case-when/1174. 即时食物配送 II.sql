SELECT ROUND(100 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)/COUNT(*),2) as immediate_percentage
FROM Delivery
WHERE(customer_id, order_date) in
(
    select customer_id,min(order_date)
    FROM delivery
    group by customer_id
)
