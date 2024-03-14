-- 1. Trigger to update stock quantity after an order is placed
CREATE TRIGGER Update_Stock_After_Order
AFTER INSERT ON Order_Details
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END;

-- 2. Trigger to update total amount in Orders table after inserting order details
CREATE TRIGGER Update_Total_Amount_After_Order_Detail_Insert
AFTER INSERT ON Order_Details
FOR EACH ROW
BEGIN
    UPDATE Orders
    SET total_amount = total_amount + (NEW.quantity * NEW.unit_price)
    WHERE order_id = NEW.order_id;
END;

-- 3. Trigger to update total amount in Orders table after deleting order details
CREATE TRIGGER Update_Total_Amount_After_Order_Detail_Delete
AFTER DELETE ON Order_Details
FOR EACH ROW
BEGIN
    UPDATE Orders
    SET total_amount = total_amount - (OLD.quantity * OLD.unit_price)
    WHERE order_id = OLD.order_id;
END;

-- 4. Trigger to prevent deleting a customer with associated orders
CREATE TRIGGER Prevent_Customer_Deletion_With_Orders
BEFORE DELETE ON Customers
FOR EACH ROW
BEGIN
    DECLARE orders_count INT;
    SELECT COUNT(*) INTO orders_count FROM Orders WHERE customer_id = OLD.customer_id;
    IF orders_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete customer with associated orders';
    END IF;
END;

-- 5. Trigger to log payment information after inserting payment details
CREATE TRIGGER Log_Payment_Insert
AFTER INSERT ON Payments
FOR EACH ROW
BEGIN
    INSERT INTO Payment_Logs (payment_id, order_id, payment_date, amount, payment_method)
    VALUES (NEW.payment_id, NEW.order_id, NEW.payment_date, NEW.amount, NEW.payment_method);
END;
