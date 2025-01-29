use ecommerceinvdb;
select * from customers;
select * from order_items;
desc order_items;
select * from orders;

-- Task1 
/* Write a query to create a trigger that ensures the data integrity of the "order_items" table. This trigger must incorporate the following functionalities:
It checks for negative quantities or a quantity value of 0 in the NEW row (representing the attempted insert).*/

drop trigger task1;
delimiter //
create trigger task1
before insert on order_items
for each row
begin
declare message_text varchar(50);
if new.quantity<=0 then
 signal sqlstate '90000'
 set message_text='ERROR';
else
set message_text='Inserted record';
end if;
end
//
delimiter ;
INSERT INTO order_items(order_id, product_id, quantity) VALUES (1,3,0); 
INSERT INTO order_items(order_id, product_id, quantity) VALUES (1,3,5);

-- TASK1
/* It retrieves the current stock level for the product using a SELECT statement.
If the quantity is negative or the stock is insufficient, it throws an error message using SIGNAL, thereby preventing the insert operation.*/
DROP TRIGGER task1_2;

DELIMITER //
CREATE TRIGGER task1_2
BEFORE INSERT ON order_items
FOR EACH ROW
BEGIN
    DECLARE current_stock INT;
    SELECT stock_level INTO current_stock 
    FROM products 
    WHERE product_id = NEW.product_id;
    IF NEW.quantity <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Quantity must be greater than 0';
    END IF;
END
//
DELIMITER ;
INSERT INTO order_items(order_id, product_id, quantity) VALUES(1,3,0);
INSERT INTO order_items(order_id, product_id, quantity) VALUES(1,3,-1);


-- TASK2
 -- created new column
alter table order_items add column total_amount decimal(10,2) null;
set sql_safe_updates=0;
   -- updated the total amount null to 0
UPDATE order_items
SET total_amount = 0
WHERE total_amount IS NULL;

-- created daily sale table
create table daily_sale(
id int primary key auto_increment,
sale_date date,
total_sales decimal(10,2)
);

 -- inserted the new record in order items
insert into order_items(order_id,product_id,quantity) values(10,1,2);

   -- TASK2(CONT'D) 
/*Write a query to create a trigger which will fire after successful insertions of any new record to the order_items table. This trigger should follow the following functionalities:
Calculates the new total by adding the inserted item's product price and quantity to the existing total, then updates the orders table accordingly.
Stores daily sales summary information by inserting a new row into the daily_sales table with the current date (CURDATE()) and the total amount from the newly updated order.*/

DELIMITER //

CREATE TRIGGER after_insert_order_item
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    DECLARE product_price DECIMAL(10, 2);
    DECLARE new_item_total DECIMAL(10, 2);
    DECLARE updated_order_total DECIMAL(10, 2);

    -- Calculate the total_amount for the inserted item
    SELECT price INTO product_price
    FROM products
    WHERE product_id = NEW.product_id;

    SET new_item_total = product_price * NEW.quantity;

    -- Update the total_amount in the inserted record
    UPDATE order_items
    SET total_amount = new_item_total
    WHERE order_item_id = NEW.order_item_id;

    --  Calculate the new total for the order
    SELECT SUM(total_amount) INTO updated_order_total
    FROM order_items
    WHERE order_id = NEW.order_id;

    -- Update the orders table
    UPDATE orders
    SET total = updated_order_total
    WHERE order_id = NEW.order_id;

    -- Insert into daily_sales table
    INSERT INTO daily_sales (sale_date, total_amount)
    VALUES (CURDATE(), updated_order_total);

END;

//

DELIMITER ;























