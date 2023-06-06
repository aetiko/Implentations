CREATE DATABASE IF NOT EXISTS Sales;
 -- or we could use
 -- schema and database go hand in hand
-- CREATE SCHEMA IF NOT EXISTS Sales;

USE Sales;
-- helps tell MySql the Database to use

create table if not exists sales ( 
purchase_number int not null primary key auto_increment, 
date_of_purchase date not null, 
customer_id int, 
item_code varchar(10)
);

create table if not exists customers (
customer_id int not null primary key,
first_name varchar(255) not null,
last_name varchar(255) not null,
email_address varchar(255),
number_of_complaints int);
