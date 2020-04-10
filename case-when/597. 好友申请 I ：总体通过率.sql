SELECT ifnull(round((select count(*) from (SELECT distinct requester_id, accepter_id from request_accepted) as a)
/
(select count(*) from (SELECT distinct sender_id, send_to_id from friend_request) as b),2),0) as accept_rate
