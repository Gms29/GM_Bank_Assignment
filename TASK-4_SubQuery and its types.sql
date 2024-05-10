--1. Retrieve the customer(s) with the highest account balance
SELECT customer_id, first_name
FROM CUSTOMERS
WHERE customer_id IN (
    SELECT customer_id 
    FROM accounts
    WHERE balance = (SELECT MAX(balance) FROM accounts));

--2. Calculate the average account balance for customers who have more than one account
SELECT AVG(balance) AS average_balance
FROM ACCOUNTS
WHERE (SELECT COUNT(*) FROM ACCOUNTS WHERE customer_id = ACCOUNTS.customer_id) > 1;


--3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.
SELECT account_id, account_type, balance
FROM ACCOUNTS 
WHERE balance > (SELECT AVG(ammount) FROM TRANSACTIONS);

--4. Identify customers who have no recorded transactions
SELECT customer_id, first_name
FROM CUSTOMERS
WHERE NOT EXISTS (SELECT 1 FROM transactions WHERE customer_id = CUSTOMERS.customer_id);

--5. Calculate the total balance of accounts with no recorded transactions.
SELECT account_id, account_type, 
(SELECT COALESCE(SUM(balance), 0) FROM accounts WHERE account_id = ACCOUNTS.account_id) AS total_balance
FROM ACCOUNTS
WHERE NOT EXISTS (SELECT 1 FROM transactions WHERE account_id = ACCOUNTS.account_id);


--6. Retrieve transactions for accounts with the lowest balance.
SELECT TRANSACTIONS.transaction_date, TRANSACTIONS.account_id, TRANSACTIONS.ammount, TRANSACTIONS.transaction_date, ACCOUNTS.account_id FROM TRANSACTIONS
JOIN ACCOUNTS ON ACCOUNTS.account_id = TRANSACTIONS.account_id 
WHERE ACCOUNTS.balance in (SELECT MIN(balance) FROM ACCOUNTS);

--7. Identify customers who have accounts of multiple types.
SELECT customer_id, first_name, last_name FROM CUSTOMERS
WHERE customer_id IN (SELECT customer_id FROM ACCOUNTS GROUP BY customer_id HAVING COUNT(DISTINCT account_type) > 1);

--8. Calculate the percentage of each account type out of the total number of accounts.
SELECT COUNT(account_type) AS num_accounts,(COUNT(account_type) * 100.0 / (SELECT COUNT(*) FROM ACCOUNTS)) AS percentage FROM ACCOUNTS
GROUP BY account_type;

--9. Retrieve all transactions for a customer with a given customer_id.
SELECT * FROM TRANSACTIONS JOIN (SELECT account_id FROM ACCOUNTS WHERE customer_id = 1004) AS a_subquery ON TRANSACTIONS.account_id = a_subquery.account_id;

--10. Calculate the total balance for each account type, including a subquery within the SELECT clause
SELECT account_type, (SELECT SUM(balance) FROM ACCOUNTS a_sub WHERE a_sub.account_type = ACCOUNTS.account_type) AS total_balance FROM ACCOUNTS
GROUP BY account_type;

    


