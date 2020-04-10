# Write your MySQL query statement below
SELECT request_at as Day, round(sum(if(status = 'cancelled_by_driver' or status = 'cancelled_by_client',1,0))/count(id),2) as 'cancellation rate'
from trips where client_id in(
SELECT users_id from users where banned = 'No') 
and request_at between '2013-10-01' and '2013-10-03'
group by request_at
