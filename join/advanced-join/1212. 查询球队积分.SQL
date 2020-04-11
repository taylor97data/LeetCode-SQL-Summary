SELECT t.team_id, t.team_name, sum(case when goals1 > goals2 then 3 when goals1 = goals2 then 1 else 0 END) as num_points
FROM 
(SELECT host_team as team_id, host_goals as goals1, guest_goals as goals2 FROM matches
UNION ALL
SELECT guest_team as team_id, guest_goals as goals1, host_goals as goals2 FROM matches) temp
RIGHT JOIN teams t
ON t.team_id = temp.team_id
GROUP BY t.team_id
ORDER BY num_points DESC, t.team_id
