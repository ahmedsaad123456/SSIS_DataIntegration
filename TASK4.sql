CREATE TABLE EmployeeAttendance (
    ID INT PRIMARY KEY identity (1,1),
    Employee_Id INT,
    Finger_Print_TS DATETIME,
    In_Out VARCHAR(10)
);

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
    (106, '2024-03-13 09:10:00', 'in'),
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
    (106, '2024-03-13 19:10:00', 'out'),
    (107, '2024-03-13 14:00:00', 'out'),
    (108, '2024-03-13 17:00:00', 'out');


	INSERT INTO EmployeeAttendance (Employee_Id, Finger_Print_TS, In_Out)
VALUES
    (101, '2024-03-15 09:00:00', 'out')

select * from EmployeeAttendance 


select Employee_Id , min(CAST(Finger_Print_TS AS time)) AS minTime_in , min(Finger_Print_TS) AS FullTime_in ,(CAST(Finger_Print_TS AS date)) AS Date_in
FROM EmployeeAttendance
WHERE In_Out = 'in'
GROUP BY Employee_Id , (CAST(Finger_Print_TS AS date))



select Employee_Id , min(CAST(Finger_Print_TS AS time)) AS minTime_out , min(Finger_Print_TS) AS FullTime_out ,  (CAST(Finger_Print_TS AS date)) AS Date_out
FROM EmployeeAttendance AS EMP1
WHERE In_Out = 'out' 
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


DROP TABLE EmployeeAttendance



CREATE TABLE Employee_Attendance_Details (
    Att_Key INT PRIMARY KEY identity (1,1),
    Emp_ID INT,
    Date DATE,
    Time_In TIME,
    Time_Out TIME,
    Worked_Hours INT,
    State VARCHAR(50)
);


select * from Employee_Attendance_Details

DROP TABLE Employee_Attendance_Details







ISNULL(minTime_in) || ISNULL(minTime_out) ? "no check out" : (([minTime_in] == "09:00:00.0000000") && ([worked_hours] > 8) ? "ebn el-shrka" : (([minTime_in] == "09:00:00.0000000") && ([worked_hours] == 8) ? "mo7tram" :(([minTime_in] > "09:00:00.0000000") && ([worked_hours] == 8) ? "raye2" : (([minTime_in] == "09:00:00.0000000") && ([worked_hours] < 8) ? "byst3bat" : (([minTime_in] > "09:00:00.0000000") && ([worked_hours] < 8) ? "msh mo7tram" :"undefined")))))
