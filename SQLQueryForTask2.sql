CREATE TABLE Customer (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    City VARCHAR(255),
    Email VARCHAR(255),
    Update_Date DATE
);

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

UPDATE Customer 
SET Name = 'John Doe', 
    City = 'Los', 
    Email = 'john.doe@example.com', 
    Update_Date = '2024-04-28'
WHERE ID = 1;

select * from Customer


CREATE TABLE CustomerSCD4 (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    City VARCHAR(255),
    Email VARCHAR(255),
);

UPDATE CustomerSCD4 
SET  
    City = 'Dallas', 
    Email = 'john.doe@example.com'
WHERE ID = 1;
select * from CustomerSCD4



CREATE TABLE CustomerHistory (
	ID INT PRIMARY KEY Identity(1,1),
    Customer_ID INT,
    Name VARCHAR(255),
    City VARCHAR(255),
    Email VARCHAR(255),
    From_Date DATE,
	To_Date DATE
);


UPDATE CustomerHistory
SET  
    To_Date = ?
WHERE Customer_ID = 1 and From_Date = ?;



select * from CustomerHistory


select max(From_Date) from CustomerHistory

UPDATE CustomerHistory
SET  
    To_Date = Null

DROP TABLE CustomerHistory





