/* Creating a database */
CREATE DATABASE IF NOT EXISTS example_database_sales;  
USE example_database_sales;

/* When creating a database or a table it's optional to use "IF NOT EXISTS" */

/* Create table */
/* 2 constraints included: NOT NULL and UNIQUE */
/* Alse AUTO_INCREMENT function included*/

CREATE TABLE sales
	(purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	date_of_purchase DATE NOT NULL,
	customer_id INT,
	item_code VARCHAR(10) NOT NULL
	);

/* Delete table */
DROP TABLE sales;

/* Another way to include constraints */ 
CREATE TABLE sales
	(purchase_number INT NOT NULL AUTO_INCREMENT,
	date_of_purchase DATE NOT NULL,
	customer_id INT,
	item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_number)
	);

CREATE TABLE customers                                                 
	(customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT
	);

CREATE TABLE items
(
	item_code VARCHAR(255) PRIMARY KEY,
	item VARCHAR(255),
    unit_price NUMERIC(10,2),
	company_id VARCHAR(255)
    );

CREATE TABLE companies
(
	company_id VARCHAR(255) PRIMARY KEY,
	company_name VARCHAR(255) DEFAULT 'X',
	headquarters_phone_number INT UNIQUE KEY
    ); 
    

/* Add a column */
/* When using a NOT NULL constraint a default value should be selected */
/* The CURDATE() function gets today date */

ALTER TABLE sales
ADD extra_column VARCHAR(100) NOT NULL DEFAULT('Default value A'),
ADD entry_date DATE NOT NULL DEFAULT(CURDATE());

/* Modify a column */
ALTER TABLE sales
MODIFY COLUMN extra_column TEXT;

/* Remove a column */
ALTER TABLE sales
DROP COLUMN extra_column,
DROP COLUMN entry_date;

/* Explore database and tables */
SHOW tables;
DESCRIBE customers;

/* Add constraint to a table such as "foreign key" */
/* The ON DELETE CASCADE constraint means that if a value is deleted from the primary table */
/* then it will be removed from all the tables asociated */
/* It's not necessary but adds consistency to the database */
ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

/* The constraints have names, if you don't select one, then it is set by default */
ALTER TABLE sales
DROP CONSTRAINT `sales_ibfk_1`;

/* Giving a name to the constraint */
ALTER TABLE sales
ADD CONSTRAINT `foreign_key_1` FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

/* To delete a unique key */
ALTER TABLE companies
DROP INDEX company_name;

/* Another way of altering a table */
ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

