with
tmp as (
select case when id%2=0  then id-1
when id%2=1  and id!=(select count(*) from seat)then id+1 
when id%2=1 and id=(select count(*) from seat) then id end as id, student
from seat)

select * from tmp
order by id asc