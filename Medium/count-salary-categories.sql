-- Write your PostgreSQL query statement below

with actual_categorisation as (

SELECT account_id, 
CASE WHEN income < 20000 THEN 'Low Salary'
     WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
     WHEN income > 50000 THEN 'High Salary' 
     ELSE 'OUT OF BOUND' END AS category 
     
     FROM accounts

), 

all_categorisation as (

SELECT 'Low Salary' as category
UNION 
SELECT 'Average Salary' as category
UNION 
SELECT 'High Salary' as category



)

SELECT alc.category, COUNT(account_id) AS accounts_count
FROM   all_categorisation alc 
       LEFT JOIN actual_categorisation acc ON alc.category = acc.category
GROUP BY alc.category
