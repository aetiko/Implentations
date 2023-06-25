Create database if not exists Leetcode;
use Leetcode;

Create Table If Not Exists Insurance (pid int, tiv_2015 float, tiv_2016 float, lat float, lon float);
Truncate table Insurance;
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('1', '10', '5', '10', '10');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('2', '20', '20', '20', '20');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('3', '10', '30', '20', '20');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('4', '10', '40', '40', '40');

/* Write an SQL query to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city like any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places. */


SELECT 
    *
FROM
    Insurance
WHERE
    tiv_2015 <> tiv_2016
GROUP BY lat or lon
HAVING COUNT(lat and lon) = 1;