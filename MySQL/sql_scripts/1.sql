CREATE DATABASE IF NOT EXISTS Sales;
 -- or we could use
 -- schema and database go hand in hand
-- CREATE SCHEMA IF NOT EXISTS Sales;

USE Sales;
-- helps tell MySql the Database to use

drop table if exists sales;
drop table if exists customers;
drop table if exists items;
drop table if exists companies;


create table if not exists sales ( 
purchase_number int not null auto_increment, 
date_of_purchase date not null, 
customer_id int, 
item_code varchar(10),
primary key (purchase_number),
foreign key (customer_id) references customers(customer_id) on delete cascade,
foreign key (item_code) references items(item_code) on delete cascade
);

create table if not exists customers (
customer_id int not null,
first_name varchar(255) not null,
last_name varchar(255) not null,
email_address varchar(255),
number_of_complaints int,
primary key(customer_id),
unique key (email_address)
);

alter table customers
add unique key (email_address);

alter table customers
drop index email_address;

create table if not exists items(
item_code varchar(255),
item varchar(255),
unit_price numeric(10, 2),
company_id varchar(255),
primary key(item_code)
);

alter table items
add foreign key (item_code) references companies(company_id) on delete cascade;

alter table items
drop foreign key items_ibfk_1;


create table if not exists companies(
company_id varchar(255),
company_name varchar(255),
headquarters_phone_number int(12),
primary key (company_id)
);
