SELECT gender,day,total FROM 
(SELECT gender,day,case when @pre_gender = gender then @total:= @total+score_points else @total:=score_points end as total,@pre_gender:= gender FROM scores,

(select @pre_gender:=null, @total:=0) as init order by gender,day) as need
