
select c.name as customers
from customers c
left join orders o 
on c.id = o.customerId
where c.id not in (select customerId from orders)