USE employees;

/* TEMPORARY TABLES */
/* Is another way to produce a temporary dataset */
/* They cannot be invoked twice within a query */


/* Obtain a list containing the highest cotract salary values signed by all female employees who have worked in the company */

CREATE TEMPORARY TABLE table_f_max_salaries
SELECT
	s.emp_no,
    MAX(s.salary) AS f_max_salary
FROM salaries s
INNER JOIN employees e ON s.emp_no = e.emp_no
WHERE e.gender = 'F'
GROUP BY e.emp_no;

SELECT *
FROM table_f_max_salaries
WHERE emp_no > 10050;

DROP TABLE IF EXISTS table_f_max_salaries;