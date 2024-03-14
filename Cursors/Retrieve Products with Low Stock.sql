DECLARE cur_low_stock_products CURSOR FOR
SELECT product_id, product_name, stock_quantity
FROM Products
WHERE stock_quantity < @threshold;

OPEN cur_low_stock_products;
FETCH NEXT FROM cur_low_stock_products INTO @product_id, @product_name, @stock_quantity;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Process low stock product
    FETCH NEXT FROM cur_low_stock_products INTO @product_id, @product_name, @stock_quantity;
END;
CLOSE cur_low_stock_products;
DEALLOCATE cur_low_stock_products;
