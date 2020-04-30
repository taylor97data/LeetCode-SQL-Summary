# Write your MySQL query statement below
SELECT requester_id as id,COUNT(*)num FROM(
SELECT requester_id FROM request_accepted
UNION ALL
SELECT accepter_id FROM request_accepted) temp
GROUP BY requester_id
ORDER BY num DESC
LIMIT 1
