select transaction_date,
case when sum(amount) filter(where amount % 2!=0) is not null then 
sum(amount) filter(where amount % 2!=0) else 0 end as odd_sum,
case when sum(amount) filter(where amount % 2=0) is not null then 
sum(amount) filter(where amount % 2=0) else 0 end as even_sum
from transactions 
group by transaction_date 
order by transaction_date