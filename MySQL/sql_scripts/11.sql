SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
    create index my_index on employees(hire_date);
    
    show index from salaries from	employees;
    drop index my_index on employees;
    
    select * from salaries where salary > 89000;
    create index salary_index on salaries(salary);
    
    -- case statement 
    
    SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;
    
SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;
    
    
    SELECT 
    emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM
    employees;
    
    
    SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary raised by more than $20000 but less than $30000'
        ELSE 'Salary was raised by less than $20,000'
    END AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

-- window functions

