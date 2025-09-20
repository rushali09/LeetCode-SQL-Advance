-- # Write your MySQL query statement below
-- # find out friends of user_id =1 => 2,3,4,6
-- # Find out the pages liked by user_id = '1s' friend' => 23,24,56,33,77; excluding
-- # pages liked by user_id= 1
-- # Return those pages as recommendations for user_id=1

-- # how to extract friends relation? or How to find friends of user_id1?
-- # Soln => USE CASE method:
-- # when user1_id = 1 then return user2_id
-- # when user2_id = 1 then return user1_id

-- # for likes table
-- # keep only those user_id's that are friends with user_id =1, 
-- # how to achieve this 
-- # where user_id in (select friends from cte)

-- # "not include pages" liked by user_id = 1
-- # How to achieve this?
-- # page_id not in (select page_id from likes where user_id =1)

with cte as 
(select 
    case
        when user1_id = 1 then user2_id
        when user2_id = 1 then user1_id
    end as friends
from friendship)

select distinct page_id as recommended_page
from likes
where user_id in (select friends from cte)
and page_id not in (select page_id from likes where user_id =1)




