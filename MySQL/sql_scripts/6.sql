-- update statement
-- To allow for update check preferences > SQL editor > unclick safe updates

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