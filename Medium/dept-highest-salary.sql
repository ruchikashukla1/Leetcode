-- Language = T-SQL

with a as (select departmentId, max(salary) as "Salary"
from Employee
group by departmentId),
b as (
select name as "Employee", salary as "Salary", DepartmentId
from Employee
)

select D.name as "Department", "Employee", a."Salary"
from a inner join b on a.DepartmentId=b.DepartmentId and a."Salary"=b."Salary"
       inner join Department D on a.DepartmentId=D.id
order by 3 desc 