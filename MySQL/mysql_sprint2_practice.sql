use techmac_db;
-- TASK1 
   -- TASK1_1  -- -- Ensure first and last name doesnot allow null values
alter table techhyue_employees modify first_name varchar(50) not null;
alter table techhyue_employees modify last_name varchar(50) not null;

alter table techcloud_employees modify first_name varchar(50) not null;
alter table techcloud_employees  modify last_name varchar(50) not null;

alter table techsoft_employees modify first_name varchar(50) not null;
alter table techsoft_employees  modify last_name varchar(50) not null;

desc techhyue_employees;

    -- TASK1_2 -- set default age 21
alter table techhyue_employees alter age set default 21;
alter table techcloud_employees alter age set default 21;
alter table techsoft_employees alter age set default 21;

    -- TASK1_3 --  age betweeen 21 to 55 using check constraint
alter table techhyue_employees add check(age between 21 and 55);
alter table techcloud_employees add check(age between 21 and 55);
alter table techsoft_employees add check(age between 21 and 55);

     -- TASK1_4-- create new column as passowrd an dusername and only allow not null and unique.
use techmac_db;

set sql_safe_updates=0;
alter table  techcloud_employees add column username varchar(50) not null unique,add column password varchar(50) not null unique;
update techcloud_employees set username=CONCAT(first_name,'',last_name),password=last_name;
select * from techcloud_employees;
desc techcloud_employees;
 
alter table techhyue_employees add column username varchar(50) NOT NULL UNIQUE ,add column password varchar(50) NOT NULL UNIQUE ;
update techhyue_employees set username=CONCAT(first_name,'',last_name),password=last_name;
select * from techhyue_employees;

alter table techsoft_employees add column username varchar(50) NOT NULL UNIQUE  ,add column password varchar(50) NOT NULL UNIQUE ;
update techsoft_employees set username=CONCAT(first_name,'',last_name),password=last_name;
select * from techsoft_employees;

   -- Task1_5 -- alter the gender column whether male or female using check constraint
alter table techhyue_employees add check(gender in('male','Female'));
alter table techcloud_employees add check(gender in('male','female'));
alter table techsoft_employees add check(gender in('male','female'));
desc techcloud_employees;

-- TASK2 -- add new column aas communication proficiency and default value is 1 and communication proficiency should in range of 1 to 5
alter table techhyue_employees add column communication_proficiency int not null default 1;
alter table techhyue_employees add CHECK(communication_proficiency BETWEEN 1 and 5);
alter table techcloud_employees  add column communication_proficiency int not null default 1;
alter table techcloud_employees add CHECK(communication_proficiency BETWEEN 1 and 5);
alter table techsoft_employees  add column communication_proficiency int not null default 1;
alter table techsoft_employees add CHECK(communication_proficiency BETWEEN 1 and 5);

-- TASK3 --  create new table and merge  techhyue and techcloud tables and delete the records of techhyue and techcloud and retain backup taB=ble.
create table techhyuecloud
(
employee_id varchar(50) primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
gender varchar(50) not null,
age int not null,
password varchar(50) not null,
username varchar(50) not null
);
alter table techhyuecloud add column communication_proficiency int default 1;

insert into techhyuecloud select * from techhyue_employees;
insert into techhyuecloud select * from techcloud_employees;
use techmac_db;
desc techhyuecloud;

set sql_safe_updates=0;
truncate table techhyue_employees;
truncate table techcloud_employees;
desc techhyue_employees;

create database bkp_techhyuecloud_db; --  this is backup database to retain
use bkp_techhyuecloud_db;
create table techhyue_employees_bkp select * from techmac_db.techhyue_employees;
create table techcloud_employees_bkp select * from techmac_db.techcloud_employees;

















