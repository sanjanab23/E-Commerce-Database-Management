-- 1. Insert a new product into the Products table
INSERT INTO Products (product_name, category, price, stock_quantity)
VALUES ('Laptop', 'Electronics', 999.99, 10);

-- 2. Update the price of a product in the Products table
UPDATE Products
SET price = 1099.99
WHERE product_id = 1;

-- 3. Delete a customer from the Customers table
DELETE FROM Customers
WHERE customer_id = 1;


-- 4. Increase the stock quantity of a product in the Products table
UPDATE Products
SET stock_quantity = stock_quantity + 5
WHERE product_id = 2;

-- 5. Retrieve all orders placed by a specific customer from the Orders table
SELECT *
FROM Orders
WHERE customer_id = 1;
