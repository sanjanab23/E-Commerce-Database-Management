DELIMITER //

CREATE PROCEDURE Get_Customer_Orders (
    IN customer_id INT
)
BEGIN
    SELECT *
    FROM Orders
    WHERE customer_id = customer_id;
END //

DELIMITER ;
