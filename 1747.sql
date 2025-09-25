-- # Write your MySQL query statement below
-- # Criteria for banning account => IP address and duration mismatch.
-- # Doing inner join to compares the cases against each other.
-- # Sus => When same account is logged in at same time but with different IP address (overlapping login logout intervals).
-- # three scenarios:
-- # same user_id, same IP -> Normal
-- # same user_id, different IP, but no overlap (login/logout) -> Normal
-- # same user_id, different IP, but overlap (login/logout) -> Red flag
-- # They only get flagged when different IPs + overlapping login sessions happen.

-- # Login: same account;different ip address; overlapping timings

select distinct l1.account_id
from loginfo l1
inner join loginfo l2
on l1.account_id = l2.account_id 
and l1.ip_address != l2.ip_address
-- # defining overlapping case of timings
where (l1.login between l2.login and l2.logout)
or (l1.logout between l2.login and l2.logout)