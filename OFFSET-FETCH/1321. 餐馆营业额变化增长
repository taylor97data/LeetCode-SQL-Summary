SELECT t1.visited_on,sum(t2.amount) amount, ROUND(SUM(t2.amount)/7.0,2) average_amount FROM
(SELECT DISTINCT visited_on FROM customer
WHERE visited_on >= DATE_ADD((SELECT MIN(visited_on) FROM customer), INTERVAL 6 DAY)) t1
LEFT JOIN
customer t2
ON t1.visited_on <= DATE_ADD(t2.visited_on, INTERVAL 6 DAY)
AND t1.visited_on >= t2.visited_on
GROUP BY t1.visited_on
