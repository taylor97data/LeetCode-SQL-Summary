SELECT 
month,country,
SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END)approved_count,
SUM(CASE WHEN state='approved' THEN amount ELSE 0 END)approved_amount,
SUM(CASE WHEN state='refund' THEN 1 ELSE 0 END)chargeback_count,
SUM(CASE WHEN state='refund' THEN amount ELSE 0 END)chargeback_amount 
FROM
    (SELECT DATE_FORMAT(trans_date,'%Y-%m')month,country,state,amount,id FROM Transactions
     UNION ALL
     SELECT DATE_FORMAT(c.trans_date,'%Y-%m')month,country,'refund' AS state,amount,trans_id 
            FROM 
            Chargebacks c LEFT JOIN Transactions t ON c.trans_id=t.id)s 
GROUP BY month,country 
HAVING approved_count+chargeback_count>0
