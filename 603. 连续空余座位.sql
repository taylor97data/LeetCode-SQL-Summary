SELECT DISTINCT a.seat_id
FROM cinema as a join cinema as b
ON abs(a.seat_id - b.seat_id) = 1
AND a.free = 1 and b.free = 1
ORDER BY a.seat_id
