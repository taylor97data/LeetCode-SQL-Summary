SELECT name FROM employee
WHERE ID IN(
SELECT managerID
FROM employee
GROUP BY managerID
HAVING COUNT(*) >= 5)
