CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    Email VARCHAR(100),
    Schedule_Date DATE
);


select * from Employee


INSERT INTO Employee (ID, Name, City, Email, Schedule_Date)
VALUES
(1001, 'Ahmed', 'Cairo', 'ahmed@mail.com', '2024-04-20'),
(1002, 'Nehal', 'Giza', 'nehal@mail.com', '2024-04-20'),
(1003, 'Asem', 'Cairo', 'asem@mail.com', '2024-04-20');


INSERT INTO Employee (ID, Name, City, Email, Schedule_Date)
VALUES
(1004, 'Mohamed', 'Cairo', 'Mohamed@mail.com', '2024-04-20'),
(1005, 'Sara', 'Giza', 'Sara@mail.com', '2024-04-20'),
(1006, 'Ali', 'Cairo', 'Ali@mail.com', '2024-04-20');


update Employee 
set Schedule_Date = '2024-04-25'

DROP Table Employee

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

DELETE FROM TargetEmployee Where ID = 1004 or ID = 1005 or ID = 1006

select * from TargetEmployee

DROP TABLE TargetEmployee


-- From lookup
--SELECT Emp_Key, ID, Insert_Date, Version_No
--FROM TargetEmployee
--WHERE Active_Flag = 1;



-- update active flag
--UPDATE TargetEmployee
--SET Active_Flag = 0
-- where ID = ?;