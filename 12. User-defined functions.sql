USE employees;

/* FUNCTIONS */

/* The functions does not have output parameters, only inputs */
/* However, what exists is a RETURN value (and there can only be one Return value) */
/* You have to DECLARE the Return Value in the function*/
/*  (In certain versions of MySQL you have to add DETERMINISTIC NO SQL READS SQL DATA before BEGIN) */

DELIMITER $$

CREATE FUNCTION f_emp_avg_salary (p_emp_first_name VARCHAR(30), p_emp_last_name VARCHAR(30)) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
DECLARE v_emp_avg_salary2 DECIMAL(10,2);

SELECT
	AVG(s.salary) INTO v_emp_avg_salary2
FROM salaries AS s
JOIN employees AS e ON e.emp_no = s.emp_no
WHERE
	e.first_name = p_emp_first_name AND e.last_name = p_emp_last_name;

RETURN v_emp_avg_salary2;
END$$

DELIMITER ;

/* To use a function SELECT has to be used (not CALL as in the procedures */

SELECT f_emp_avg_salary ('Aruna','Journel');

/* Another example */
/* Create a function called 'emp_info' that takes the first and last name of an employee as parameters, */
/* and returns the salary from the newest contract of that employee. */

DELIMITER $$

CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN

	DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);

SELECT
    MAX(from_date) INTO v_max_from_date 
    FROM employees e
	JOIN salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
	AND e.last_name = p_last_name;

SELECT
    s.salary INTO v_salary 
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;

RETURN v_salary;

END$$
DELIMITER ;

SELECT EMP_INFO('Aruna', 'Journel');

/* COMPARISON BETWEEN FUNCTIONS AND STORED PROCEDURES */
/* If we want to modify the data (INSERT, UPDATE, DELETE), the correct thing to do is to use a procedure (since there is no return value) */
/* Functions have only one return value, procedures can have more than one */
/* If we only have one return value, the correct thing to do (usually) is to use a function */
/* Procedures CANNOT be included within another SELECT statement, functions can */
/* This last point is useful if we want to select the result of a function within a query */

SET @v_emp_no_random = 11300;
SELECT
	emp_no,
    hire_date,
    first_name,
    last_name,
    f_emp_avg_salary('Aruna','Journel')
FROM employees
WHERE emp_no = @v_emp_no_random;