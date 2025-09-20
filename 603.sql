SELECT W. seat_id
FROM (SELECT *, LEAD (free) OVER ORDER BY seat_id AS NextSeat, LAG free) OVER ORDER
BY seat_id AS PrevSeat
FROM Cinema AS W
WHERE W. free = 1 AND W. NextSeat = 1
ORDER BY W. seat_id