USE restaurant;

-- view
-- left join; all rows from the left side with the matching rows from 
-- the right side will be returned
-- a log/record to collect data of when customers ordered food 
CREATE VIEW customerOrderDate AS
SELECT c.name, o.orders_date
FROM customer c
LEFT JOIN 
orders o
ON c.customer_id = o.orders_cust_id; 

SELECT * FROM customerOrderDate; 

DROP VIEW customerOrderDate;

-- stored function; an executable database object which returns
-- a single value
-- a log/record to determine how long of a break a staff should get
-- based on their hours
DELIMITER //
CREATE FUNCTION staffBreak(
	staff_hours int
)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE break VARCHAR(50);
	IF staff_hours > 11 THEN 
		SET break = '90 MINUTE BREAK';
	ELSEIF staff_hours <= 11 THEN 
		SET break = '45 MINUTE BREAK';
	END IF;
	RETURN (break);
END//
DELIMITER ; 

SELECT
s.staff_id, s.staff_name, s.staff_hours, staffBreak(staff_hours)
FROM 
staff s
ORDER BY s.staff_hours ASC;

DROP FUNCTION staff_break;

-- subquery; nested query 
-- customers who ordered food £10.00 or more from the menu
-- since it's a small database, it is only the main courses
SELECT c.name
FROM customer c
WHERE c.customer_id IN 
(
SELECT o.orders_cust_id
FROM orders o
WHERE o.food_order_id IN
(
SELECT m.food_id
FROM menu m
WHERE price >= 10.00));

-- stored procedure; a subroutine available to applications
-- that access a rds to reuse when a task needs to be performed
-- inserting a new customer
DELIMITER //
 CREATE PROCEDURE insert_new_cust
 (IN customer_id INT, IN name VARCHAR(100), IN phone_number INT,
 IN email_address VARCHAR(100))
 BEGIN
 INSERT INTO customer
 (customer_id, name, phone_number, email_address)
 VALUES (customer_id, name, phone_number, email_address);
 SELECT * FROM customer;
END //
DELIMITER ;

CALL insert_new_cust(21,'Matthew Harris', 1982043630, 
'mharris@gmail.com');
DELETE FROM customer WHERE customer_id=21;

DROP PROCEDURE insert_new_cust;

-- view with query
-- inner join; returns all rows when there is at least one match
-- in both tables
-- a log/record of customers who reserved a table in order of
-- nearest date with details of the customer
CREATE VIEW customerReserved AS 
SELECT  b.booking_date AS date,  b.booking_table, c.name, c.phone_number, c.email_address
FROM customer c
INNER JOIN bookings b
ON c.customer_id = b.booking_cust_id
ORDER BY date ASC;

SELECT * FROM customerReserved;

DROP VIEW customerReserved;

-- group by; command that is used to group rows 
-- that have the same values
-- view with left join; all rows from the right side with the
-- matching rows from the left side will be returned
-- a log/record that shows how many hours staff worked on the days
-- there were orders
-- (repeats since a staff could have served an order
-- more than once in a day)
-- edit: no repeats of staff or hours now since we don't group by
-- orders_date
-- some staff don't have orders_date since they worked but didnt
-- take orders
CREATE VIEW staffShift AS
SELECT o.orders_date, s.staff_name, s.staff_hours-- , MAX(s.staff_name_ 
FROM orders o
RIGHT JOIN
staff s
ON o.orders_staff_id = s.staff_id
GROUP BY s.staff_hours, s.staff_name -- o.orders_date, 
ORDER BY o.orders_date;

SELECT * FROM staffShift; 

DROP VIEW staffShift;



