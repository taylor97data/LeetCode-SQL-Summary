# Write your MySQL query statement below
SELECT depart_avg.pay_month,department_id,
case when d_avg > c_avg then 'higher'
when d_avg < c_avg then 'lower'
else 'same'
end as comparison
FROM 
(SELECT e.department_id,avg(amount)as d_avg,date_format(s.pay_date,'%Y-%m') as pay_month from salary s
left join employee e
on s.employee_id = e.employee_id
group by pay_month,e.department_id) depart_avg
left join 
(SELECT avg(amount) as c_avg,date_format(pay_date,'%Y-%m') as pay_month from salary
group by pay_month) com_avg
on depart_avg.pay_month = com_avg.pay_month

