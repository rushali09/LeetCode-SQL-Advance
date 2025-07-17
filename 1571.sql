select w.name as warehouse_name, sum((p.length * p.width * p.height)* w.units) as volume
from warehouse w
inner join products p 
on w.product_id = p.product_id 
group by w.name