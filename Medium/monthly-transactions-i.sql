select left(trans_date::text, 7) as month, 
country, 
count(*) as trans_count, 
count(*) filter(where state = 'approved') as approved_count, 
sum(amount) as trans_total_amount, 
case when sum(amount)filter(where state = 'approved') is not null then  sum(amount)filter(where state = 'approved')
else 0 end as approved_total_amount
from Transactions 
group by 1, 2