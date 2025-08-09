
with temp_table as (

    select  o.customer_id, 
            c.name,
            extract(year from o.order_date) as year, 
            extract(month from o.order_date) as month, 
            sum(p.price * o.quantity) as amt
    from customers c 
    inner join orders o 
    on c.customer_id = o.customer_id 
    inner join product p
    on p.product_id  = o.product_id
    where o.order_date BETWEEN '2020-06-01' AND '2020-07-31'
    group by o.customer_id, 
            c.name,
            year(order_date),
            month(order_date)
)

select customer_id, name
from temp_table
where month IN (6,7) and year = 2020
and amt >=100
group by customer_id, name
HAVING
  COUNT(DISTINCT month) = 2 #we want both the boths 6 and 7 including
  # we have to find a customer who has sepnt in both june 2020 and july 2020
  # there should be 1 entry in each month for each customer who spent atleast $100 if not discard