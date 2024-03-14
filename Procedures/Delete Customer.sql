DELIMITER //

CREATE PROCEDURE Delete_Customer (
    IN customer_id INT
)
BEGIN
    DELETE FROM Payments WHERE order_id IN (SELECT order_id FROM Orders WHERE customer_id = customer_id);
    DELETE FROM Order_Details WHERE order_id IN (SELECT order_id FROM Orders WHERE customer_id = customer_id);
    DELETE FROM Orders WHERE customer_id = customer_id;
    DELETE FROM Customers WHERE customer_id = customer_id;
END //

DELIMITER ;
