	# Write your MySQL query statement below
	SELECT w2.id
	FROM weather w1
	LEFT JOIN weather w2
	ON DATEDIFF(w2.recorddate, w1.recorddate) = 1
	WHERE w2.temperature > w1.temperature
涉及到用日期进行条件筛选或者连接条件，必须用日期相关的函数。
