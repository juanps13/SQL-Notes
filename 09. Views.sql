USE employees;

/* Views */
/* Views act as dynamic tables, they instantly reflect changes in the base table */

DROP VIEW IF EXISTS v_manager_avg_salary;

CREATE VIEW v_manager_avg_salary AS
SELECT
    ROUND(AVG(s.salary), 2) AS avg_salary
FROM
    salaries s
WHERE
    s.emp_no IN (10002, 10005, 10007)
    AND YEAR(s.from_date) BETWEEN 1991 AND 1996;
    
SELECT *
FROM v_manager_avg_salary;