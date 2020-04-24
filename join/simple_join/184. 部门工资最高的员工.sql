# Write your MySQL query statement below
SELECT d.name as department,e.name as employee,salary
FROM employee e
LEFT JOIN department d
ON e.departmentid = d.id
WHERE (d.name,salary)
IN(SELECT d.name, max(salary)
FROM employee e
LEFT JOIN department d
ON e.departmentid = d.id
GROUP BY d.name)
