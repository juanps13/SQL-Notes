USE employees;

/* STORED PROCEDURES */

/* It's important to change the delimiter first and then reestablish it, since the ";" sign will be used inside the procedure*/
/* The sentence is "CREATE PROCEDURE procedure_name()" and then BEGIN and END */
/* Between () arguments can be included if needed */

/* simple example:*/

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
		SELECT * FROM employees
		LIMIT 1000;
END$$
DELIMITER ;

/* To execute the procedure use the sentence CALL */

CALL employees.select_employees();

/* Second example: */

DELIMITER $$
CREATE PROCEDURE average_salary()
BEGIN
		SELECT
			AVG(salary) AS avg_salary
		FROM salaries;
END $$
DELIMITER ;

CALL average_salary();

/* Procedure with an input parameter */
/* In the WHERE clause appears how to insert it */

DROP PROCEDURE IF EXISTS emp_salary;

DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
		SELECT
			e.first_name,
            e.last_name,
            s.salary
		FROM employees AS e
		JOIN salaries AS s
		ON s.emp_no = e.emp_no
		WHERE e.emp_no = p_emp_no;
END$$
DELIMITER ;

CALL emp_salary(11300);

/* Procedure with output parameter */
/* the output parameter is stored in a new variable */

DROP PROCEDURE IF EXISTS emp_avg_salary;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER, OUT p_emp_avg_salary DECIMAL(10,2))
BEGIN
		SELECT
            AVG(salary) INTO p_emp_avg_salary
		FROM salaries
		WHERE emp_no = p_emp_no;
END$$
DELIMITER ;

/* In order to execute this we need to create a new variable (where the output parameter will be stored) */
/* Always with @ at the begining. Usually with 0 value at first */

SET @v_emp_avg_salary = 0;
CALL emp_avg_salary(11300, @v_emp_avg_salary);
SELECT @v_emp_avg_salary;