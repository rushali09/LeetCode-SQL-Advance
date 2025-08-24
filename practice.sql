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


select c.customer_id,
    c.customer_name 
from customers c
left join orders o 
on c.customer_id = o.customer_id 
group by customer_id, customer_name
having sum(o.product_name = 'A')> 0
and sum(o.product_name= 'B')> 0
and sum(o.product_name = 'C') = 0


select student_id, 
        course_id,
        grade
from
(select  student_id, 
        course_id, 
        grade, 
        dense_rank() over (partition by student_id order by grade DESC, course_id ASC) as rnk
from enrollments) as marks
where rnk = 1
order by student_id


select customer_id
from customers 
where revenue >0 and year = 2021




select c.name as Customers
from customers c 
left join orders o 
on c.id = o.customerId
where c.id not in (
    select customerId from orders
)


select employee_id,
    case 
        when mod(employee_id,2) =1 and name NOT LIKE 'M%'
        then salary
        else
        salary = 0
    end as bonus
from employees
order by employee_id


select c.customer_id, c.customer_name
from customers c 
left join orders o 
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(o.product_name  = 'A') >0
and sum(o.product_name = 'B') > 0
and sum(o.product_name = 'C') = 0


select student_id, 
course_id,
grade
from
(select  student_id,
        course_id, 
        grade,
        row_number() over(partition by student_id order by grade desc, course_id asc) as rnk
from enrollments) as temp
where rnk = 1
order by student_id

 
select p.firstName, p.lastName, a.city, a.state
from person p 
left join address a 
on p.personId = a.personId


(select  product_id, 
        'store1' as store, 
        store1 as price
from Products
where store1 is not null)

union all 

(select  product_id,
        'store2' as store,
         store2 as price
from products
where store2 is not null)

union all 

(select product_id,
        'store3' as store,
        store3 as price
from products
where store3 is not null)












