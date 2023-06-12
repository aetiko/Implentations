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


CREATE TABLE IF NOT EXISTS sales (
    purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10),
    PRIMARY KEY (purchase_number),
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON DELETE CASCADE,
    FOREIGN KEY (item_code)
        REFERENCES items (item_code)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id),
    UNIQUE KEY (email_address)
);

alter table customers
add unique key (email_address);

alter table customers
drop index email_address;

CREATE TABLE IF NOT EXISTS items (
    item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255),
    PRIMARY KEY (item_code)
);

alter table items
add foreign key (item_code) references companies(company_id) on delete cascade;

alter table items
drop foreign key items_ibfk_1;


CREATE TABLE IF NOT EXISTS companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INT(12),
    PRIMARY KEY (company_id)
);
