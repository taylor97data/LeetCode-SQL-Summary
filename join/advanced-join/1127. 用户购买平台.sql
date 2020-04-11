

SELECT temp1.spend_date, temp1.platform,
ifnull(temp3.total_amount,0) as total_amount,
ifnull(temp3.total_users,0) as total_users
FROM 
(SELECT distinct spend_date,p.platform from Spending,
                            (SELECT 'mobile' as platform union
                            SELECT 'desktop' as platform union
                            SELECT 'both' as platform) as p) temp1
LEFT JOIN
(SELECT spend_date, platform, sum(amount) as total_amount, count(user_id) as total_users
FROM(
SELECT spend_date, user_id, (case count(distinct platform) when 1 then platform when 2 then 'both' end) as platform, sum(amount) as amount FROM Spending
GROUP BY spend_date, user_id)temp2
GROUP BY spend_date, platform)temp3
ON temp1.spend_date = temp3.spend_date and temp1.platform = temp3.platform
