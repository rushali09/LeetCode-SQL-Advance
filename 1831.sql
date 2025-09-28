-- # Write your MySQL query statement below
-- # maximum amount on their resp. day => "rnk =1"

select transaction_id
from 
(select transaction_id,
       rank() over(partition by Date(day) order by amount desc) as rnk
from transactions) as temp
where rnk = 1
order by transaction_id 
-- select transaction_id,
--        rank() over(partition by Date(day) order by amount desc) as rnk
-- from transactions