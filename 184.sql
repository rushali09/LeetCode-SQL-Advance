--# Write your MySQL query statement below

select  Department, 
        Employee,
        Salary
from 
(select d.name as Department, 
        e.name as Employee, 
        e.salary as Salary,
        dense_rank() over(partition by d.id order by e.salary desc) as rnk
from employee e
inner join department d 
on e.departmentId = d.id
) as temp
where rnk = 1

-- select d.name as department, 
--         e.name as name, 
--         e.salary as salary,
--         dense_rank() over(partition by d.id order by e.salary desc) as rnk
-- from employee e
-- inner join department d 
-- on e.departmentId = d.id

