DECLARE cur_products CURSOR FOR
SELECT product_id, stock_quantity
FROM Products;

OPEN cur_products;
FETCH NEXT FROM cur_products INTO @product_id, @stock_quantity;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Update stock quantity for each product
    UPDATE Products
    SET stock_quantity = @stock_quantity
    WHERE product_id = @product_id;
    
    FETCH NEXT FROM cur_products INTO @product_id, @stock_quantity;
END;
CLOSE cur_products;
DEALLOCATE cur_products;
