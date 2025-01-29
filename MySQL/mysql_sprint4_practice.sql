use hr;
 -- TASK1
select employee_id,first_name,last_name,department_name,departments.department_id FROM employees join departments
using(department_id)
where department_name = 'IT';
-- INTERPRETATION : Identified the first name and last name and department id from two tables they are employee and department tables using join .

 -- TTASK2
set sql_safe_updates=0;
select department_name,max(salary),min(salary)
from employees join departments 
using(department_id)
group by department_name;
-- INTERPRETATION : Identified the min and max salary for each department using join

 -- TASK3

SELECT city,COUNT(employee_id) AS city_count
FROM employees
JOIN departments USING(department_id)
JOIN locations USING(location_id)
GROUP BY city
ORDER BY city_count DESC
LIMIT 10;
-- INTERPRETATION : Identified as top 10 highest employees based on city, this is done using join concepts and group by and order by clause.


-- TASK4
SELECT employees.employee_id,first_name,last_name, end_date from
employees join job_history using(department_id)
where end_date = '1999-12-31';
-- INTERPRETATION: Identified the employee id and first name and last name of employees whose working day in organization was 1999-12-31  using join.


use hr;
-- TASK5
SELECT employee_id,first_name,department_name,round(datediff(now(),hire_date)/365,0) as 'Experience' from
employees join departments using(department_id)
WHERE round(datediff(now(),hire_date)/365,0) > 25; 
-- INTERPRETATION: Extracted the employee id and firstname and department name who had completed atleast 25 years of experience this is done using datediff 


  


