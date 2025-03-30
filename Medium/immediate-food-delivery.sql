with first_orders as

(
Select customer_id, min(order_date) as first_order_date
from delivery
group by customer_id
)

select 
round(sum (case when customer_pref_delivery_date = order_date then 1 else 0 end)*1.00/count(*), 4)*100 as "immediate_percentage"
from first_orders fo inner join delivery d on fo.customer_id = d.customer_id and fo.first_order_date = d.order_date