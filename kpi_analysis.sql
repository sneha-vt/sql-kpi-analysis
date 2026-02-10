-- Total Orders
SELECT COUNT(order_id) AS total_orders
FROM orders;

-- Orders per Month
SELECT 
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    COUNT(order_id) AS orders
FROM orders
GROUP BY month
ORDER BY month;

-- Delivered vs Cancelled Orders
SELECT 
    order_status,
    COUNT(order_id) AS count
FROM orders
GROUP BY order_status;

-- Active Customers
SELECT 
    COUNT(DISTINCT customer_id) AS active_customers
FROM orders;

-- Repeat Customers
SELECT 
    customer_id,
    COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;
