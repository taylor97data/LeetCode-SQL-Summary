SELECT question_id AS survey_log
FROM survey_log
GROUP BY question_id
ORDER BY COUNT(answer_id)/COUNT(IF(action = 'show',1,0)) DESC
LIMIT 1;


SELECT temp.question_id AS survey_log FROM
(SELECT question_id, SUM(CASE WHEN action = 'show'
                        THEN 1
                        ELSE 0
                        END) AS NUM_SHOW,
                    SUM(CASE WHEN action = 'answer'
                        THEN 1
                        ELSE 0
                        END) AS NUM_ANSWER
FROM survey_log
GROUP BY question_id) AS temp
GROUP BY temp.question_id
ORDER BY (NUM_ANSWER/NUM_SHOW) DESC
LIMIT 1;


