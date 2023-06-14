Create database if not exists Leetcode;
use Leetcode;
CREATE TABLE IF NOT EXISTS Employee (
    empId INT,
    name VARCHAR(255),
    supervisor INT,
    salary INT
);
CREATE TABLE IF NOT EXISTS Bonus (
    empId INT,
    bonus INT
);
Truncate table Employee;
insert into Employee (empId, name, supervisor, salary) values ('3', 'Brad', 'None', '4000');
insert into Employee (empId, name, supervisor, salary) values ('1', 'John', '3', '1000');
insert into Employee (empId, name, supervisor, salary) values ('2', 'Dan', '3', '2000');
insert into Employee (empId, name, supervisor, salary) values ('4', 'Thomas', '3', '4000');
Truncate table Bonus;
insert into Bonus (empId, bonus) values ('2', '500');
insert into Bonus (empId, bonus) values ('4', '2000');

/* Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000.

Return the result table in any order.*/

SELECT 
    Employee.name, Bonus.bonus
FROM
    Employee
        LEFT JOIN
    Bonus ON Employee.empId = Bonus.empId
WHERE
    IFNULL(Bonus.bonus, 0) < 1000;

