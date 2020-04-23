SELECT a.student_id,a.student_name,b.subject_name,count(e.subject_name) as attended_exams 
from students a cross join Subjects b
    left join Examinations e on  a.student_id = e.student_id
and b.subject_name = e.subject_name
group by a.student_id, a.student_name,b.subject_name
order by a.student_id, a.student_name, b.subject_name
