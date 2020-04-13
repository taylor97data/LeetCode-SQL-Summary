SELECT a.log_id as start_id, b.log_id as end_id from (

SELECT log_id from logs where log_id-1 not in (select log_id from logs))a
join (
SELECT log_id from logs where log_id+1 not in (select log_id from logs)) b
on a.log_id <= b.log_id
group by a.log_id

#方法二 定义变量
                                               
SELECT min(log_id) as start_id,max(log_id) as end_id
from (
select log_id, case when @id = log_id - 1 then @num:=@num
ELSE @num:=@num+1 end as num, @id:= log_id from logs,(SELECT @num:=0, @id:=0) a
) temp
group by num
                                        
                                               
