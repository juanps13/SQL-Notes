USE employees;

/* WINDOW FUNCTIONS */
/* They perform calculations for every record in a dataset */
/* There are 2 types: Aggregate window functions & non aggregate window functions */
/* Non aggregate window functions can be Ranking window functions or Value window functions */

/* If the OVER() statement is empty, then the function will be applied to all the records*/
/* However, window functions are more usefull when they are applied to a group of records */
/* With the PARTITION BY statement we can specify the groups in which the table is subdivided */

/* ROW_NUMBER() */
/* To assign a number to each row */
SELECT emp_no, salary, ROW_NUMBER() OVER() AS row_num
FROM salaries;

/* To assign a number to each record of each employee */
SELECT emp_no, salary, ROW_NUMBER() OVER(PARTITION BY emp_no) AS row_num
FROM salaries;

/* Moreover, an ORDER BY statement can be added within the OVER() statement to assign the numbers in a certain order */
SELECT emp_no, salary, ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM salaries;

/* Other syntax alternative for window functions. 
This is usefull when we have several window functions,
or when we have to refer the window multiple times in the query */
SELECT emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

/* PARTITION BY vs. GROUP BY */
/* PARTITION BY does not reduce the number of records returned, GROUP BY does */