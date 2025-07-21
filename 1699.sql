
WITH organized_table as (
select from_id, to_id , duration
from calls
where from_id < to_id
union all 
select to_id , from_id, duration
from calls
where to_id < from_id)

select  from_id as person1,
        to_id as person2,
        count(*) as call_count, 
        sum(duration) as total_duration
from organized_table
group by person1, person2