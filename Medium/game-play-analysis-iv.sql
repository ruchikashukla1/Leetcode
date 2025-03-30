with next_login_dates as (
select player_id, 
lead (event_date) over(partition by player_id order by event_date) as next_event_date
from activity), 

first_login as (

select player_id, min(event_date) as first_login
from activity
group by player_id

)

select round(sum (case when first_login + (1 * interval '1 day') = next_event_date then 1 else 0 end)*1.000/count(distinct fl.player_id), 2) as fraction
from next_login_dates nl inner join first_login fl on (nl.player_id) = (fl.player_id)