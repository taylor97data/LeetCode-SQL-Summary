SELECT employee_id FROM employees
WHERE manager_id = 1
AND employee_id !=1
UNION
SELECT employee_id FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees
WHERE manager_id = 1)
AND employee_id !=1
UNION
SELECT employee_id FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees
WHERE manager_id = 1 AND employee_id !=1))
