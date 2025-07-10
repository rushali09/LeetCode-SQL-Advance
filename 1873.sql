select employee_id, 
    case
    when mod(employee_id, 2) = 1 and name not like 'm%'
    then salary 
    else
    salary= 0
    end as bonus
from employees
order by employee_id