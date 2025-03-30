-- Language = PostgreSQL 

with ranks as (
select dense_rank() over(order by salary desc) as rank, salary 
from Employee), 

dummy_rank as (
select 2 as rank )

select salary as "SecondHighestSalary"
from dummy_rank dr left join ranks r on dr.rank = r.rank and dr.rank = 2 
limit 1 
