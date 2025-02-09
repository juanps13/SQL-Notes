USE employees;

/* VALUE WINDOW FUNCTIONS */
/* As opposed to ranking window functions, value window functions return a value that can be found in the database */

/* LAG() and LEAD() */
/* If we want to see the current salary of an employee, his previous salary, his next salary and the difference between them */
/* LAG() shows the value from a field of a record that precedes the current row */
/* LEAD() shows the value from a field of a record that follows the current row */
/* (note that in this case it's useful to write the WINDOW clause separately) */
/* (also note that the PARTITION BY statement is not necessary since we have already defined the employee with a WHERE) */

SELECT
	emp_no,
    salary,
    LAG(salary) OVER w AS prev_salary,
    LEAD(salary) OVER w AS next_salary,
    salary - LAG(salary) OVER w AS diff_salary_curr_prev,
    LEAD(salary) OVER w - salary AS diff_salary_next_curr
FROM salaries
WHERE emp_no = 10001
WINDOW w AS (ORDER BY salary);


/* LAG() and LEAD() value window functions can have a second argument, 
designating how many rows/steps back  we'd like to refer to with respect to a given record. */

/* Create a query to show the salary values associated to each employee number (in ascending order). 
Let the output contain the following six columns:
- the employee number
- the salary value of an employee's current salary
- the employee's previous salary
- the employee's contract salary value preceding their previous salary
- the employee's next salary
- the employee's contract salary value subsequent to their next salary
Restrict the output to the first 1000 records you can obtain.
*/

SELECT
	emp_no,
    salary,
    LAG(salary) OVER w AS prev_salary,
    LAG(salary, 2) OVER w AS prev_2_salary,
    LEAD(salary) OVER w AS next_salary,
    LEAD(salary, 2) OVER w AS next_2_salary
FROM salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)
LIMIT 1000;