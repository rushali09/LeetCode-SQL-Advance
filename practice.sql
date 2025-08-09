select customer_id 
from customers
where year = 2021 and revenue > 0
group by customer_id


select c.name as Customers
from customers c 
left join orders o 
on c.id = o.customerID
where c.id not in 
(select customerid from orders)