USE employees;

/* RANKING WINDOW FUNCTIONS */

/* ROW_NUMBER */
SELECT emp_no, salary, ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM salaries;

/* RANK() */
/* Similar to ROW_NUMBER with an ORDER BY, 
but RANK() is better at assigning rankings in the case that 2 values are the same 
Example: */

SELECT 
	emp_no, 
	salary, 
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_num,
    RANK() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS rank_num
FROM salaries
WHERE emp_no = 11839;

/* DENSE_RANK assigns the same rank to identical values without allowing gaps in the obtained ranks for subsequent rows. */

SELECT 
	emp_no, 
	salary, 
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_num,
    RANK() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS rank_num,
    DENSE_RANK() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS dense_rank_num
FROM salaries
WHERE emp_no = 11839;