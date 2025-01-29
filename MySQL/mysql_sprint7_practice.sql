use librarydb;
select * from books;
select * from borrowers;
select * from loans;

-- Task1
/* Write a query to create a procedure that accepts an age group as a parameter and retrieves the most 
popular books (e.g., top 10) borrowed by users in that age group.*/
delimiter //
create procedure task1(in age varchar(50))
begin
select b.title,count(*) as borrow_count from books b
inner join loans l on b.book_id=l.book_id 
inner join borrowers br on l.borrower_id=br.borrower_id
where br.age_group=age
group by b.title
order by borrow_count desc
limit 10;
end
//
delimiter ;
call task1('Adults (25-64)');
call task1('Teens (13-19)');

-- task2
/* Write a query to create a procedure that accepts year as a parameter and calculates the number of loans 
issued for each month within that year */
use librarydb;
delimiter //
create procedure task2(in year int)
begin
select month(loan_date) as loan_month,count(loan_id) as load_count from loans where year(loan_date)=year
group by loan_month
order by loan_month;
end
//
delimiter ;

call task2(2024);

-- TASK3
/*Write a query to create a procedure that creates a new loan entry in the loans table. It accepts book
and borrower IDs as parameters and inserts a new record with the current date and a calculated due date
 based on the library's loan period policy.*/
drop procedure AddNewLoan;
DELIMITER //
CREATE PROCEDURE AddNewLoan(IN p_book_id INT,IN p_borrower_id INT,in p_loan_period int)
BEGIN
    INSERT INTO loans (book_id, borrower_id, loan_date, return_date)
    VALUES (p_book_id, p_borrower_id, CURDATE(), DATE_ADD(curdate(),interval p_loan_period DAY));
END
//
DELIMITER ;

-- Call the procedure
use librarydb;
CALL AddNewLoan(1,3,14);
CALL AddNewLoan(1,3,15);
select * from loans;


-- TASK4
/*Write a query to create a procedure that updates the return date for a specific loan identified by 
the loan_id parameter. It essentially performs an UPDATE operation on the loans table, setting the 
return_date to the current date.*/
drop procedure UpdateReturnDate;
DELIMITER $$
CREATE PROCEDURE UpdateReturnDate(IN lloan_id INT)
BEGIN
    UPDATE loans
    SET return_date = CURDATE()
    WHERE loan_id= lloan_id;
END$$
DELIMITER ;
CALL UpdateReturnDate(1);

-- Task 5
/*Write a query to create a procedure that accepts three parameters borrower ID, new name (optional), and 
new email (optional). It performs an UPDATE operation on the borrowers table, updating the specified 
fields for the borrower identified by the borrower id.*/
use librarydb;
drop PROCEDURE sp_UpdateBorrowerInfo;
DELIMITER //
CREATE PROCEDURE sp_UpdateBorrowerInfo(IN p_borrower_id INT, IN p_new_name VARCHAR(255), IN p_new_email VARCHAR(100))
BEGIN
  UPDATE borrowers
  SET name= p_new_name,
      email=p_new_email
  WHERE borrower_id = p_borrower_id;
END //
DELIMITER ;
CALL sp_UpdateBorrowerInfo(9, 'priya', 'priya@gmail.com');

select *from borrowers;


-- Task 6
/*Write a query to create a procedure that accepts a borrower ID as a parameter. It retrieves the borrower's
record from the loans table and checks for any outstanding overdue books. Based on the presence of
overdue books, the procedure returns the status of the borrower, indicating whether the borrower is 
eligible for borrowing (if the borrow count is not greater than 0) or not.
Hint: Utilize IF-THEN-ELSE (refer to Additional Material) to check the eligibility status of borrowers*/
drop PROCEDURE sp_CheckBorrowerEligibility;
DELIMITER //
CREATE PROCEDURE sp_CheckBorrowerEligibility(IN p_borrower_id INT)
BEGIN
  DECLARE overdue_count INT;

  SELECT COUNT(*) INTO overdue_count
  FROM loans
  WHERE borrower_id = p_borrower_id
  AND return_date IS NULL
  AND DATE_ADD(loan_date, INTERVAL 30 DAY) < CURDATE();

  IF overdue_count > 0 THEN
    SELECT 'Borrower has overdue books' as status;
  ELSE
    SELECT 'Borrower is eligible' as status;
  END IF;
END //
DELIMITER ;
CALL sp_CheckBorrowerEligibility(6);
CALL sp_CheckBorrowerEligibility(1);
SELECT * FROM LOANS;

























