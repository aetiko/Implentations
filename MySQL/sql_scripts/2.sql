-- learning how to implement with constraints

CREATE DATABASE IF NOT EXISTS Sales;
 -- or we could use
 -- schema and database go hand in hand
-- CREATE SCHEMA IF NOT EXISTS Sales;

USE Sales;
-- helps tell MySql the Database to use


drop table if exists customers_one;
drop table if exists companies_one;

create table customers_one(
customer_id int auto_increment,
first_nname varchar(255),
last_name varchar(255),
email_address varchar(255),
number_of_complaints int default 0,
primary key (customer_id)
);

alter table customers_one 
add column gender enum ('M','F') after last_name;

alter table customers_one
change column number_of_complaints number_of_complaints int default 0;

insert into customers_one (customer_id, first_nname, last_name, gender, email_address, number_of_complaints)
values (7 , 'ayo', 'etiko', 'M', 'aetiko@cnb.ca', 2000);

insert into customers_one (first_nname, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

insert into customers_one (first_nname, last_name, gender, email_address)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@hfvgh.com');

select * from customers_one;

create table if not exists companies_one(
company_id varchar(255),
company_name varchar(255) default  'X',
headquarters_phone_number varchar(255) not null,
unique key (headquarters_phone_number),
primary key (company_id)
);

alter table companies_one
modify company_name varchar(255) null;

alter table companies_one
change company_name company_name varchar(255) not null;

insert into companies_one (company_id, headquarters_phone_number)
values ('id_one', '+1-403-836-5460');

select * from companies_one;
