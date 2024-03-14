DELIMITER //

CREATE PROCEDURE Update_Stock (
    IN product_id INT,
    IN new_stock_quantity INT
)
BEGIN
    UPDATE Products
    SET stock_quantity = new_stock_quantity
    WHERE product_id = product_id;
END //

DELIMITER ;
