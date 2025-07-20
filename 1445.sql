select s1.sale_date, (s2.sold_num-s1.sold_num) as diff
from sales s1
inner join sales s2
on s1.sale_date = s2.sale_date
group by s1.sale_date
order by s1.sale_date