Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS MyNumbers (
    num INT
);
Truncate table MyNumbers;
insert into MyNumbers (num) values ('8');
insert into MyNumbers (num) values ('8');
insert into MyNumbers (num) values ('3');
insert into MyNumbers (num) values ('3');
insert into MyNumbers (num) values ('1');
insert into MyNumbers (num) values ('1');
insert into MyNumbers (num) values ('4');
insert into MyNumbers (num) values ('4');
insert into MyNumbers (num) values ('5');
insert into MyNumbers (num) values ('5');
insert into MyNumbers (num) values ('6');
insert into MyNumbers (num) values ('6');

/* A single number is a number that appeared only once in the MyNumbers table.

Write an SQL query to report the largest single number. If there is no single number, report null.*/

SELECT 
    COALESCE(MAX(num), NULL) AS num
FROM
    MyNumbers
GROUP BY num
HAVING COUNT(num) = 1
ORDER BY num DESC
LIMIT 1, 1;

SELECT 
    MAX(num) AS num
FROM
    (SELECT 
        num
    FROM
        MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1) AS a;
