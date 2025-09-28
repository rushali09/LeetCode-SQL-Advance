-- # Write your MySQL query statement below
-- #  Project Employees III
select project_id, employee_id
from
(select p.project_id, 
e.employee_id, 
rank() over(partition by p.project_id order by e.experience_years desc) as rnk
from project p 
inner join employee e 
on p.employee_id = e.employee_id) as temp
where rnk = 1