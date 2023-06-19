Create database if not exists Leetcode;
use Leetcode;
CREATE TABLE IF NOT EXISTS Employee (
    id INT,
    name VARCHAR(255),
    salary INT,
    departmentId INT
);
CREATE TABLE IF NOT EXISTS Department (
    id INT,
    name VARCHAR(255)
);
Truncate table Employee;
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1');
insert into Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1');
insert into Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2');
insert into Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2');
insert into Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1');
Truncate table Department;
insert into Department (id, name) values ('1', 'IT');
insert into Department (id, name) values ('2', 'Sales');

/* Write an SQL query to find employees who have the highest salary in each of the departments. */



