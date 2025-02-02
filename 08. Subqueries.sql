USE employees;

/* Important: Usually the same result of the subqueries can be achieved through other ways (for example, using JOINS) */ 

/* Subqueries in the WHERE clause */
/* Select the first name and last name of all the managers*/
/* First name and last name are on the "employee" table, and the manager list is on the "dept_manager" table */
SELECT e.first_name, e.last_name
FROM employees e
WHERE e.emp_no IN (
	SELECT dm.emp_no
    FROM dept_manager dm);
    
/* other example */

SELECT emp_no, dept_no, from_date
FROM dept_manager
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE YEAR(birth_date) >= 1955
);

/* EXISTS and NOT EXISTS */
SELECT *
FROM salaries
WHERE EXISTS (
    SELECT *
    FROM titles
    WHERE titles.emp_no = salaries.emp_no
      AND titles.title = 'Engineer'
);

/* Subqueries in FROM and SELECT clause */

SELECT
    emp_no,
    title,
    (
        SELECT ROUND(AVG(salary), 2)
        FROM salaries
        WHERE salaries.emp_no = t.emp_no
    ) AS avg_salary
FROM (
    SELECT emp_no, title
    FROM titles
    WHERE title IN ('Staff', 'Engineer')
) AS t
ORDER BY avg_salary DESC;