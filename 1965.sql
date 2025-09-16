# Write your MySQL query statement below
# Since ds system does not support FULL OUTER JOIN syntax
# Hence, do separate right and left join and combine them using union
# On both the select queries add "WHERE" clause for picking NULL value for name and salary
# Return e.employee_id and s.employee_id 

select e.employee_id
from employees e
left join salaries s
on e.employee_id = s.employee_id
where s.salary is null

union all

select s.employee_id
from employees e
right join salaries s
on e.employee_id = s.employee_id
where e.name is null
order by employee_id
--1965. Employees With Missing Information
