SELECT ad_id, CASE when sum(if(action='Clicked',1,0))+sum(if(action='Viewed',1,0))=0 then 0
                    else round(100*sum(if(action='Clicked',1,0))/(sum(if(action='Clicked',1,0))+sum(if(action='Viewed',1,0))),2) end as ctr FROM ads
GROUP BY ad_id
ORDER BY ctr desc,ad_id;
