select state period_state, min(date) start_date, max(date) end_date from(
select date,state,if(state = @prev_state and datediff(date, @prev_date) = 1, @i, @i:= @i + 1)i, @prev_date:= date, @prev_state:= state
FROM(
select success_date date, 'succeeded' state from succeeded
union all
select fail_date date, 'failed' state from failed)tasks,
(select @prev_date:= '',@prev_state:='',@i:=0) vals
where year(date) = 2019) temp
group by temp.i
order by start_date
