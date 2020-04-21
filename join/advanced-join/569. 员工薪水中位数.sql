select t1.id,t1.company,t1.salary
from
(select id, company, salary, case @com when company then @rk:= @rk + 1 else @rk:=1 end as rk,
@com:=company from employee,(select@com:=null, @rk:= 0)p
order by company,salary)t1
left join
(select company, count(1)/2 as cnt from employee group by company) t2 
on t1.company = t2.company
where t1.rk in (cnt+0.5,cnt,cnt+1)
