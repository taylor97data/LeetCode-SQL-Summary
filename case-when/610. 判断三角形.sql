# Write your MySQL query statement below
SELECT x,y,z,case when x+y<=z or x+z<=y or y+z<=x then 'No'
                when x+y>z or x+z>y or z+y >x then 'Yes'
                end as triangle
FROM triangle;
