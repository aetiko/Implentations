Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS Weather (
    id INT,
    recordDate DATE,
    temperature INT
);
Truncate table Weather;
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10');
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25');
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20');
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30');

/* Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).*/

SELECT 
    a.id
FROM
    Weather AS a,
    Weather AS b
WHERE
    a.recordDate-1 = b.recordDate
        AND a.temperature > b.temperature;
        
-- or 

SELECT 
    a.id
FROM
    Weather AS a,
    weather AS b
WHERE
    DATEDIFF(a.recordDate, b.recordDate) = 1
        AND a.temperature > b.temperature;