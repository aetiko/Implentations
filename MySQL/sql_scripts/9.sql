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
    join salaries s 
    on e.emp_no = s.emp_no 
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

delimiter $$
create procedure emp_info(in p_first_name varchar(11), in p_last_name varchar(11), out p_emp_no integer)
begin  
	select e.emp_no into p_emp_no from employees e where e.first_name = p_first_name and e.last_name = p_last_name;
end$$
delimiter ;

drop procedure emp_info;

call emp_info('Ayoola', 'Etiko');
