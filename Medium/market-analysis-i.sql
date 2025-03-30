select u.user_id as "buyer_id", join_date, count(order_id) filter (where order_date::text like '2019%') as orders_in_2019
from users u left join orders o on u.user_id = o.buyer_id
             left join items  i on o.item_id = i.item_id
group by u.user_id, u.join_date
order by u.user_id, u.join_date