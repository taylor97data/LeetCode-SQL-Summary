# Write your MySQL query statement below
SELECT project_id, employee_id 
FROM project
LEFT JOIN employee
USING(employee_id)
WHERE (project_id,experience_years) in
(SELECT project_id, max(experience_years) mey FROM employee
LEFT JOIN project
USING (employee_id)
GROUP BY project_id)
