-- views 

SELECT 
    *
FROM
    dept_emp;
    
SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS num
FROM
    dept_emp
GROUP BY emp_no
HAVING num > 1;

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    
    SELECT * FROM employees.v_dept_emp_latest_date;
    
CREATE OR REPLACE VIEW v_avg_manager_salary AS
    SELECT 
        ROUND(AVG(salary), 2) AS salary
    FROM
        salaries s
            JOIN
        dept_manager d ON s.emp_no = d.emp_no;
        
SELECT 
    *
FROM
    employees.v_avg_manager_salary;

-- stored routines
use employees;
drop procedure if exists select_employees;
delimiter $$
create procedure select_employees()
begin  
	select * from employees
	limit 1000;
end$$
delimiter ;
call employees.select_employees();

call employees.average_employees_salary();

drop procedure if exists average_employees_salary;
delimiter $$
create procedure average_employees_salary()
begin  
	select avg(salary) from salaries;
end$$
delimiter ;

call employees.average_employees_salary();

drop procedure select_employees;

delimiter $$
create procedure emp_salary(in p_emp_no integer)
begin  
	select e.first_name, e.last_name, avg(s.salary)
    from employees e 
    join salaries s on e.emp_no = s.emp_no 
    where e.emp_no = p_emp_no;
end$$
delimiter ;

drop procedure emp_salary;

call employees.emp_salary(10001);

delimiter $$
create procedure emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal(10,2))
begin  
	select avg(s.salary) into p_avg_salary from employees e join salaries s on e.emp_no = s.emp_no where e.emp_no = p_emp_no;
end$$
delimiter ;

drop procedure emp_avg_salary_out;

call emp_avg_salary_out(10001);

drop procedure emp_info;
delimiter $$
create procedure emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
begin  
	select e.emp_no into p_emp_no from employees e where e.first_name = p_first_name and e.last_name = p_last_name;
end$$
delimiter ;

drop procedure emp_info;

call employees.emp_info('Ayoola', 'Etiko');

-- Variables

SET @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @v_avg_salary);
SELECT ROUND(@v_avg_salary, 1) AS avg_sal;

set @v_emp_no = 0;
call employees.emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;


-- USer defined functions
drop function f_emp_avg_salary;
delimiter $$
create function f_emp_avg_salary(p_emp_no integer) returns decimal(10,2)
reads sql data
begin
declare v_avg_salary decimal(10,2);
SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = s.emp_no;
return v_avg_salary;
end$$

select employees.f_emp_avg_salary(9000);

drop function f_emp_info;
delimiter $$
create function f_emp_info(p_first_name varchar(255), p_last_name varchar(255)) returns decimal(10,2)
deterministic
begin
declare v_new_sal_contract decimal(10,2);
declare v_max_from_date date;

SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
SELECT 
    s.salary
INTO v_new_sal_contract FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
return v_new_sal_contract;
end$$
SELECT F_EMP_INFO('Aruna', 'Journel');
