# Write your MySQL query statement below

SELECT 
    o.customer_id,
    o.product_id,
    p.product_name
FROM (
    SELECT 
        customer_id,
        product_id,
        COUNT(*) AS order_count,
        MAX(COUNT(*)) OVER (PARTITION BY customer_id) AS max_count
    FROM Orders
    GROUP BY customer_id, product_id
) AS o
JOIN Products p
    ON o.product_id = p.product_id
WHERE o.order_count = o.max_count;





# -- There is no "ORDER BY" clause in the result set.
# -- Each customer may have multiple products with the same highest order count.