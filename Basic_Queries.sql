-- 1. List all products
SELECT * FROM Products;

-- 2. List all customers
SELECT * FROM Customers;

-- 3. List all orders
SELECT * FROM Orders;

-- 4. List all order details
SELECT * FROM Order_Details;

-- 5. List all payments
SELECT * FROM Payments;

-- 6. Count the number of products
SELECT COUNT(*) AS product_count FROM Products;

-- 7. Count the number of customers
SELECT COUNT(*) AS customer_count FROM Customers;

-- 8. Count the number of orders
SELECT COUNT(*) AS order_count FROM Orders;

-- 9. Calculate the total revenue
SELECT SUM(total_amount) AS total_revenue FROM Orders;

-- 10. Find the average product price
SELECT AVG(price) AS average_price FROM Products;

-- 11. Find the highest priced product
SELECT * FROM Products ORDER BY price DESC LIMIT 1;


-- 12. List products with low stock (less than 10 items)
SELECT * FROM Products WHERE stock_quantity < 10;

-- 13. List orders placed in the last week
SELECT * FROM Orders WHERE order_date >= CURDATE() - INTERVAL 7 DAY;

-- 14. List customers who have not placed any orders
SELECT * FROM Customers 
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders);






