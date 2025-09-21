# Write your MySQL query statement below
# transform championships table into player id 
# then join it with players table
with cte as (
     SELECT Wimbledon AS player_id FROM Championships
    UNION ALL
    SELECT Fr_open FROM Championships
    UNION ALL
    SELECT US_open FROM Championships
    UNION ALL
    SELECT Au_open FROM Championships
)


SELECT p.player_id,
       p.player_name,
       COUNT(*) AS grand_slams_count
FROM Players p
INNER JOIN cte as c
ON p.player_id = c.player_id
GROUP BY p.player_id, p.player_name;

