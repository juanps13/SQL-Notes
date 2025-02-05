USE employees;

/* 
In MySQL, froma scope point of view there are three types of variables:

Local Variables: These variables exist only within a BEGIN-END block 
(e.g., within a stored procedure or function). They are defined using the DECLARE statement.

Session Variables: These variables exist within a session, meaning from the moment you connect to the MySQL server until you disconnect. 
They are defined using the SET statement and are preceded by an @ symbol (e.g., @my_variable).

Global Variables: These variables exist within the MySQL server itself and affect its overall operation. 
They are defined using "SET GLOBAL var_name = value" or "SET @@global.variable_name = value" 
Note that not all global variables can be created freely, 
as most of them are system variables that control the server's behavior (e.g., max_connections or max_join_size).

From a creater point of view there are 2 types of variables: system and user-defined.alter

System variables are created by default in the system, can be edited by users but not created.
They are all global variables and some of them can be session variables.
For example: "SET SESSION sql_mode = ..."

User-defined functions are created by users. 
They can be local variable or session variables as shown in the functions and stored procedures.
*/