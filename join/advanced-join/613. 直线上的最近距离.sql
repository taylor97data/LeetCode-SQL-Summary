# Write your MySQL query statement below
SELECT min(abs(p1.x - p2.x)) shortest FROM point p1
JOIN point p2
ON p1.x != p2.x
