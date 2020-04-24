SELECT NAME FROM Candidate
WHERE ID =(SELECT CandidateId FROM VOTE
GROUP BY CandidateId
HAVING COUNT(*) = (SELECT COUNT(*) FROM VOTE
GROUP BY CandidateId
ORDER BY COUNT(*) DESC
LIMIT 1))
