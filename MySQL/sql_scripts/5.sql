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
    departments_dup
ORDER BY dept_no ASC;
ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL; 
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');
ALTER TABLE employees.departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;
insert into departments values ('d010', 'Business Analysis');

-- IFNULL()

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided')
FROM
    departments_dup;
    
SELECT 
    dept_no, dept_name, IFNULL(dept_no, dept_name) AS dept_info
FROM
    departments_dup;


-- COALESCE()

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup
ORDER BY dept_no ASC;

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup;

alter table departments_dup drop column dept_manager;
alter table departments_dup change column dept_no dept_no char(4) null;
alter table departments_dup change column dept_name dept_name varchar(40) null;
insert into departments_dup(dept_name) values ('Public Relations');
DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';

SELECT 
    *
FROM
    departments_dup;

