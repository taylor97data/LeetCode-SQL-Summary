SELECT ROUND(
(SELECT COUNT(*) FROM activity a
INNER JOIN(
SELECT player_id,min(event_date) as firstdate
FROM activity
GROUP BY player_id) t1
ON a.player_id = t1.player_id
AND DATEDIFF(a.event_date, t1.firstdate) = 1)
/
(SELECT COUNT(DISTINCT player_id) FROM activity),2) as fraction
