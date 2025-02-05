USE employees;

/* THE CASE STATEMENT */
/* It's a conditional statement 
The IF statement also exists in MySQL, the difference is that CASe can contain multiple conditional expressions */


/* It's useful when we want to recategorize values (making clusters or categories,
or show them different than how they appear on the table */

/* Examples */
SELECT 
	emp_no, 
    CASE gender
		WHEN 'M' THEN 'Male'
        WHEN 'F' THEN 'Female'
        ELSE 'N/A'
        END AS 'gender'
FROM employees;

/* Example 2 */
/* Obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. 
Create a fourth column in the query, indicating whether this employee is also a manager, 
according to the data provided in the dept_manager table, or a regular employee. */

SELECT 
	e.emp_no, 
	e.first_name, 
    e.last_name,
	CASE
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
		ELSE 'Employee'
		END AS is_manager
FROM employees e
LEFT JOIN dept_manager dm ON dm.emp_no = e.emp_no
WHERE e.emp_no > 109990;
 
/* Example 3 */
/* Extract a dataset containing the following information about the managers: employee number, first name, and last name. 
Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, 
and another one saying whether this salary raise was higher than $30,000 or NOT. */

SELECT
	dm.emp_no,  
	e.first_name,  
	e.last_name,  
	MAX(s.salary) - MIN(s.salary) AS salary_difference,  
	CASE  
		WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'  
		ELSE 'Salary was NOT raised by more then $30,000'  
	END AS salary_raise  
FROM dept_manager dm 
JOIN employees e ON e.emp_no = dm.emp_no  
JOIN salaries s ON s.emp_no = dm.emp_no  
GROUP BY s.emp_no; 

/* Example 4 */
/* Extract the employee number, first name, and last name of the first 100 employees, 
and add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, 
or “Not an employee anymore” if they aren’t. */

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;

/* Example 5 */
/* Retrieve the employee number (emp_no), first name (first_name), and last name (last_name) of all employees from the employees table 
who also have records in the department employees table dept_emp. 
Add a fourth column named current_status displaying "Currently working" if their contract in the dept_emp table ends on or 
after January 1, 2025, or later. Otherwise, display "No longer with the company". 
Use GROUP BY on the employee number, first name, and last name to obtain the desired result. */

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) >= '2025-01-01' THEN 'Currently working'
        ELSE 'No longer with the company'
    END AS current_status
FROM
    employees AS e
JOIN
    dept_emp AS de ON e.emp_no = de.emp_no
GROUP BY
    e.emp_no, e.first_name, e.last_name;