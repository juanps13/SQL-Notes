USE employees;

/* Common Table Expressions (CTEs) */
/* It's a way to obtaina result table that is only available inside the execution of another query */
/* It's very similar to a subquery , in fact the same results can usually be obtained with a sub query
but it's more clear from a coding point of view */
/* In addition, CTEs can be referred multiple times within a query, if we use subquerys we have to type them multiple times */

/* How many male employees have never signed a contract with a salary value higher than or equal to the all-time company salary average. */

WITH cte AS (
SELECT AVG(salary) AS avg_salary 
FROM salaries
)
SELECT
SUM(CASE WHEN s.salary < c.avg_salary THEN 1 ELSE 0 END) AS no_salaries_below_avg,
COUNT(s.salary) AS no_of_salary_contracts
FROM salaries s 
INNER JOIN employees e ON s.emp_no = e.emp_no
INNER JOIN cte c
WHERE e.gender = 'M';


/* MULTIPLE CTEs */
/* How many female employees highest contract salary were hogher tha the all time company average ? */

WITH cte_avg_salary AS (
SELECT AVG(salary) AS avg_salary
FROM salaries),

cte_max_f_salary AS (
SELECT s.emp_no, MAX(s.salary) AS f_max_salary
FROM salaries s
INNER JOIN employees e ON s.emp_no = e.emp_no
WHERE e.gender = 'F'
GROUP BY s.emp_no)

SELECT 
	SUM(CASE WHEN c2.f_max_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_max_salaries_above_avg,
	COUNT(c2.emp_no) AS total_f_salaries
FROM employees e
INNER JOIN cte_max_f_salary c2 ON e.emp_no = c2.emp_no
CROSS JOIN cte_avg_salary c1; 
