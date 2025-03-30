with rolling_sum as (

    select sum(weight) over (order by turn) as rolling_sum, 
    person_name 

    from Queue
)

select top 1 person_name 
from rolling_sum 
where rolling_sum <= 1000
order by rolling_sum desc