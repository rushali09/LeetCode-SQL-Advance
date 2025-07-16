select user_id, last_stamp
from 
(select user_id, max(time_stamp)  as last_stamp
from logins
where Year(time_stamp) = 2020
group by user_id) as time
