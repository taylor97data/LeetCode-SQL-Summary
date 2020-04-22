select distinct t1.* from stadium t1, stadium t2, stadium t3
where t1.people >= 100 and t2.people >= 100 and t3.people >=100
and
((t1.id + 1 = t2.id and t1.id +2 = t3.id and t2.id +1 = t3.id)
or 
(t3.id + 1 = t2.id and t3.id +2 = t1.id and t2.id +1 = t1.id)
or
(t2.id + 1 = t1.id and t2.id +2 = t3.id and t1.id +1 = t3.id))
order by t1.id
