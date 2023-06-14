Create database if not exists Leetcode;
use Leetcode;
CREATE TABLE IF NOT EXISTS Person (
    personId INT,
    firstName VARCHAR(255),
    lastName VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS Address (
    addressId INT,
    personId INT,
    city VARCHAR(255),
    state VARCHAR(255)
);
Truncate table Person;
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen');
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob');
Truncate table Address;
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York');
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California');

-- Write an SQL query to report the first name, last name, city, and state of each person in the Person table. 
-- If the address of a personId is not present in the Address table, report null instead.

SELECT 
    Person.firstName,
    Person.lastName,
    Address.city,
    Address.state
FROM
    Person
        LEFT JOIN
    Address ON Address.personId = Person.personId;
