--Students With Invalid Departments

# Write your MySQL query statement below


select s.id, s.name
from departments d 
right join students s
on d.id= s.department_id 
where s.department_id not in 
(select id from departments)