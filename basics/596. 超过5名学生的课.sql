SELECT class
FROM courses
GROUP BY class
HAVING Count(distinct student) >= 5;
