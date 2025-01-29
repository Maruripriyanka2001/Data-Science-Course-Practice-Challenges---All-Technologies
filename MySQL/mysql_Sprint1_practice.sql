-- TASK1 ( creation of database)
create database techmac_db;
use techmac_db;
-- INTERPRETATION: CREATED THE DATABASE AS TECHAMC_DB.

-- TASK2 (creation of tables)
create table techhyue_employees
(
employee_id varchar(50) primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
gender varchar(50) not null,
age int not null
);

create table techcloud_employees
(
employee_id varchar(50) primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
gender varchar(50) not null,
age int not null
);

use techmac_db;
create table techsoft_employees
(
employee_id varchar(50) primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
gender varchar(50) not null,
age int not null
);
-- INTERPRETATION: CREATED THE THREE TABLES AS TECHHYUVE AND TECHSOFT AND TECHCLOUD EMPLOYEES.


-- TASK3  (inserting values)
use techmac_db;
-- table1 data(TECHHYUE_EMPLOYEES DATA)
insert into techhyue_employees(employee_id,first_name,last_name,gender,age)
values('TH0001','Eli','Evans','Male',26),

('TH0002','Carlos','Simmons','Male',32),

('TH0003','athie','Bryant','Female',25),
('TH0004','Joey','Hughes','Male',41),
('TH0005','Alice','Matthews','Female',52);
select * from techhyue_employees;

-- Table2 data(TECHCLOUD EMPLOYEEES)
insert into techcloud_employees(employee_id,first_name,last_name,gender,age)
values('TC0001','Teresa','Bryant','Female',39),
('TC0002','Alexis','Patterson','Male',48),


('TC0003','Rose','Bell','Female',42),
('TC0004','Gemma','Watkins','Female',44),
('TC0005','Kingston','Martinez','Male',29);
select * from techcloud_employees;
desc techcloud_employees;
-- table3 data(techsoft_employees)
insert into techsoft_employees(employee_id,first_name,last_name,gender,age)
values('TS0001','Peter','Burtler','Male',44),
('TS0002','Harold','Simmons','Male',54),
('TS0003','Juliana','Sanders','Female',36),
('TS0004','Paul','Ward','Male',29),
('TS0005','Nicole','Bryant','Female',30);
select * from techsoft_employees;
-- INTERPRETATION: INSERTED THE DATA INTO FOR ALREADY CREATED TABLES.


-- TASK4 (creation of backup tables)
create database backup_techmac_db;
use backup_techmac_db;
create table techhyue_employees_bkp select * from techmac_db.techhyue_employees;
create table techcloud_employees_bkp select * from techmac_db.techcloud_employees;
create table techsoft_employees_bkp select * from techmac_db.techsoft_employees;
-- INTERPRETATION: CREATED THE BACKUP TABLE FOR THE EXISTING TABLES.


-- TASK5  (deletion of column)
use techmac_db;
delete from techhyue_employees where employee_id='TH0003,TH0005';
delete from techhyue_employees where employee_id='TH0005';
use backup_techmac_db;
select * from techhyue_employees_bkp; -- this is for to check the backup table

delete from techcloud_employees where employee_id='TC0001';
delete from techcloud_employees where employee_id='TC0004';
use backup_techmac_db;
select * from techcloud_employees_bkp;-- -- this is for to check the backup table
-- INTERPRETATION: DELETED THE DATA OF A COLUMN BASED ON CONDITION USING DELETE













;







