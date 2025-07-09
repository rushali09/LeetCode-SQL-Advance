select customer_id
from customers
where year= 2021
and revenue > 0
group by customer_id