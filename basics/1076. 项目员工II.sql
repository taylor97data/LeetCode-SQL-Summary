SELECT project_id FROM project
GROUP BY project_id
HAVING COUNT(project_id) = 
(SELECT COUNT(1) 
FROM project
GROUP BY project_id
ORDER BY COUNT(1) DESC LIMIT 1);
