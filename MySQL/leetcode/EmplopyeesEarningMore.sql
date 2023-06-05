Create database if not exists Leetcode;
use Leetcode;
Create table If Not Exists Employee (id int, name varchar(255), salary int, managerId int);
Truncate table Employee;
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', 'None');
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', 'None');

-- Write an SQL query to find the employees who earn more than their managers.

select t1.name as Employee from Employee t1 join Employee t2 
on t1.managerId = t2.id
where t1.salary > t2.salary;