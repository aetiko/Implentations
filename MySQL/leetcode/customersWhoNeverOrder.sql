Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS Customers (
    id INT,
    name VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS Orders (
    id INT,
    customerId INT
);
Truncate table Customers;
insert into Customers (id, name) values ('1', 'Joe');
insert into Customers (id, name) values ('2', 'Henry');
insert into Customers (id, name) values ('3', 'Sam');
insert into Customers (id, name) values ('4', 'Max');
Truncate table Orders;
insert into Orders (id, customerId) values ('1', '3');
insert into Orders (id, customerId) values ('2', '1');

SELECT 
    Customers.name
FROM
    Customers
        LEFT OUTER JOIN
    Orders ON Customers.id = Orders.customerId
WHERE
    Orders.customerId IS NULL;