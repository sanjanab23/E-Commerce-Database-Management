DECLARE cur_orders CURSOR FOR
SELECT *
FROM Orders
WHERE customer_id = @customer_id;

OPEN cur_orders;
FETCH NEXT FROM cur_orders;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Process each order
    FETCH NEXT FROM cur_orders;
END;
CLOSE cur_orders;
DEALLOCATE cur_orders;
