SELECT
round(min(sqrt(power(p1.x-p2.x,2) + power(p1.y-p2.y,2))),2) shortest
FROM
point_2d p1 join point_2d p2 on p1.x < p2.x or (p1.x = p2.x and p1.y < p2.y)
