-- CONCAT Function
SELECT CONCAT('Hello', ' ', 'World') AS concatenated_string;

-- UPPER Function
SELECT UPPER('hello world') AS uppercase_string;

-- LOWER Function
SELECT LOWER('HELLO WORLD') AS lowercase_string;

-- LEFT Function
SELECT LEFT('Hello World', 5) AS left_string;

-- RIGHT Function
SELECT RIGHT('Hello World', 5) AS right_string;

-- LENGTH Function
SELECT LENGTH('Hello World') AS string_length;

-- TRIM Function
SELECT TRIM('   Hello World   ') AS trimmed_string;

-- REPLACE Function
SELECT REPLACE('Hello World', 'Hello', 'Hi') AS replaced_string;

-- SUBSTRING Function
SELECT SUBSTRING('Hello World', 7, 5) AS substring_string;

-- CHARINDEX Function (This function is specific to SQL Server, it finds the starting position of a substring within a string)
SELECT CHARINDEX('World', 'Hello World') AS charindex_position;

-- REVERSE Function (This function is specific to SQL Server, it reverses the characters in a string)
SELECT REVERSE('Hello World') AS reversed_string;

-- FORMAT Function (This function is specific to SQL Server, it formats a value with the specified format)
SELECT FORMAT(12345.6789, '##,###.00') AS formatted_number;
