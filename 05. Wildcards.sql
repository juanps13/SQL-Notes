USE employees;

/* Percent (%): Represents zero, one, or multiple characters. */
SELECT *
FROM employees
WHERE first_name LIKE 'S%';

SELECT *
FROM employees
WHERE hire_date LIKE '1989%';

SELECT *
FROM employees
WHERE first_name NOT LIKE 'SANI%';

/* Underscore (_): Represents a single character. */
SELECT * 
FROM employees 
WHERE first_name LIKE '_a%';

/* Square Brackets ([ ]): Used to specify a set of characters. */
SELECT * 
FROM employees 
WHERE first_name LIKE '[A-H]%';

/* Caret (^): Used within square brackets to negate the set of characters. */
SELECT * 
FROM employees 
WHERE first_name NOT LIKE '[^A-C]%';

