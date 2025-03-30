with a as (select departmentId, max(salary) as "Salary"
from Employee
group by departmentId),
b as (
select name as "Employee", salary as "Salary", DepartmentId
from Employee
)