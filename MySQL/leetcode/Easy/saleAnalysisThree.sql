Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS Product (
    product_id INT,
    product_name VARCHAR(10),
    unit_price INT
);
CREATE TABLE IF NOT EXISTS Sales (
    seller_id INT,
    product_id INT,
    buyer_id INT,
    sale_date DATE,
    quantity INT,
    price INT
);
Truncate table Product;
insert into Product (product_id, product_name, unit_price) values ('1', 'S8', '1000');
insert into Product (product_id, product_name, unit_price) values ('2', 'G4', '800');
insert into Product (product_id, product_name, unit_price) values ('3', 'iPhone', '1400');
Truncate table Sales;
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('1', '1', '1', '2019-01-21', '2', '2000');
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('1', '2', '2', '2019-02-17', '1', '800');
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('2', '2', '3', '2019-06-02', '1', '800');
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('3', '3', '4', '2019-05-13', '2', '2800');

/* Write an SQL query that reports the products that were only sold in the first quarter of 2019. 
That is, between 2019-01-01 and 2019-03-31 inclusive. */

SELECT 
    p.product_id, p.product_name
FROM
    product p
        JOIN
    sales s ON p.product_id = s.product_id
group by s.product_id, p.product_name
having min(s.sale_date)>='2019-01-01' and max(s.sale_date)<='2019-03-31';



    

