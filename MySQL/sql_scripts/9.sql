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