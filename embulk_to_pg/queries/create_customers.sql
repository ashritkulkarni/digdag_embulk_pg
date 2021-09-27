--create_customers table
WITH patient_time AS (SELECT user_id, MAX(timestamp) as time
FROM pageviews_tmp
GROUP BY user_id)
, a AS (SELECT b.user_id, b.user_agent, b.timestamp
  FROM pageviews_tmp b
  JOIN patient_time ON b.user_id = patient_time.user_id
  AND b.timestamp = patient_time.time)
SELECT c.user_id, c.first_name, c.last_name, c.job_title, a.user_agent AS operating_system
FROM customers_tmp c
JOIN a ON c.user_id = a.user_id
