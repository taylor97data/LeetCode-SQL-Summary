SELECT login_date,count(*) as user_count
FROM
(SELECT user_id, min(activity_date) as login_date
FROM traffic
WHERE activity = 'login'
GROUP BY user_id
HAVING DATEDIFF('2019-06-30',min(activity_date)) <= 90) tmp
GROUP BY login_date
