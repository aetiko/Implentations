Create database if not exists Leetcode;
use Leetcode;

Create table If Not Exists Logs (id int, num int);
Truncate table Logs;
insert into Logs (id, num) values ('1', '1');
insert into Logs (id, num) values ('2', '1');
insert into Logs (id, num) values ('3', '1');
insert into Logs (id, num) values ('4', '2');
insert into Logs (id, num) values ('5', '1');
insert into Logs (id, num) values ('6', '2');
insert into Logs (id, num) values ('7', '2');

-- Write an SQL query to find all numbers that appear at least three times consecutively.

SELECT DISTINCT
    l1.num AS ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.id = l2.id + 1 AND l1.id = l3.id + 2
        AND l1.num = l2.num
        AND l1.num = l3.num;