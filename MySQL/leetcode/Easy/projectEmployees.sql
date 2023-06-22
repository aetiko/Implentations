Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS Project (
    project_id INT,
    employee_id INT
);
CREATE TABLE IF NOT EXISTS Employee (
    employee_id INT,
    name VARCHAR(10),
    experience_years INT
);
Truncate table Project;
insert into Project (project_id, employee_id) values ('1', '1');
insert into Project (project_id, employee_id) values ('1', '2');
insert into Project (project_id, employee_id) values ('1', '3');
insert into Project (project_id, employee_id) values ('2', '1');
insert into Project (project_id, employee_id) values ('2', '4');
Truncate table Employee;
insert into Employee (employee_id, name, experience_years) values ('1', 'Khaled', '3');
insert into Employee (employee_id, name, experience_years) values ('2', 'Ali', '2');
insert into Employee (employee_id, name, experience_years) values ('3', 'John', '1');
insert into Employee (employee_id, name, experience_years) values ('4', 'Doe', '2');

/* Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.*/

SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM
    Project p
        JOIN
    employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id;

