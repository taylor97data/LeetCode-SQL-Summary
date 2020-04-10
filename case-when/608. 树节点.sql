# Write your MySQL query statement below
SELECT id,CASE WHEN p_id is null THEN 'Root'
    WHEN id in (SELECT p_id FROM tree) THEN 'Inner'
    ELSE 'Leaf'
END AS Type
FROM tree;
