-- CURRENT_DATE Function
SELECT CURRENT_DATE AS current_date;

-- CURRENT_TIME Function
SELECT CURRENT_TIME AS current_time;

-- CURRENT_TIMESTAMP Function
SELECT CURRENT_TIMESTAMP AS current_timestamp;

-- DATEADD Function (Adding 1 day to the current date)
SELECT DATEADD(DAY, 1, CURRENT_DATE) AS tomorrow_date;

-- DATEDIFF Function (Calculating the difference in days between two dates)
SELECT DATEDIFF('2024-03-15', '2024-03-01') AS days_difference;

-- DATE_FORMAT Function (Formatting a date)
SELECT DATE_FORMAT('2024-03-15', '%Y-%m-%d') AS formatted_date;

-- DAY Function (Extracting the day from a date)
SELECT DAY('2024-03-15') AS day_of_month;

-- MONTH Function (Extracting the month from a date)
SELECT MONTH('2024-03-15') AS month_of_year;

-- YEAR Function (Extracting the year from a date)
SELECT YEAR('2024-03-15') AS year;

-- DAYNAME Function (Getting the name of the day from a date)
SELECT DAYNAME('2024-03-15') AS day_name;

-- MONTHNAME Function (Getting the name of the month from a date)
SELECT MONTHNAME('2024-03-15') AS month_name;

-- WEEKDAY Function (Getting the index of the day of the week from a date, where Sunday is 0)
SELECT WEEKDAY('2024-03-15') AS weekday_index;
