CREATE DATABASE IF NOT EXISTS Sales;
 -- or we could use
 -- schema and database go hand in hand
-- CREATE SCHEMA IF NOT EXISTS Sales;

USE Sales;
-- helps tell MySql the Database to use

drop table if exists sales;

create table if not exists sales ( 
purchase_number int not null auto_increment, 
date_of_purchase date not null, 
customer_id int, 
item_code varchar(10),
primary key (purchase_number)
);

 drop table if exists customers;
 
create table if not exists customers (
customer_id int not null,
first_name varchar(255) not null,
last_name varchar(255) not null,
email_address varchar(255),
number_of_complaints int,
primary key(customer_id));

create table if not exists items(
item_code varchar(255),
item varchar(255),
unit_price numeric(10, 2),
company_id varchar(255),
primary key(item_code)
);

create table if not exists companies(
company_id varchar(255),
company_name varchar(255),
headquarters_phone_number int(12),
primary key (company_id)
);
