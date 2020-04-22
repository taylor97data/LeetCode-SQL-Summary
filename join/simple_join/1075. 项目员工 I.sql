SELECT project_id, round(avg(experience_years),2) as average_years
FROM project
JOIN employee
USING(employee_id)
GROUP BY project_id
