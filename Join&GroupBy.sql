-- 1. List total sales revenue by month
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(total_amount) AS total_revenue
FROM Orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m');

-- 2. List top selling products by category
SELECT p.category, p.product_name, SUM(od.quantity) AS total_sold
FROM Products p
JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.category, p.product_name
ORDER BY total_sold DESC;

-- 3. List total amount spent by each customer
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC;

-- 4. List average order amount by payment method
SELECT p.payment_method, AVG(o.total_amount) AS avg_order_amount
FROM Orders o
JOIN Payments p ON o.order_id = p.order_id
GROUP BY p.payment_method;

-- 5. List orders along with the number of order details for each order
SELECT o.order_id, o.order_date, COUNT(od.order_detail_id) AS num_order_details
FROM Orders o
LEFT JOIN Order_Details od ON o.order_id = od.order_id
GROUP BY o.order_id, o.order_date;

-- 6. List customers along with the total amount spent and the number of orders placed
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       COUNT(o.order_id) AS num_orders,
       SUM(o.total_amount) AS total_spent
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC;

-- 7. List products along with the total quantity sold and the average price
SELECT p.product_name, SUM(od.quantity) AS total_sold, AVG(p.price) AS avg_price
FROM Products p
LEFT JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.product_name;

-- 8. List orders with their corresponding payment details, showing only successful payments
SELECT o.order_id, o.order_date, p.payment_method
FROM Orders o
LEFT JOIN Payments p ON o.order_id = p.order_id
WHERE p.payment_method IS NOT NULL;

-- 9. List products and their total sold quantity, showing all products even if they have no sales
SELECT p.product_name, COALESCE(SUM(od.quantity), 0) AS total_sold
FROM Products p
LEFT JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.product_name;

-- 10. List customers who have placed orders along with the latest order date
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       MAX(o.order_date) AS latest_order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name;
