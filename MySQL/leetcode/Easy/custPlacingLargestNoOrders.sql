Create database if not exists Leetcode;
use Leetcode;
CREATE TABLE IF NOT EXISTS orders (
    order_number INT,
    customer_number INT
);
Truncate table orders;
insert into orders (order_number, customer_number) values ('1', '1');
insert into orders (order_number, customer_number) values ('2', '2');
insert into orders (order_number, customer_number) values ('3', '3');
insert into orders (order_number, customer_number) values ('4', '3');

/* Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.*/

select * from Orders;

SELECT 
    max(customer_number) as customer_number
FROM
    orders;

-- another sol

SELECT 
    customer_number
FROM
    orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC
LIMIT 1;