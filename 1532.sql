-- # Write your MySQL query statement below
-- # most recent three orders of each user
-- # return all of their orders: Means left joining order table, so that all 
-- # order id gets fetched
WITH RankedOrders AS (
    SELECT 
        c.name AS customer_name,
        c.customer_id,
        o.order_id,
        o.order_date,
        ROW_NUMBER() OVER (
            PARTITION BY o.customer_id
            ORDER BY o.order_date DESC
        ) AS rnk
    FROM Customers c
    INNER JOIN Orders o
      ON c.customer_id = o.customer_id
)
SELECT customer_name, customer_id, order_id, order_date
FROM RankedOrders
WHERE rnk <= 3
ORDER BY customer_name ASC, customer_id ASC, order_date DESC;
