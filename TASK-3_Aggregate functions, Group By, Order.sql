USE GMBank;

/*1. Write a SQL query to Find the average account balance for all customers*/
SELECT AVG(BALANCE) FROM ACCOUNTS;

/*2.  Write a SQL query to Retrieve the top 3 highest account balances.*/
SELECT TOP 3 BALANCE, CUSTOMERS.full_name FROM ACCOUNTS, CUSTOMERS WHERE CUSTOMERS.customer_id=ACCOUNTS.customer_id ORDER BY balance DESC; 

/*3. Write a SQL query to Calculate Total Deposits for All Customers in specific account type = current.*/
SELECT SUM(ACCOUNTS.balance), ACCOUNTS.account_type FROM ACCOUNTS JOIN TRANSACTIONS ON ACCOUNTS.account_id = TRANSACTIONS.account_id GROUP BY ACCOUNTS.account_type HAVING ACCOUNTS.account_type = 'CURRENT';


/*4.  Write a SQL query to Find the Oldest and Newest Customers*/ 
SELECT * FROM CUSTOMERS ORDER BY DOB;

/*5. Write a SQL query to Retrieve transaction details along with the account type.*/
SELECT TRANSACTIONS.*, CUSTOMERS.full_name, ACCOUNTS.account_type FROM TRANSACTIONS JOIN ACCOUNTS ON TRANSACTIONS.account_id = ACCOUNTS.account_id 
JOIN CUSTOMERS ON CUSTOMERS.customer_id = ACCOUNTS.customer_id WHERE ACCOUNTS.account_type = 'SALARY';

/*6.  Write a SQL query to Get a list of customers along with their account details*/
SELECT CUSTOMERS.full_name, ACCOUNTS.* FROM CUSTOMERS,ACCOUNTS WHERE CUSTOMERS.customer_id = ACCOUNTS.customer_id;

/*7.  Write a SQL query to Retrieve transaction details along with customer information for a specific account.*/
SELECT CUSTOMERS.*, TRANSACTIONS.* FROM TRANSACTIONS JOIN ACCOUNTS ON TRANSACTIONS.account_id = ACCOUNTS.account_id 
JOIN CUSTOMERS ON CUSTOMERS.customer_id = ACCOUNTS.customer_id WHERE TRANSACTIONS.ammount = 19023;

/*8. Write a SQL query to Identify customers who have more than one account.*/
INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (12, 1004, 'CURRENT', 10000);
select count(*) as NumOfAccts from CUSTOMERS join ACCOUNTS on CUSTOMERS.customer_id = ACCOUNTS.customer_id 
group by CUSTOMERS.customer_id having count(*) > 1;

/*9 Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals*/
SELECT account_id, SUM(CASE WHEN transaction_type = 'DEPOSIT' THEN ammount ELSE -AMMount END) AS Difference
FROM Transactions
GROUP BY account_id

/*10. Write a SQL query to Calculate the average daily balance for each account over a specified period*/
SELECT ACCOUNTS.account_id , TRANSACTIONS.transaction_date , AVG(Balance) AS AverageDailyBalance
FROM ACCOUNTS
JOIN TRANSACTIONS ON ACCOUNTS.account_id=TRANSACTIONS.account_id
WHERE TRANSACTIONS.transaction_date BETWEEN '2023-01-01' AND '2024-01-01'
GROUP BY ACCOUNTS.account_id, TRANSACTIONS.transaction_date;]


/*11. Calculate the total balance for each account type.*/
SELECT SUM(balance) AS TotalBalance, account_type
FROM ACCOUNTS
GROUP BY account_type;

/*12. Identify accounts with the highest number of transactions order by descending order.*/
SELECT COUNT(*) AS NumTransactions, account_id
FROM TRANSACTIONS
GROUP BY account_id
ORDER BY NumTransactions DESC;

/*13. List customers with high aggregate account balances, along with their account types.*/
SELECT CUSTOMERS.customer_id, CUSTOMERS.first_name, ACCOUNTS.account_type, SUM(ACCOUNTS.balance) AS total_balance
FROM CUSTOMERS 
JOIN ACCOUNTS ON CUSTOMERS.customer_id = ACCOUNTS.customer_id
GROUP BY CUSTOMERS.customer_id, CUSTOMERS.first_name, ACCOUNTS.account_type
HAVING SUM(ACCOUNTS.balance) > 5000
ORDER BY total_balance DESC;

/*14. Identify and list duplicate transactions based on transaction amount, date, and account.*/ 

SELECT COUNT(*) AS DuplicateCount, transaction_date, ammount, transaction_date, account_id
FROM TRANSACTIONS
GROUP BY ammount, transaction_date, account_id, transaction_id
HAVING COUNT(*) > 1;



