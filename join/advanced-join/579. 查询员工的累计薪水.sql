SELECT t1.id,t1.month,t1.salary from
(SELECT id,month, case when @pre_id = id then @salary:= @salary + salary else @salary:=salary end as salary,@pre_id:= id, @pre_month:=month
from employee,(select @pre_id:= 0, @salary:= 0)p
order by id, month)t1
left join
(select id,max(month) as max_month from employee
group by id) t2
on t1.id = t2.id
where t1.month >= max_month -3 and t1.month < max_month
order by t1.id,t1.month desc
