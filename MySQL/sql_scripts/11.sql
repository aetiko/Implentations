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

select emp_no, salary, row_number() over w as row_num from salaries window w as (partition by emp_no order by salary desc);

select emp_no, salary, row_number() over() as row_num,
row_number() over (partition by emp_no) as row_num2,
row_number() over (partition by emp_no order by salary desc) as row_num3,
row_number() over (order by salary desc) as row_num4 from salaries;

select dm.emp_no, salary, row_number() over () as row_num, 
row_number() over (partition by emp_no order by salary desc) as row_num2 from dept_manager dm join salaries s on dm.emp_no = s.emp_no order by row_num, emp_no, salary ASC;

select dm.emp_no, salary, row_number() over(partition by emp_no order by salary asc) as row_num1, 
row_number() over(partition by emp_no order by salary desc) as row_num2 from dept_manager dm join salaries s on dm.emp_no = s.emp_no;

select * from employees;

select first_name, emp_no, row_number() over (partition by emp_no order by emp_no asc) as row_num1 from employees;

select a.emp_no, a.salary as max_salary from( select emp_no, salary, row_number() over w as row_num from salaries window w as (partition by emp_no order by salary asc)) a where a.row_num= 1;

select emp_no, salary, dense_rank() over w as rank_num from salaries where emp_no = 11839 window w as (partition by emp_no order by salary desc);

select emp_no, salary, row_number() over w as rank_num from salaries where emp_no = 10560 window w as (partition by emp_no order by salary desc);

select 
d.dept_no, 
d.dept_name, 
dm.emp_no, 
rank() over w as department_salary_ranking, s.salary, 
s.from_date as salary_from_date,
 s.to_date as salary_to_date, 
 dm.from_date as dept_manager_from_date, 
 dm.to_date as dept_manager_from_date 
from dept_manager dm 
join salaries s on s.emp_no = dm.emp_no 
and s.from_date between dm.from_date and dm.to_date
and s.to_date between dm.from_date and dm.to_date
join departments d on d.dept_no = dm.dept_no 
window w as (partition by dm.dept_no order by s.salary desc);


Select e.emp_no, rank() over w as employee_salary_ranking, s.salary from employees e join salaries s on s.emp_no = e.emp_no where e.emp_no between 10500 and 10600 window w as (partition by e.emp_no order by s.salary desc);


SELECT 
    emp_no, salary,
    lag(salary) over w as previous_salary,
    lead(salary) over w as next_salary,
    salary - lag(salary) over w as difference_previous_salary,
    salary - lead(salary) over w as difference_next_salary
FROM
    salaries
WHERE
    emp_no = '10001'
    window w as (order by salary asc); 


select 
emp_no,
salary,
lag(salary) over w as previous_salary,
lead(salary) over w as next_salary,
salary - lag(salary) over w as difference_previous_salary,
salary - lead(salary) over w as difference_next_salary
from salaries where salary > 80000 and emp_no between 10500 and 10600 window w as (partition by emp_no order by salary asc);

select 
emp_no,
salary,
lag(salary) over w as previous_salary,
salary - lag(salary, 2) over w as difference_previous_salary,
lead(salary) over w as next_salary,
salary - lead(salary, 2) over w as difference_next_salary
from salaries where emp_no between 10500 and 10600 window w as (partition by emp_no order by salary asc)
limit 1000;


