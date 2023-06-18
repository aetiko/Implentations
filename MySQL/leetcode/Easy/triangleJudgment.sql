Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS Triangle (
    x INT,
    y INT,
    z INT
);
Truncate table Triangle;
insert into Triangle (x, y, z) values ('13', '15', '30');
insert into Triangle (x, y, z) values ('10', '20', '15');

/* Write an SQL query to report for every three line segments whether they can form a triangle.*/

SELECT 
    x,
    y,
    z,
    CASE
        WHEN x + y <= z OR x + z <= y OR y + z <= x THEN 'no'
        ELSE 'yes'
    END AS triangle
FROM
    Triangle;