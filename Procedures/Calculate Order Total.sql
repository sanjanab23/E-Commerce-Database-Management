DELIMITER //

CREATE PROCEDURE Calculate_Order_Total (
    IN order_id INT,
    OUT total_amount DECIMAL(10, 2)
)
BEGIN
    SELECT SUM(quantity * unit_price) INTO total_amount
    FROM Order_Details
    WHERE order_id = order_id;
END //

DELIMITER ;

