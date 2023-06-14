Create database if not exists Leetcode;
use Leetcode;

Create table If Not Exists Employee (Id int, Salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

/* Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null. */

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
set N-1
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT N, 1
  );
END