USE example_database_sales;

/* Example value */

INSERT INTO items VALUES 
(002, 'Plastic', '7.5', 001);

/* When updating a table may be a good idea to use the COMMIT command */
/* First we have to deactive the autocommit mode (in MySQL Workbench is in the upper bar near the tick and the cross) */
/* WE may have to deactivate the 'Safe Updates', this can be done from Edit->Preferences->SQL Editor , then close the programme and reopen */

/* Then we use the COMMIT command (part of TCL) that "saves" the progress */

COMMIT;

/* Then we do the update */

UPDATE items
SET item = 'Iron'
WHERE item = 'Plastic';

SELECT * FROM items;

/* The update is done, however we can revert it with ROLLBACK */

ROLLBACK;

