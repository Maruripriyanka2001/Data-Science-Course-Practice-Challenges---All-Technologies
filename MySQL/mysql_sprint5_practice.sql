use hr;

-- TASK1 : Displays the employee_id, first_name, last_name,department_name all employees using subquery
SELECT employee_id, first_name, last_name, 
(SELECT department_name FROM departments WHERE departments.department_id = employees.department_id) AS department_name
FROM employees;

SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name,
    (SELECT d.department_name 
     FROM departments d 
     WHERE d.department_id = e.department_id) AS department_name,
    (SELECT d.location_id 
     FROM departments d 
     WHERE d.department_id = e.department_id) AS location_id
FROM 
    employees e;
    
--  INTERPRETATION: identified the employee_id, first_name, last_name,department_name all employees using subquery.

/*TASK2:Display first_name,last_name,department_id,salary of employees whose salary is greater than averagee salary of all employees group by department id.*/
SELECT first_name,last_name,department_id,salary
FROM employees
WHERE salary >any (SELECT AVG(salary) FROM employees
group by department_id);

-- INTERPRETATION : Identified the first_name,last_name,department_id,salary of employees whose salary is greater than averag salary of all employees group by department id.

/*TASK3:Display first_name of those employees of sales department whose salary is less than averagee salary of all employees of the sales department*/

SELECT first_name, last_name, salary FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE department_name = 'Sales')
AND salary <all (SELECT AVG(salary) FROM employees
WHERE department_id IN (
        SELECT department_id 
        FROM departments 
        WHERE department_name = 'Sales'
    )
);

 -- or
 
SELECT first_name, last_name, salary FROM employees
where salary <all (SELECT AVG(salary) FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE department_name = 'Sales')
);
-- INTERPRETATION: Identifiedd first_name of those employees of sales department whose salary is less than averagee salary of all employees of the sales department


/* TASK4:Display first name,last name and salaries of employees who have salary higher than salaries of all it program in ascending order*/
SELECT first_name,last_name,salary FROM employees
WHERE salary >ALL(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
ORDER BY salary;
-- INTERPRETATION: Displays first name,last name and salaries of employees who have salary higher than salaries of all it program in ascending order


/*TASK5:dispalys the records of employees with minimun salary in employee table goruped by job_id column arreange in ascneding order.*/

use hr;
SELECT * FROM employees
WHERE salary >=any (SELECT MIN(salary) FROM employees GROUP BY job_id)
ORDER BY salary ASC; 
-- TASK5:dispalys the records of employees with minimun salary in employee table goruped by job_id column arreange in ascneding orde



/*TASK6:Display first_name,last_name,department_id,salary of employees whose salary is greater than 60% of sum of salaries all employees*/

SELECT first_name, last_name, department_id
FROM employees e
WHERE salary > 0.6 * (SELECT SUM(salary) FROM employees WHERE department_id = e.department_id );
-- TASK6:Displayed first_name,last_name,department_id,salary of employees whose salary is greater than 60% of sum of salaries all employees using subquery with sum function.

/*TASK7(OPTIONAL TASK): Display the first nameand last name of all those employee who hav their manager based out of uk*/
select e.first_name,e.last_name from employees e
where e.manager_id in(select d.manager_id from departments d join locations l on d.location_id=l.location_id
where l.country_id = 'uk');
-- TASK7(OPTIONAL TASK): Displayed employees information, who have their manager based out of uk using subquery



use hr;
-- TASK8:Display first_name,last_name,salary of top 5 highest paid employees and export the output as csv file.
SELECT first_name,last_name,salary FROM employees
LIMIT 5;
SHOW VARIABLES LIKE "secure_file_priv";

SELECT first_name,last_name,salary
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sql10.csv'

fields terminated by ','
lines terminated by '\n'
from employees;
-- TASK8:Displayed the first_name,last_name,salary of top 5 highest paid employees and exported the output as csv file.












