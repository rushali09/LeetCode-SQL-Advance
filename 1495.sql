
select distinct c.title as TITLE
from tvprogram t
inner join content c
on t.content_id = c.content_id
where c.kids_content = 'Y'
and c.content_type = 'Movies'
and month(program_date) = 06 and year(program_date) = 2020