USE employees;

/* COUNT */
/* How many salaries are higher or equal to $75405 */
SELECT COUNT(*)
FROM salaries
WHERE salary >= 75405;

SELECT title, COUNT(emp_no) AS emps_with_same_job_title
FROM titles
WHERE to_date = '9999-01-01'
GROUP BY title;

/* COUNT DISTINCT */
SELECT COUNT(DISTINCT title)
FROM titles;

/* HAVING statement. Is like WHERE but for aggregate functions */
SELECT emp_no, AVG(salary) AS average_salary
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) > 70000
ORDER BY emp_no ASC;

/* Using HAVING and WHERE */
/* Select the employee numbers of all individuals who have signed more than one contract after the 1st of January 1990. 
Sort the output by employee number in ascending order. */
SELECT emp_no
FROM dept_emp
WHERE from_date > '1990-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no; 

/* SUM function */
SELECT SUM(salary)
FROM salaries
WHERE from_date < '1995-01-01';

/* MIN and MAX functions */
SELECT MIN(dept_no)
FROM departments;

/* AVG function */
SELECT AVG(salary)
FROM salaries
WHERE from_date <= '1994-12-31';
