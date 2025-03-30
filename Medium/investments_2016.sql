with same_2015 as 
(
select tiv_2015, array_agg(pid) as "pid_array"
from insurance
group by tiv_2015
having count(pid) > 1), 


diff_location as (

select lat, lon, array_agg(pid) as "pid_array"
from insurance
group by lat, lon
having count(pid) = 1
), 

relevant_pids as (

    select unnest(st.pid_array) as "pid"
    from same_2015 st
    intersect 
    select unnest(dl.pid_array) as "pid"
    from diff_location dl

)

select ROUND(sum(tiv_2016)::numeric,2) as "tiv_2016"
from relevant_pids rp inner join insurance i on rp.pid = i.pid