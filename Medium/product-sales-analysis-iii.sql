-- Write your PostgreSQL query statement below
with min_years as (
select product_id, min(year) as year
from sales
group by 1
 ), 

all_required_data as (

select m.product_id, m.year as first_year, s.quantity, s.price
from min_years m inner join sales s on (m.product_id, m.year) = (s.product_id, s.year)

)

select * from all_required_data