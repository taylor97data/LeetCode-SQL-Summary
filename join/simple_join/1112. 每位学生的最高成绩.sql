SELECT student_id,min(course_id) as course_id,grade
FROM enrollments
WHERE (student_id,grade) 
in(SELECT student_id,max(grade)
FROM enrollments
GROUP BY student_id)
GROUP BY student_id
