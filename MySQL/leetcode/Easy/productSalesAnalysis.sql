Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT
);
CREATE TABLE IF NOT EXISTS Product (
    product_id INT,
    product_name VARCHAR(10)
);
Truncate table Sales;
insert into Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000');
Truncate table Product;
insert into Product (product_id, product_name) values ('100', 'Nokia');
insert into Product (product_id, product_name) values ('200', 'Apple');
insert into Product (product_id, product_name) values ('300', 'Samsung');

/* Write an SQL query that reports the product_name, year, and price for each sale_id in the Sales table.*/

SELECT 
    product_name, year, price
FROM
    sales AS s,
    product AS p
WHERE
    s.product_id IN (SELECT 
            p.product_id
        FROM
            product);

