-- Language  = PostgreSQL 

with count_data as (
select managerId, count(distinct id)
from employee
where managerId is not null
group by managerId
having count(distinct id) >= 5)

select name
from count_data c inner join employee e on c.managerId = e.id