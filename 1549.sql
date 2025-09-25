# Write your MySQL query statement below
SELECT 
    p.product_name,
    o.product_id,
    o.order_id,
    o.order_date
FROM (
    SELECT 
        o.*,
        MAX(o.order_date) OVER (PARTITION BY o.product_id) AS max_date
    FROM Orders o
) o
JOIN Products p
    ON o.product_id = p.product_id
WHERE o.order_date = o.max_date
ORDER BY 
    p.product_name ASC,
    o.product_id ASC,
    o.order_id ASC;
