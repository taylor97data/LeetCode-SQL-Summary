SELECT DISTINCT a.Num AS ConsecutiveNums From Logs AS a, Logs As b, Logs AS c
WHERE a.id = b.id - 1
AND b.id = c.id -1
AND a.num = b.num 
AND b.num = c.num;
