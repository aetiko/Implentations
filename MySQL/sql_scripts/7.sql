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

delete from dept_manager_dup where emp_no = '110228';
delete from departments_dup where dept_no = 'd009';

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
    where dept_name is null
ORDER BY m.dept_no ;

SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
WHERE
    last_name = 'Markovitch'
ORDER BY d.dept_no DESC, e.emp_no;

