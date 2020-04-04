SELECT customer_number FROM orders
GROUP BY customer_number
HAVING COUNT(order_number) = 
(SELECT COUNT(order_number)
from orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1)

####窗口函数写法

SELECT customer_number
FROM
(SELECT customer_number,RANK() OVER (ORDER BY COUNT(customer_number) DESC) as order_num
FROM orders
GROUP BY customer_number)t
WHERE t.order_num = 1

