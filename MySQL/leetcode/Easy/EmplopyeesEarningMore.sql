Create database if not exists Leetcode;
use Leetcode;
CREATE TABLE IF NOT EXISTS Employee (
    id INT,
    name VARCHAR(255),
    salary INT,
    managerId INT
);
Truncate table Employee;
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', 'None');
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', 'None');

-- Write an SQL query to find the employees who earn more than their managers.

SELECT 
    t1.name AS Employee
FROM
    Employee t1
        JOIN
    Employee t2 ON t1.managerId = t2.id
WHERE
    t1.salary > t2.salary;