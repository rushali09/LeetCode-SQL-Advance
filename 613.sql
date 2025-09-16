-- --613. Shortest Distance in a Line

-- --Write your MySQL query statement below

-- --Amazon Interview Question 
-- # Make combinations of values 
-- # Then calculate the distance (MIN())
-- # Create a cross join 
-- # Avoid same number combination. Hence, p1.x != p2.x
-- # Distance diff can never be negative. Hence take ABS

-- # Instead of cross join, consider inner join (as CJ will be expensive). 
-- # If IJ, then p1.x < p2.x => Makes sure, no two same numbers appear.

select min(abs(p1.x-p2.x)) as shortest
from point p1 
inner join point p2
where p1.x < p2.x

