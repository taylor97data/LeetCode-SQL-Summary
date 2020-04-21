SELECT p1.player_id,p1.event_date,p1.games_played_so_far FROM
(SELECT player_id, event_date,@games:= IF(@playid = player_id AND @date !=event_date, @games + games_played, games_played) as games_played_so_far,  @playid:=player_id,@date:=event_date
FROM activity, (select @games:= 0,@playid:=null,@date:=null) t1 ORDER BY player_id,event_date) p1
