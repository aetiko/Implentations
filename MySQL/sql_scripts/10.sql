-- session variables--  
set @s_var1 = 3;
select @s_var1;

-- Triggers --
Use employees;
commit;
DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = 0; 
	END IF; 
END $$

DELIMITER ;

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';

INSERT INTO salaries VALUES ('10001', -92891, '2010-06-22', '9999-01-01');
