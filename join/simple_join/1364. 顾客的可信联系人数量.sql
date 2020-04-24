# Write your MySQL query statement below
SELECT i.invoice_id,c.customer_name,i.price,IFNULL(t1.contacts_cnt,0) as contacts_cnt,IFNULL(t2.trusted_contacts_cnt,0) as trusted_contacts_cnt
FROM invoices as i
LEFT JOIN customers as c
ON i.user_id = c.customer_id
LEFT JOIN (
SELECT user_id,count(contact_name) as contacts_cnt
FROM contacts
GROUP BY user_id) t1
ON t1.user_id = i.user_id
LEFT JOIN(
SELECT user_id,count(contact_name) as trusted_contacts_cnt
FROM contacts
WHERE contact_name IN
(SELECT customer_name FROM customers)
GROUP BY user_id) t2
ON t2.user_id = i.user_id
ORDER BY invoice_id
