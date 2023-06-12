-- Database manipulation using SELECT statement
-- get the name of all employees?

SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees;

SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    departments;


-- ADDING THE WHERE CLAUSE

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
-- ADDING THE AND OPERATOR

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
    -- ADDING THE OR OPERATOR
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' OR first_name = 'Elvis';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' OR first_name = 'Aruna';
    
-- ADDING THE logical precedence

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
-- ADDING THE IN AND NOT IN CLAUSE

SELECT 
    *
FROM
    employees
WHERE
    FIRST_NAME IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    FIRST_NAME NOT IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    FIRST_NAME IN ('Denis', 'Elvis');
    
SELECT 
    *
FROM
    employees
WHERE
    FIRST_NAME NOT IN ('John', 'Mark', 'Jacob');
    
-- ADDING THE LIKE AND NOT LIKE

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ay');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('ay%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ay%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('_ark');
    
-- USING WILDCARD CHARACTERS

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');
    
    
-- between add and not between and 

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
    SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';
    
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000';
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';
    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
SELECT 
    *
FROM
    employees
WHERE
    last_name IS NULL;
    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
-- other comparison operators

SELECT 
    *
FROM
    employees
WHERE
-- <> ==== !=
    first_name <> 'Mark';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';
        
SELECT 
    *
FROM
    salaries
WHERE
    salary > '150000';
    
-- select distinct to remove duplicates

SELECT DISTINCT
    gender
FROM
    employees;
    
SELECT DISTINCT
    hire_date
FROM
    employees limit 1000;

