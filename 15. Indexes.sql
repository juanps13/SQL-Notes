USE employees;

/* The larger a database is, the slower the process of finding the record or records you need.
Indexes speed up the processes.alterHowever if the database is small, the cost of an index may be higher than the benefits */

/* The primary and foreign keys are indexes.
A list of the indexes can be found in the "info" section of the tables un MySQL Workbench */

/* Example */
SELECT *
FROM salaries
WHERE salary > 89000;

CREATE INDEX i_salary ON salaries(salary);

SELECT *
FROM salaries
WHERE salary > 89000;

/* The index can be composite */
CREATE INDEX i_composite_salary ON salaries(emp_no, salary);