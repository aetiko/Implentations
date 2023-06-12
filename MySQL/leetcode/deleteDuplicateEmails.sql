Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS Person (
    Id INT,
    Email VARCHAR(255)
);
Truncate table Person;
insert into Person (id, email) values ('1', 'john@example.com');
insert into Person (id, email) values ('2', 'bob@example.com');
insert into Person (id, email) values ('3', 'john@example.com');

-- Write an SQL query to delete all the duplicate emails, 
-- keeping only one unique email with the smallest id. 
-- Note that you are supposed to write a DELETE statement and not a SELECT one.

DELETE p FROM Person as p,
    Person as q 
WHERE
    p.id > q.id AND p.email = q.email;