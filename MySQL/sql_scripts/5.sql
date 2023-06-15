-- insert statement 

SELECT 
    *
FROM
    employees
LIMIT 10;
insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date) values (999903, '1999-06-08', 'Ayoola', 'Etiko', 'M', '2024-01-01');
insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date) values (999904, '1999-06-08', 'Nurudeen', 'Etiko', 'M', '2024-01-01');
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('ayo%');
    
SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;
insert into titles (emp_no, title, from_date) values (999903, 'Junior Developer', '2024-01-01');

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;
insert into dept_emp values(999903, 'd005', '2024-01-01', '9999-01-01');

-- insert into select

SELECT 
    *
FROM
    departments
LIMIT 10;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

insert into departments_dup (dept_no, dept_name) select dept_no, dept_name from departments where dept_no is not null;
SELECT 
    *
FROM
    departments_dup;

insert into departments values ('d010', 'Business Analysis');


