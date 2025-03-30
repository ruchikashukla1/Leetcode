--LANGUAGE = T-SQL
--cancellation rate but both driver and user must be unbanned 
--rounded to 2 decimal places
--agg by day between "2013-10-01" and "2013-10-03"

with unbanned_client as (

select * from users 
    where banned = 'No' and role = 'client'

),
unbanned_drivers as (

select * from users 
    where banned = 'No' and role = 'driver'

)

select request_At as Day, CAST (ROUND(( (sum (case when status like 'cancelled%' then 1 else 0 end ) * 1.00 )/count(*) * 1.00),2) AS NUMERIC(18,2)) as "Cancellation Rate"
from trips t inner join unbanned_client uc on t.client_id = uc.users_id
             inner join unbanned_drivers ud on t.driver_id = ud.users_id
where request_at >= '2013-10-01' and request_at <= '2013-10-03'
group by request_At