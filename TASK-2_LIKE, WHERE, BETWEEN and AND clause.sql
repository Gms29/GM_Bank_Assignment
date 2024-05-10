USE GMBank;

/*USING WHERE, BETWEEN, AND, and LIKE clause */

/*1. Retrieve the name, account type and email of all customers*/
SELECT CUSTOMERS.first_name, CUSTOMERS.last_name, CUSTOMERS.email, ACCOUNTS.account_type FROM CUSTOMERS,ACCOUNTS WHERE CUSTOMERS.customer_id = ACCOUNTS.customer_id;

/*2. List all transaction corresponding customers*/
SELECT CUSTOMERS.first_name, CUSTOMERS.last_name, TRANSACTIONS.* FROM CUSTOMERS, ACCOUNTS, TRANSACTIONS 
WHERE CUSTOMERS.customer_id = ACCOUNTS.customer_id AND ACCOUNTS.account_id = TRANSACTIONS.account_id;

/*3. To increase balance of a specific account by a certain value, initial balance was 11902 */
UPDATE ACCOUNTS SET balance=9800 where account_id=8;

SELECT CUSTOMERS.first_name, CUSTOMERS.last_name, ACCOUNTS.* FROM CUSTOMERS, ACCOUNTS WHERE CUSTOMERS.customer_id=ACCOUNTS.customer_id 
AND ACCOUNTS.account_id=8;

/*4. Combine first and last names of customers as full name.*/
ALTER TABLE CUSTOMERS ADD full_name varchar(255);
UPDATE CUSTOMERS SET full_name = CUSTOMERS.first_name + ' ' + CUSTOMERS.last_name;
SELECT * FROM CUSTOMERS;

/*5. SQL QUERY TO REMOVE ACCOUNTS WITH BALANCE OF*/


/*6. SQL Query to find people living in a certain city*/
SELECT * FROM CUSTOMERS  WHERE cust_address LIKE '%New York';

/*7. SQL Query to get balance of a specific account*/
SELECT CUSTOMERS.customer_id, CUSTOMERS.full_name, ACCOUNTS.balance FROM CUSTOMERS, ACCOUNTS WHERE CUSTOMERS.customer_id=ACCOUNTS.customer_id AND CUSTOMERS.full_name='Karen Sullivan';

/*8. SQL query to get accounts with balance greater thab 1000*/
SELECT CUSTOMERS.full_name, ACCOUNTS.* FROM CUSTOMERS, ACCOUNTS WHERE CUSTOMERS.customer_id=ACCOUNTS.customer_id AND ACCOUNTS.balance >= 50000;

/*9. SQL query to access all transactions for a certain ammount*/
SELECT * FROM TRANSACTIONS WHERE TRANSACTIONS.ammount >= 1000;


/*10.  Write a SQL query to Calculate the interest accrued on savings accounts based on a 
given interest rate*/
ALTER TABLE ACCOUNTS ADD interest int;
UPDATE ACCOUNTS SET interest = (balance * 7 * 1)/100 WHERE account_type = 'SAVINGS';
SELECT * FROM ACCOUNTS;


/*11. */


/*12. Write a SQL query to Find customers not living in a specific city.*/
SELECT * FROM CUSTOMERS  WHERE cust_address NOT LIKE '%New York';

