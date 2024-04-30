-- create database called test 



-- create table customer

CREATE TABLE Customer (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    City VARCHAR(255),
    Email VARCHAR(255),
    Update_Date DATE
);

 
-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- create insert statement

INSERT INTO Customer (ID, Name, City, Email, Update_Date) VALUES (1, 'John Doe', 'New York', 'john.doe@example.com', '2024-04-25');
INSERT INTO Customer (ID, Name, City, Email, Update_Date) VALUES (2, 'Jane Smith', 'Los Angeles', 'jane.smith@example.com', '2024-04-25');
INSERT INTO Customer (ID, Name, City, Email, Update_Date) VALUES (3, 'Robert Johnson', 'Chicago', 'robert.johnson@example.com', '2024-04-25');
INSERT INTO Customer (ID, Name, City, Email, Update_Date) VALUES (4, 'Emily Wilson', 'Houston', 'emily.wilson@example.com', '2024-04-25');
INSERT INTO Customer (ID, Name, City, Email, Update_Date) VALUES (5, 'Michael Brown', 'Phoenix', 'michael.brown@example.com', '2024-04-25');
INSERT INTO Customer (ID, Name, City, Email, Update_Date) VALUES (6, 'Sophia Jones', 'Philadelphia', 'sophia.jones@example.com', '2024-04-25');
INSERT INTO Customer (ID, Name, City, Email, Update_Date) VALUES (7, 'William Davis', 'San Antonio', 'william.davis@example.com', '2024-04-25');
INSERT INTO Customer (ID, Name, City, Email, Update_Date) VALUES (8, 'Olivia Garcia', 'San Diego', 'olivia.garcia@example.com', '2024-04-25');
INSERT INTO Customer (ID, Name, City, Email, Update_Date) VALUES (9, 'James Martinez', 'Dallas', 'james.martinez@example.com', '2024-04-25');
INSERT INTO Customer (ID, Name, City, Email, Update_Date) VALUES (10, 'Emma Hernandez', 'San Jose', 'emma.hernandez@example.com', '2024-04-25');


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- update statement to change the city or email
UPDATE Customer 
SET Name = 'John Doe', 
    City = 'los', 
    Email = 'john.doe@example.com', 
    Update_Date = '2024-04-30'
WHERE ID = 1;


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


--select all data from table customer
select * from Customer


-- delete table customer

DROP TABLE Customer

-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

-- create table CustomerSCD4 for store the last extracted data

CREATE TABLE CustomerSCD4 (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    City VARCHAR(255),
    Email VARCHAR(255),
);

-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- update city or email based on the ID (in SSIS)
UPDATE CustomerSCD4 
SET  
    City = ?, 
    Email = ?
WHERE ID = ?;


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

-- select all data from table CustomerSCD4

select * from CustomerSCD4



-- delete table CustomerSCD4
DROP TABLE CustomerSCD4


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- create table CustomerHistory to story the history of the changed data
-- with default value to To_Date (9999-12-30)

CREATE TABLE CustomerHistory (
	ID INT PRIMARY KEY Identity(1,1),
    Customer_ID INT,
    Name VARCHAR(255),
    City VARCHAR(255),
    Email VARCHAR(255),
    From_Date DATE,
	To_Date DATE DEFAULT '9999-12-30'
);


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- update To_Date based on Id and To_Date (in SSIS)

UPDATE CustomerHistory
SET  
    To_Date = ?
WHERE Customer_ID = ? and To_Date = '9999-12-30';


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- select all data from table CustomerHistory
select * from CustomerHistory


-- delete table CustomerHistory
DROP TABLE CustomerHistory





