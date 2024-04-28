
-- create database called test


-- create table Employee

CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    Email VARCHAR(100),
    Schedule_Date DATE
);

-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- select all data from Employee
select * from Employee

-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- insert some data in the table to test it
INSERT INTO Employee (ID, Name, City, Email, Schedule_Date)
VALUES
(1001, 'Ahmed', 'Cairo', 'ahmed@mail.com', '2024-04-20'),
(1002, 'Nehal', 'Giza', 'nehal@mail.com', '2024-04-20'),
(1003, 'Asem', 'Cairo', 'asem@mail.com', '2024-04-20');


-- insert another data to test it in a new run
INSERT INTO Employee (ID, Name, City, Email, Schedule_Date)
VALUES
(1007, 'Mohamed', 'Cairo', 'Mohamed@mail.com', '2024-04-20'),
(1008, 'Sara', 'Giza', 'Sara@mail.com', '2024-04-20'),
(1009, 'Ali', 'Cairo', 'Ali@mail.com', '2024-04-20');

-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- update the Schedule to check the Version_No in the target
update Employee 
set Schedule_Date = '2024-04-26'

-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- delete table employee
DROP Table Employee


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- create table TargetEmployee with default value for Active_Flag and Version_No is 1

CREATE TABLE TargetEmployee (
    Emp_Key INT PRIMARY KEY identity(1,1),
    ID INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    Email VARCHAR(100),
    Insert_Date DATE,
    Active_Flag INT DEFAULT 1,
    Version_No INT DEFAULT 1,
);


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- select all data from table TargetEmployee
select * from TargetEmployee


-- delete table TargetEmployee
DROP TABLE TargetEmployee


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- select statement in the lookup with Active_Flag = 1 (in SSIS)

SELECT Emp_Key  , ID , Insert_Date , Version_No
FROM TargetEmployee
WHERE Active_Flag = 1;



-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- update Active_Flag to 0 based on ID (in SSIS)
UPDATE TargetEmployee
SET Active_Flag = 0
where ID = ? ;