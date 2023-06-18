Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS Salary (
    id INT,
    name VARCHAR(100),
    sex CHAR(1),
    salary INT
);
Truncate table Salary;
insert into Salary (id, name, sex, salary) values ('1', 'A', 'm', '2500');
insert into Salary (id, name, sex, salary) values ('2', 'B', 'f', '1500');
insert into Salary (id, name, sex, salary) values ('3', 'C', 'm', '5500');
insert into Salary (id, name, sex, salary) values ('4', 'D', 'f', '500');

/*Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa)
 with a single update statement and no intermediate temporary tables.*/
 
 
UPDATE salary 
SET 
    sex = CASE
        WHEN sex = 'm' THEN 'f'
        WHEN sex = 'f' THEN 'm'
    END; 
