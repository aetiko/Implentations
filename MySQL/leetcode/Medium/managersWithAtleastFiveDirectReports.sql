Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS Employee (
    id INT,
    name VARCHAR(255),
    department VARCHAR(255),
    managerId INT
);
Truncate table Employee;
insert into Employee (id, name, department) values ('101', 'John', 'A');
insert into Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101');
insert into Employee (id, name, department, managerId) values ('103', 'James', 'A', '101');
insert into Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101');
insert into Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101');
insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101');


/* Write an SQL query to report the managers with at least five direct reports.*/

SELECT 
    name
FROM
    employee
WHERE
    id IN (SELECT 
            managerId
        FROM
            employee
        GROUP BY managerId
        HAVING COUNT(id) > 4);