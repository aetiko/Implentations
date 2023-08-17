-- working on different kind of joins in SQL

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

INSERT INTO dept_manager_dup
select * from dept_manager;
INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES (999904, '2017-01-01'),(999905, '2017-01-01'),(999906, '2017-01-01'),  (999907, '2017-01-01');
DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';
INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');
DELETE FROM departments_dup 
WHERE
    dept_name = 'd002';
    
SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup AS m
        INNER JOIN
    departments_dup AS d ON m.dept_no = d.dept_no;
    
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e
        INNER JOIN
    dept_manager d ON e.emp_no = d.emp_no;

insert into dept_manager_dup values('110228', 'd003', '1992-03-21', '9999-01-01');
insert into departments_dup values('d009', 'Customer Service');

DELETE FROM dept_manager_dup 
WHERE
    emp_no = '110228';
DELETE FROM departments_dup 
WHERE
    dept_no = 'd009';

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
WHERE
    dept_name IS NULL
ORDER BY m.dept_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
WHERE
    last_name = 'Markovitch'
ORDER BY d.dept_no DESC , e.emp_no;

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e,
    dept_emp d
WHERE
    e.emp_no = d.emp_no;
    
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e
        INNER JOIN
    dept_emp d ON e.emp_no = d.emp_no;
    
SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        INNER JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000;
    
-- One of these values, ‘only_full_group_by’, 
-- blocks certain type of group statements and that can potentially lead to Error Code 1055. 

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
-- if for some reason you’d like to disallow this behavior you can always execute the following command 
-- which will do exactly the opposite: 
-- it will add the “only_full_group_by” value to the expression.
set @@global.sql_mode := concat('ONLY_FULL_GROUP_BY,', @@global.sql_mode);
-- o adjust the relevant default settings, there is a system variable, called ‘sql_mode’, which needs to be reconfigured.
-- In order to view the current value of this variable in your case, you have to execute the following command.
select @@global.sql_mode;
commit;

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch's;
        
SELECT 
    e.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    dept_emp d
WHERE
    d.dept_no = 'd009';
    
SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    dept_emp d where e.emp_no < 10011;

SELECT 
    e.gender, ROUND(AVG(s.salary), 2) AS average_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;

-- more than 2 tables joined

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

SELECT 
    e.gender, COUNT(e.gender)
FROM
    employees e
        JOIN
    dept_manager d ON e.emp_no = d.emp_no
GROUP BY e.gender;

SELECT 
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

drop table if exists employees_dup;
create table employees_dup(
	emp_no int(11),
    birth_date date,
    first_name varchar(14),
    last_name varchar(16),
    gender enum('M','F'),
    hire_date date
);

 insert into employees_dup select e.* from employees e limit 20;
 
 SELECT 
    *
FROM
    employees_dup;
    
insert into employees_dup values ('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

-- Union all

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY - a.emp_no DESC;


