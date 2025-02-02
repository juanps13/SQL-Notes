USE employees;

/* Basic query */
SELECT *
FROM employees;

/* LIMIT statement */
SELECT *
FROM employees
LIMIT 10;

/* WHERE clause */
SELECT *
FROM employees
WHERE first_name = 'Saniya';

/* AND statement */
SELECT *
FROM employees
WHERE last_name = 'Bamford' 
AND gender = 'F';

/* OR statement */
SELECT *
FROM employees
WHERE first_name = 'Bezalel'
OR first_name = 'Anneke';

/* Multiple conditions */
SELECT *
FROM employees
WHERE gender = 'F'
AND (last_name = 'Peac'
OR last_name = 'Bamford');

/* IN - NOT IN statement */
SELECT *
FROM employees
WHERE first_name IN ('Parto', 'Georgi');

SELECT *
FROM employees
WHERE first_name NOT IN ('Georgi', 'Parto', 'Anneke');

/* BETWEEN */
SELECT *
FROM salaries
WHERE salary BETWEEN 71000 AND 79000;

SELECT *
FROM employees
WHERE emp_no NOT BETWEEN 10002 AND 10009;

SELECT dept_name
FROM departments
WHERE dept_no BETWEEN 'd002' AND 'd005';

/* NULL and NOT NULL */
SELECT emp_no, first_name
FROM employees
WHERE last_name IS NOT NULL;

/* SELECT DISTINCT */
SELECT DISTINCT to_date
FROM titles;

/* ORDER BY */
SELECT *
FROM employees
ORDER BY birth_date DESC;

/* IFNULL function */
/* Retrieve the employee number, date of birth, and first name for all individuals from the employees table. 
Use a function to ensure that their last name is displayed in place of the first name if a null value is encountered 
in the first name for a given record. */
SELECT emp_no, birth_date, IFNULL(first_name, last_name) AS name
FROM employees;

/* COALESCE function */
/* Retrieve the employee number, date of birth, and first and last names for all individuals from the employees table. 
Use a function to ensure that "Not provided" is displayed in place of the first name if a null value is encountered for a given record. */
SELECT emp_no, birth_date, COALESCE(first_name, 'Not provided') AS first_name, last_name
FROM employees;