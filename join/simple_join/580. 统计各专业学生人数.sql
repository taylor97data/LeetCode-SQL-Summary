SELECT dept_name,count(s.student_id) as student_number FROM department d
LEFT JOIN student s
USING(dept_id)
GROUP BY dept_name
ORDER BY student_number DESC, dept_name
