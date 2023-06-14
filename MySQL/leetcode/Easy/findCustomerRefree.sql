Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS Customer (
    id INT,
    name VARCHAR(25),
    referee_id INT
);
Truncate table Customer;
insert into Customer (id, name) values ('1', 'Will');
insert into Customer (id, name) values ('2', 'Jane');
insert into Customer (id, name, referee_id) values ('3', 'Alex', '2');
insert into Customer (id, name) values ('4', 'Bill');
insert into Customer (id, name, referee_id) values ('5', 'Zack', '1');
insert into Customer (id, name, referee_id) values ('6', 'Mark', '2');

/* Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.*/


SELECT 
    name
FROM
    customer
WHERE
    referee_id <> 2 OR referee_id IS NULL;