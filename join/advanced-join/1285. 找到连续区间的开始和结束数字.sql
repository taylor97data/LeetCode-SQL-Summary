SELECT a.log_id as start_id, b.log_id as end_id from (

SELECT log_id from logs where log_id-1 not in (select log_id from logs))a
join (
SELECT log_id from logs where log_id+1 not in (select log_id from logs)) b
on a.log_id <= b.log_id
group by a.log_id
