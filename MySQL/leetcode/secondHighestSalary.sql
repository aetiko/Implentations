CREATE TABLE IF NOT EXISTS Employee (
    id INT,
    salary INT
);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

/* Write an SQL query to report the second highest salary from the Employee table.
 If there is no second highest salary, the query should report null.*/
 
 SELECT 
    salary AS SecondHighestSalary
FROM
    Employee
GROUP BY salary
ORDER BY salary ASC
LIMIT 1,1;

/* Write an SQL query to report the second highest salary from the Employee table.
 If there is no third  highest salary, the query should report null.*/

SELECT 
    salary AS SecondHighestSalary
FROM
    Employee
GROUP BY salary
ORDER BY salary ASC
LIMIT 2,1;

/* Write an SQL query to report the second highest salary from the Employee table.
 If there is no n highest salary, the query should report null.*/
 
 SELECT 
    salary AS SecondHighestSalary
FROM
    Employee
GROUP BY salary
ORDER BY salary ASC
LIMIT n-1, 1;