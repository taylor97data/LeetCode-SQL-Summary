# Write your MySQL query statement below
SELECT distinct s1.sub_id as post_id, count(distinct s2.sub_id)as number_of_comments
FROM submissions s1
LEFT JOIN submissions s2
ON s1.sub_id = s2.parent_id
WHERE s1.parent_id is null
GROUP BY s1.sub_id
