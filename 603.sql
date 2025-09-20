-- # Write your MySQL query statement below
-- # Keep only the seats that are free and the next or previous must be 1
-- #If a seat is free and has at least one free neighbor → include it.

select w.seat_id
from 
(select *,
       lead(free)over(order by seat_id) as next_seat,
       lag(free) over(order by seat_id) as prev_seat
from cinema) as w
where w.free= 1 and w.next_seat = 1 
or w.free=1 and w.prev_seat= 1
order by seat_id 