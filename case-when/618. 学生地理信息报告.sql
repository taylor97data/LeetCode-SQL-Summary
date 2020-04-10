SELECT America, Asia, Europe FROM
(SELECT @amid:= 0, @asid:= 0, @euid:= 0) t,(SELECT @asid:=@asid + 1 as row_id, name as Asia
from student
where continent = 'Asia'Order by Asia
) t1
RIGHT JOIN
(SELECT @amid:=@amid + 1 as row_id, name as America
from student
where continent = 'America' Order by America
) t2
ON t1.row_id = t2.row_id
LEFT JOIN
(SELECT @euid:=@euid + 1 as row_id, name as Europe
from student
where continent = 'Europe' Order by Europe) t3
ON t2.row_id = t3.row_id
