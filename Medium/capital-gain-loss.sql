with updated_price as (
select case when operation = 'Sell' then price else (-1)*price end as "price_with_sign", 
operation_day, stock_name
from stocks)

select stock_name, sum("price_with_sign") as capital_gain_loss
from updated_price
group by 1 
