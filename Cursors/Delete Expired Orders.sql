DECLARE cur_expired_orders CURSOR FOR
SELECT order_id
FROM Orders
WHERE order_date < @expiry_date;

OPEN cur_expired_orders;
FETCH NEXT FROM cur_expired_orders INTO @order_id;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Delete expired order
    DELETE FROM Orders
    WHERE order_id = @order_id;
    
    FETCH NEXT FROM cur_expired_orders INTO @order_id;
END;
CLOSE cur_expired_orders;
DEALLOCATE cur_expired_orders;
