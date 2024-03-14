-- Insert into Products table
INSERT INTO Products (product_name, category, price, stock_quantity) VALUES
('Laptop', 'Electronics', 999.99, 10),
('Smartphone', 'Electronics', 599.99, 20),
('T-shirt', 'Apparel', 19.99, 50),
('Sneakers', 'Footwear', 79.99, 30),
('Headphones', 'Electronics', 49.99, 15);

-- Insert into Customers table
INSERT INTO Customers (first_name, last_name, email, address, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '123 Main St, City, Country', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '456 Elm St, City, Country', '234-567-8901'),
('Alice', 'Johnson', 'alice.johnson@example.com', '789 Oak St, City, Country', '345-678-9012'),
('Bob', 'Brown', 'bob.brown@example.com', '987 Pine St, City, Country', '456-789-0123'),
('Eva', 'Martinez', 'eva.martinez@example.com', '654 Maple St, City, Country', '567-890-1234');

-- Insert into Orders table
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2024-03-10', 1299.97),
(2, '2024-03-11', 619.97),
(3, '2024-03-12', 19.99),
(4, '2024-03-13', 159.98),
(5, '2024-03-14', 99.98);

-- Insert into Order_Details table
INSERT INTO Order_Details (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.99),
(2, 2, 1, 599.99),
(3, 3, 1, 19.99),
(4, 4, 2, 79.99),
(5, 5, 2, 49.99);

-- Insert into Payments table
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES
(1, '2024-03-10', 1299.97, 'Credit Card'),
(2, '2024-03-11', 619.97, 'PayPal'),
(3, '2024-03-12', 19.99, 'Credit Card'),
(4, '2024-03-13', 159.98, 'Cash'),
(5, '2024-03-14', 99.98, 'Credit Card');
