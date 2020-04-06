# Write your MySQL query statement below
SELECT date_format(trans_date,"%Y-%m") month, country,
count(id) trans_count,
count(if(state = 'approved', 1, null)) approved_count,
sum(amount) trans_total_amount,
sum(if(state = 'approved',amount,0)) approved_total_amount
from transactions
group by date_format(trans_date,"%Y-%m"),country;
