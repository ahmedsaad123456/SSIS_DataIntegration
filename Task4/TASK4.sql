-- create database called test



-- create table EmployeeAttendence

CREATE TABLE EmployeeAttendance (
    ID INT PRIMARY KEY identity (1,1),
    Employee_Id INT,
    Finger_Print_TS DATETIME,
    In_Out VARCHAR(10)
);

-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- insert data in the table EmployeeAttendance
INSERT INTO EmployeeAttendance (Employee_Id, Finger_Print_TS, In_Out)
VALUES
    (101, '2024-03-13 09:00:00', 'in'),
    (101, '2024-03-13 10:00:00', 'in'),
    (102, '2024-03-13 09:00:00', 'in'),
    (103, '2024-03-13 11:00:00', 'in'),
    (104, '2024-03-13 09:15:00', 'in'),
    (105, '2024-03-13 10:00:00', 'in'),
    (105, '2024-03-13 11:00:00', 'in'),
    (105, '2024-03-13 11:30:00', 'in'),
    (106, '2024-03-13 09:00:00', 'in'),
	(107, '2024-03-13 09:00:00', 'in'),
    (108, '2024-03-13 09:00:00', 'in'),
    (101, '2024-03-13 09:00:00', 'out'),
    (101, '2024-03-13 17:00:00', 'out'),
    (101, '2024-03-13 19:00:00', 'out'),
    (102, '2024-03-13 17:00:00', 'out'),
    (103, '2024-03-13 17:00:00', 'out'),
    (105, '2024-03-13 10:00:00', 'out'),
    (105, '2024-03-13 11:00:00', 'out'),
    (105, '2024-03-13 18:00:00', 'out'),
    (106, '2024-03-13 19:00:00', 'out'),
    (107, '2024-03-13 14:00:00', 'out'),
    (108, '2024-03-13 17:00:00', 'out');


	INSERT INTO EmployeeAttendance (Employee_Id, Finger_Print_TS, In_Out)
VALUES
    (101, '2024-03-15 19:00:00', 'out')



-- select all data from the table
select * from EmployeeAttendance 


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

-- select statment for the EmployeeAttendance_in Source (in SSIS) and we use incremental load

select Employee_Id , min(CAST(Finger_Print_TS AS time)) AS minTime_in , min(Finger_Print_TS) AS FullTime_in ,(CAST(Finger_Print_TS AS date)) AS Date_in
FROM EmployeeAttendance
WHERE In_Out = 'in' and (CAST(Finger_Print_TS AS date)) > ?
GROUP BY Employee_Id , (CAST(Finger_Print_TS AS date))


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- select statment for the EmployeeAttendance_out Source (in SSIS) and we use incremental load

select Employee_Id , min(CAST(Finger_Print_TS AS time)) AS minTime_out , min(Finger_Print_TS) AS FullTime_out ,  (CAST(Finger_Print_TS AS date)) AS Date_out
FROM EmployeeAttendance AS EMP1
WHERE In_Out = 'out' And (CAST(Finger_Print_TS AS date)) > ?
AND ((CAST(Finger_Print_TS AS time)) >= 
		(
		select max(CAST(Finger_Print_TS AS time))  
		FROM EmployeeAttendance AS EMP2
		WHERE In_Out = 'in' and EMP1.Employee_Id = EMP2.Employee_Id AND CAST(EMP1.Finger_Print_TS AS date) = CAST(EMP2.Finger_Print_TS AS date)
		GROUP BY Employee_Id , (CAST(Finger_Print_TS AS date))	
		)  or (
		NOT EXISTS (select Employee_Id from EmployeeAttendance AS EMP2 where In_Out = 'in' and EMP1.Employee_Id = EMP2.Employee_Id AND CAST(EMP1.Finger_Print_TS AS date) = CAST(EMP2.Finger_Print_TS AS date))
		)) 
GROUP BY Employee_Id , (CAST(Finger_Print_TS AS date))

-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- delete table
DROP TABLE EmployeeAttendance


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- create table Employee_Attendance_Details

CREATE TABLE Employee_Attendance_Details (
    Att_Key INT PRIMARY KEY identity (1,1),
    Emp_ID INT,
    Date DATE,
    Time_In TIME,
    Time_Out TIME,
    Worked_Hours INT,
    State VARCHAR(50)
);

select max(Date) from Employee_Attendance_Details


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- select all data from the table Employee_Attendance_Details
select * from Employee_Attendance_Details


-- delete table Employee_Attendance_Details
DROP TABLE Employee_Attendance_Details



-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||





-- condition on the derived Column 'State' (in SSIS)
ISNULL(minTime_in) || ISNULL(minTime_out) ? "no check out" : (([minTime_in] == "09:00:00.0000000") && ([worked_hours] > 8) ? "ebn el-shrka" : (([minTime_in] == "09:00:00.0000000") && ([worked_hours] == 8) ? "mo7tram" :(([minTime_in] > "09:00:00.0000000") && ([worked_hours] == 8) ? "raye2" : (([minTime_in] == "09:00:00.0000000") && ([worked_hours] < 8) ? "byst3bat" : (([minTime_in] > "09:00:00.0000000") && ([worked_hours] < 8) ? "msh mo7tram" :"undefined")))))
