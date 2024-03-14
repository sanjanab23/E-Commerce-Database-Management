-- 1. View to show product details along with their current stock quantity
CREATE VIEW Product_Stock AS
SELECT product_id, product_name, category, price, stock_quantity
FROM Products;

-- 2. View to show customer orders with their details
CREATE VIEW Customer_Orders AS
SELECT o.order_id, c.customer_id, c.first_name, c.last_name, o.order_date, o.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

-- 3. View to show popular products based on total quantity sold
CREATE VIEW Popular_Products AS
SELECT p.product_id, p.product_name, SUM(od.quantity) AS total_sold
FROM Products p
JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC;

-- 4. View to show high-value customers and their total spent amount
CREATE VIEW High_Value_Customers AS
SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING total_spent > 1000;

-- 5. View to show orders with payment details
CREATE VIEW Order_Payment_Details AS
SELECT o.order_id, o.order_date, o.total_amount, p.payment_method
FROM Orders o
JOIN Payments p ON o.order_id = p.order_id;
