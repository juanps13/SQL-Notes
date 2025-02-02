USE example_database_sales;

/* Insert values into the table */
INSERT INTO items VALUES 
(001, 'Plastic', '10.2', 001);

/* Insert values for a row with only certain columns (check that the missing columns do not contain the NOT NULL constraint */
INSERT INTO customers (first_name, last_name, gender)
VALUES ('John', 'Mackinley', 'M');

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

/* Remove value */
DELETE
FROM items
WHERE first_name = 'John';

/* Update values */
/* This actually can be done without WHERE, but the usually its needed */
UPDATE items
SET item = 'Iron'
WHERE item = 'Plastic';

/* Insert values from other table */

CREATE TABLE items_dup
(
	item_code VARCHAR(255) PRIMARY KEY,
	item VARCHAR(255),
    unit_price NUMERIC(10,2),
	company_id VARCHAR(255)
    );

INSERT INTO items_dup
SELECT *
FROM items;

SELECT *
FROM items_dup;

DROP TABLE items_dup;
