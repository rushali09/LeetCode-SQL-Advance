-- # Write your MySQL query statement below
-- # Partition team_id into sections 
-- # Which means the team id 8 is one group and 7 is another group and 9 is another group 
-- # After partition into sections use count() window function

select employee_id, count(employee_id) over(partition by team_id order by team_id)
as team_size
from employee
