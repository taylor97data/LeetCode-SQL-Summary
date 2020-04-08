# Write your MySQL query statement below
SELECT distinct page_id as recommended_page
FROM likes WHERE user_id IN
(SELECT user2_id as user_id FROM friendship
where user1_id = 1
UNION
SELECT user1_id as user_id FROM friendship
where user2_id = 1) 
AND page_id NOT IN
(SELECT page_id FROM likes
where user_id = 1)
