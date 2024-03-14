-- 1. Create a new table for Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    category VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT
);


-- 2. Add a foreign key constraint to Orders table
ALTER TABLE Orders
ADD CONSTRAINT FK_CustomerID
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);

-- 3. Create a new index on the product_name column in the Products table
CREATE INDEX idx_product_name ON Products (product_name);

-- 4. Rename the column 'total_price' to 'total_amount' in the Orders table
ALTER TABLE Orders
CHANGE COLUMN total_price total_amount DECIMAL(10, 2);

-- 5. Drop the Payments table
DROP TABLE Payments;




