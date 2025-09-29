-- # Write your MySQL query statement below
WITH ranked AS (
    SELECT 
        log_id,
        log_id - ROW_NUMBER() OVER (ORDER BY log_id) AS grp
    FROM Logs
)
SELECT 
    MIN(log_id) AS start_id,
    MAX(log_id) AS end_id
FROM ranked
GROUP BY grp
ORDER BY start_id;
