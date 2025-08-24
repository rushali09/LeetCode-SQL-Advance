select ct.name as country
from person p 
join calls c
on p.id = c.caller_id OR p.id = c.callee_id
join country ct
on left(p.phone_number,3) = ct.country_code
group by ct.name
having avg(duration) > (select avg(duration) from calls)