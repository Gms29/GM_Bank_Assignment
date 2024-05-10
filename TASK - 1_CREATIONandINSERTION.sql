CREATE DATABASE GMBank;
USE GMBank;


CREATE TABLE CUSTOMERS (customer_id int, first_name varchar(255), last_name varchar(255), DOB date, email varchar(255),
						phone_number int, address varchar(255), PRIMARY KEY(customer_id));
EXEC sp_rename 'CUSTOMERS.address', 'cust_address', 'COLUMN';

CREATE TABLE ACCOUNTS (account_id int, customer_id int, account_type varchar(255), balance int, PRIMARY KEY(account_id), 
						FOREIGN KEY(customer_id) REFERENCES CUSTOMERS(customer_id));

CREATE TABLE TRANSACTIONS (transaction_id int, account_id int, transaction_type varchar(255), ammount int, transaction_date date,
							PRIMARY KEY(transaction_id), FOREIGN KEY(account_id) REFERENCES ACCOUNTS(account_id));

INSERT INTO CUSTOMERS (customer_id, first_name, last_name, DOB, email, phone_number, cust_address) 
VALUES (1000, 'Mike', 'Wazowski', '2002-9-12', 'Mski@gmail.com', 88374892, '123 Street, Monstropolis');
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, DOB, email, phone_number, cust_address) 
VALUES	(1001, 'Kowalski', 'Penguin', '2002-5-20', 'KAnalysis@gmail.com', 87552673, 'City zoo, New York');
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, DOB, email, phone_number, cust_address)  
VALUES	(1002, 'Rico', 'Penguin', '2002-4-30', 'RComedic@gmail.com', 88920837, 'City zoo, New York');
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, DOB, email, phone_number, cust_address) 
VALUES	(1003, 'Skipper', 'Penguin', '2002-6-21', 'SSane@gmail.com', 99872673, 'City zoo, New York');
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, DOB, email, phone_number, cust_address)  
VALUES	(1004, 'Rick', 'Astley', '1966-2-6', 'NevGiveUuP@gmail.com', 90234789, 'Lancashire, England');
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, DOB, email, phone_number, cust_address)  
VALUES	(1005, 'Optimus', 'Prime', '1994-4-28', 'ABots@cybertronmail.com', 69280198, '#3184, 2nd Street, Cybertron');
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, DOB, email, phone_number, cust_address)  
VALUES	(1006, 'Star', 'Scream', '1994-7-23', 'DCons@cybertronmail.com', 77340198, '#3185, 2nd Street, Cybertron');
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, DOB, email, phone_number, cust_address)  
VALUES	(1007, 'Bruce', 'Wayne', '1992-8-4', 'ManBat@dp.com', 98230134, 'Bristol Hills, Gotham City');
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, DOB, email, phone_number, cust_address)  
VALUES	(1008, 'Shaquille', 'Oatmeal', '1990-9-8', 'OmealS@yum.com', 77652809, 'Newark');
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, DOB, email, phone_number, cust_address)  
VALUES	(1009, 'Karen', 'Sullivan', '1996-6-9', 'WhereManager@angry.com', 88230954, '39th Street, New York');
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, DOB, email, phone_number, cust_address)  
VALUES	(1010, 'Pink', 'Panther', '1975-1-3', 'Pink@gmail.com', 87250928, 'Pink Mansion, Pink land');

SELECT * FROM CUSTOMERS;


INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (1, 1000, 'SAVINGS', 19882);
INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (2, 1001, 'CURRENT', 76592);
INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (3, 1002, 'SALARY', 234901);
INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (4, 1003, 'SALARY', 54329);
INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (5, 1004, 'SAVINGS', 2340091);
INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (6, 1005, 'CURRENT', 18722);
INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (7, 1006, 'SAVINGS', 234422);
INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (8, 1007, 'SALARY', 150);
INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (9, 1008, 'CURRENT', 98720);
INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (10, 1009, 'SALARY', 983304);
INSERT INTO ACCOUNTS (account_id, customer_id, account_type, balance) 
VALUES (11, 1010, 'CURRENT', 899827);
						
SELECT * FROM ACCOUNTS;


INSERT INTO TRANSACTIONS (transaction_id, account_id, transaction_type, ammount, transaction_date)
VALUES (0001, 1, 'WITHDRAWAL', 1200, '2023-3-2');
INSERT INTO TRANSACTIONS (transaction_id, account_id, transaction_type, ammount, transaction_date)
VALUES (0002, 2, 'DEPOSIT', 120, '2022-4-4');
INSERT INTO TRANSACTIONS (transaction_id, account_id, transaction_type, ammount, transaction_date)
VALUES (0003, 3, 'WITHDRAWAL', 1120, '2024-2-21');
INSERT INTO TRANSACTIONS (transaction_id, account_id, transaction_type, ammount, transaction_date)
VALUES (0004, 4, 'TRANSFER', 110, '2024-1-21');
INSERT INTO TRANSACTIONS (transaction_id, account_id, transaction_type, ammount, transaction_date)
VALUES (0005, 5, 'DEPOSIT', 19023, '2019-12-2');
INSERT INTO TRANSACTIONS (transaction_id, account_id, transaction_type, ammount, transaction_date)
VALUES (0006, 6, 'TRANSFER', 1192, '2022-7-27');
INSERT INTO TRANSACTIONS (transaction_id, account_id, transaction_type, ammount, transaction_date)
VALUES (0007, 7, 'TRANSFER', 100, '2022-7-9');
INSERT INTO TRANSACTIONS (transaction_id, account_id, transaction_type, ammount, transaction_date)
VALUES (0008, 8, 'TRANSFER', 5120, '2021-1-6');
INSERT INTO TRANSACTIONS (transaction_id, account_id, transaction_type, ammount, transaction_date)
VALUES (0009, 9, 'WITHDRAWL', 50, '2024-2-21');
INSERT INTO TRANSACTIONS (transaction_id, account_id, transaction_type, ammount, transaction_date)
VALUES (0010, 10, 'WITHDRAWAL', 100, '2022-6-12');
INSERT INTO TRANSACTIONS (transaction_id, account_id, transaction_type, ammount, transaction_date)
VALUES (0011, 11, 'DEPOSIT', 12230, '2024-3-12');


SELECT * FROM TRANSACTIONS;



