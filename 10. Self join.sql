USE employees;

CREATE TABLE IF NOT EXISTS emp_manager
	(emp_no INT,
	dept_no VARCHAR(10),
	manager_no INT
	);

INSERT INTO emp_manager
VALUES 
	(10002, 'd007', 10006),
    (10003, 'd004', 10006),
    (10004, 'd004', 10003),
    (10005, 'd005', 10006),
    (10006, 'd005', 10008),
    (10007, 'd007', 10008),
    (10008, 'd005', 10006);

/* SELF JOIN */
/* It's joining a table with itself */
/* If we want to combine certain rows of a table with with other rows of the same table */
/* using aliases is obligatory, since it's the only way to distinguish the tables */

/* Retrieve from the above table all the employees that are managers */

SELECT e1.*
FROM emp_manager e1
JOIN emp_manager e2 ON e1.emp_no = e2.manager_no;

/* The problem with the above query is that these employees appear in multiple rows */
/* If we want only one time each employee number, then: */

SELECT DISTINCT e1.*
FROM emp_manager e1
JOIN emp_manager e2 ON e1.emp_no = e2.manager_no;

/* Finish */
DROP TABLE emp_manager;