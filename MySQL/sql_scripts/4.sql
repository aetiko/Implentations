-- aggregate functions
-- count()

 SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    
SELECT 
    COUNT(first_name)
FROM
    employees
WHERE
    first_name IS NOT NULL;
    
SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= '100000';

SELECT 
    COUNT(*)
FROM
    dept_manager;
    
-- sum()

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    salary >= '100000';

-- min()

SELECT 
    MIN(salary)
FROM
    salaries;

-- max()

SELECT 
    MAX(salary)
FROM
    salaries;

-- avg()

SELECT 
    AVG(salary)
FROM
    salaries;
    
-- order by clause

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

-- group by clause

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    first_name LIKE ('%ay%')
GROUP BY first_name
ORDER BY first_name ASC;

-- Aliases
SELECT 
    salary, COUNT(salary) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

-- having clause

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING names_count > 250
ORDER BY first_name;

SELECT 
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no, from_date, to_date
ORDER BY emp_no;


SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

select * from dept_emp;

SELECT 
    emp_no, COUNT(emp_no) AS emp_count
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

-- using limit clause 


SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    *
FROM
    dept_emp
LIMIT 100;


