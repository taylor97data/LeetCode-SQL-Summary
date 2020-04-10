select 
install_dt, count(a.player_id) as installs,
round(count(b.player_id)/count(a.player_id),2) as Day1_retention 
from(
SELECT player_id,min(event_date) as install_dt
from activity
group by player_id) a
left join activity b
on a.player_id = b.player_id and datediff(event_date, install_dt) = 1
group by install_dt
