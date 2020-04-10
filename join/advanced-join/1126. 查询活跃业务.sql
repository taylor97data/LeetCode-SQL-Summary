SELECT e.business_id
FROM Events e
JOIN
(SELECT event_type, avg(occurences) as avg_event
FROM events
GROUP BY event_type) as e1
on e.event_type = e1.event_type
AND e.occurences > e1.avg_event
GROUP BY e.business_id
HAVING count(*) >= 2;
