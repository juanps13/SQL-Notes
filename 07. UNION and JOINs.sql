USE employees;

/* INNER JOIN */
SELECT
    de.emp_no,
    de.from_date,
    d.dept_name
FROM
    dept_emp de
INNER JOIN
    departments d ON de.dept_no = d.dept_no;
    
/* LEFT JOIN */
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM employees e
LEFT JOIN dept_manager d ON e.emp_no = d.emp_no
WHERE last_name = 'Bamford'
ORDER BY d.dept_no DESC;

/* CROSS JOIN */
/* Connects ALL the values, not just those that match */
/* Particularly useful when the tables are not well connected */
/* Return a list with all possible combinations between managers from the dept_manager table 
and department number 6 from the departments table. */
SELECT dm.*, d.*
FROM dept_manager dm
CROSS JOIN departments d
WHERE d.dept_no = 'd006';

/* Joining more than 2 tables */
SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    t.from_date,
    d.dept_name
FROM
    employees e
INNER JOIN
    titles t ON e.emp_no = t.emp_no
INNER JOIN
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    t.title = 'Senior Engineer';
    
/* UNION */
/* Unlike JOIN, all the columns must be the same */
/* With UNION ALL if a row is duplicated it will be included twice */
SELECT
    emp_no,
    first_name,
    last_name,
    NULL AS dept_no,  -- NULL for dept_no in the first subset
    NULL AS from_date -- NULL for from_date in the first subset
FROM
    employees
WHERE
    last_name = 'Bamford'

UNION

SELECT
    NULL AS emp_no,  -- NULL for emp_no in the second subset
    NULL AS first_name, -- NULL for first_name in the second subset
    NULL AS last_name,  -- NULL for last_name in the second subset
    dept_no,
    from_date
FROM
    dept_manager;