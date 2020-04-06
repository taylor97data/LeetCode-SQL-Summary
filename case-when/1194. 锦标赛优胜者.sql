SELECT group_id, player_id
FROM (SELECT group_id, player_id,
SUM((CASE WHEN player_id = first_player 
    THEN first_score
    WHEN player_id = second_player 
    THEN second_score
    END)) as totalscore
FROM players p, matches m
WHERE p.player_id = m.first_player
OR p.player_id = m.second_player
GROUP BY group_id, player_id
ORDER BY group_id,totalscore DESC, player_id) as temp
GROUP BY group_id
ORDER BY group_id,totalscore DESC, player_id;


