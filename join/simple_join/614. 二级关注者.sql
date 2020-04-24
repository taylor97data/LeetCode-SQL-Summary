# Write your MySQL query statement below
SELECT followee as follower, count(distinct follower) as num FROM follow
WHERE followee IN(SELECT distinct follower FROM follow)
GROUP BY followee
