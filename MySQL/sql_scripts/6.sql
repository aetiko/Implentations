-- update statement
-- To allow for update check preferences > SQL editor > unclick safe updates

commit;
rollback;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

UPDATE employees 
SET 
    birth_date = '1999-08-06',
    first_name = 'Ayoola'
WHERE
    emp_no = 999904;
    
-- learning to use the delete statement

SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    
DELETE FROM employees 
WHERE
    emp_no = 999903;
    
select * from departments;
delete from departments where dept_no = 'd010';

