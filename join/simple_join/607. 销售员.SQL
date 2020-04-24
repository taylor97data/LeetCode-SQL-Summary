# Write your MySQL query statement below
SELECT name FROM salesperson
WHERE sales_id NOT IN(
SELECT sales_id FROM orders
WHERE com_id = (SELECT com_id FROM company WHERE name = 'RED'))

                
SELECT
    S.name
FROM
    salesperson S
    LEFT JOIN
    orders O ON S.sales_id = O.sales_id
    LEFT JOIN
    company C ON O.com_id = C.com_id
GROUP BY
    S.name
HAVING
    SUM(IF(C.name = 'RED', 1, 0))  = 0
ORDER BY
    S.sales_id
