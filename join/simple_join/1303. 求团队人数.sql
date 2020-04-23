# Write your MySQL query statement below
SELECT employee_id,team_size
FROM employee
INNER JOIN(SELECT distinct team_id, count(team_id) as team_size
from employee
group by team_id) t
USING(team_id)
