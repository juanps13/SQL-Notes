USE employees;

/* 
MySQL trigger is a type of stored program associated with a table that will be activated automatically 
once a specific event related to the table of association occurs.
It can be activated by 3 DML statements: INSERT, UPDATE or DELETE.
It's usually used to preserve data integrity.

In the ‘info’ section of the “employees” database in MySQL Workbench a can be found with information of all the triggers.

There are triggers that are activated "before" de DML statement or "after".
*/

/* Before the below example, use the COMMIT statement */

COMMIT;

/* The syntax is similar to the stored procedures since they are a type of stored procedures */
/* Example */

DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = 0; 
	END IF; 
END $$

DELIMITER ;

/* Check the values of the “Salaries” table for employee 10001. */
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
/* Insert a new value that "triggers" the trigger */

INSERT INTO salaries VALUES ('10001', -92891, '2010-06-22', '9999-01-01');

/* Check the values of the “Salaries” table and look for the value inserted. */
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
    
/* Another example */

DELIMITER $$

CREATE TRIGGER trig_upd_salary
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = OLD.salary; 
	END IF; 
END $$

DELIMITER ;

/* Finally execute the ROLLBACK statement to restore the data in the database */

ROLLBACK;