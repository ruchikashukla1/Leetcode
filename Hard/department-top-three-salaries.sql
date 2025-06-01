
with salary_ranks as (
 select *, DENSE_RANK() OVER (
 PARTITION BY Departmentid
 ORDER BY departmentID asc, salary desc) as Rank
 from employee
   )

select d.name as "Department",e.name as "Employee", e.salary as "Salary"
from salary_ranks e inner join department d on e.departmentid=d.id
where Rank<=3 
