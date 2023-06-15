Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS SalesPerson (
    sales_id INT,
    name VARCHAR(255),
    salary INT,
    commission_rate INT,
    hire_date DATE
);
CREATE TABLE IF NOT EXISTS Company (
    com_id INT,
    name VARCHAR(255),
    city VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT,
    order_date DATE,
    com_id INT,
    sales_id INT,
    amount INT
);
Truncate table SalesPerson;
insert into SalesPerson (sales_id, name, salary, commission_rate) values ('1', 'John', '100000', '6');
insert into SalesPerson (sales_id, name, salary, commission_rate) values ('2', 'Amy', '12000', '5');
insert into SalesPerson (sales_id, name, salary, commission_rate) values ('3', 'Mark', '65000', '12');
insert into SalesPerson (sales_id, name, salary, commission_rate) values ('4', 'Pam', '25000', '25');
insert into SalesPerson (sales_id, name, salary, commission_rate) values ('5', 'Alex', '5000', '10');
Truncate table Company;
insert into Company (com_id, name, city) values ('1', 'RED', 'Boston');
insert into Company (com_id, name, city) values ('2', 'ORANGE', 'New York');
insert into Company (com_id, name, city) values ('3', 'YELLOW', 'Boston');
insert into Company (com_id, name, city) values ('4', 'GREEN', 'Austin');
Truncate table Orders;
insert into Orders (order_id, com_id, sales_id, amount) values ('1', '3', '4', '10000');
insert into Orders (order_id, com_id, sales_id, amount) values ('2', '4', '5', '5000');
insert into Orders (order_id, com_id, sales_id, amount) values ('3', '1', '1', '50000');
insert into Orders (order_id, com_id, sales_id, amount) values ('4', '1', '4', '25000');

/* Write an SQL query to report the names of all the salespersons who did not have any orders related to the company with the name "RED".*/

SELECT 
    salesperson.name AS name
FROM
    salesperson
        LEFT JOIN
    orders ON salesperson.sales_id = orders.sales_id
        LEFT JOIN
    company ON orders.com_id = company.com_id
GROUP BY salesperson.sales_id
HAVING SUM(company.name = 'RED') = 0
    OR SUM(company.name IS NULL) > 0;
    

SELECT 
    name
FROM
    salesperson
WHERE
    sales_id NOT IN (SELECT 
            sales_id
        FROM
            orders
        WHERE
            com_id IN (SELECT 
                    com_id
                FROM
                    company
                WHERE
                    name = 'RED'));