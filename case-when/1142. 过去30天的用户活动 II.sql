SELECT ifnull(round(avg(session_count),2),0) as average_sessions_per_user 
FROM
(SELECT user_id, count(distinct session_id) as session_count
FROM activity
WHERE datediff('2019-07-27',activity_date) <= 29
GROUP BY user_id) TEMP;


