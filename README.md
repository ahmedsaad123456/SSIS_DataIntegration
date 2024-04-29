# SSIS_DataIntegration Overview

This SSIS assignment involves solving four different tasks using Microsoft SQL Server Integration Services (SSIS). Each task addresses a specific data integration challenge, from consuming REST APIs to transforming and loading data into target tables.

## Task 1: Consume REST API and Load to Database
- **Problem**: Load selected fields from a REST API response into a database table.
- **Steps**:
  - Create a database table named `University` with columns: `name`, `country`, and `alpha_two_code`.
  - Fetch data from the REST API and map selected fields to the corresponding columns in the `University` table using C# script.
  
## Task 2: Implement SCD Type 4
- **Problem**: Implement Slowly Changing Dimension (SCD) Type 4 for a source table.
- **Steps**:
  
1- "GET LAST EXTRACT DATE" : here we select max "From_Date" from table "CustomerHistory" to use Incremental Load

2- in the "Data Flow Task" : load from table Customer to two target tables "CustomerSCD4" , "CustomerHistory"


--------------- in the "Data Flow Task" in details ------------------


    1- "Customer Table Source " : we select all rows from the "Customer" table but only if the "Update_Date" > MaxDate that
                                  we extract it from "CustomerHistory" and that means we load only the changed data.

    2- "CustomerSCD4 Lookup" : we use "CustomerSCD4" table as lookup to determine if the extracted data exists in the 
                               target tables or not.

	-- in case "Lookup no match output" means the data not exists in the target and need to be inserted :

	3- "First Multicast" : here we use multicast to send the extracted data to two target tables

	4- "CustomerSCD4 Destination" :  send the four attributes and ignore "Update_Date" for this target table

	5- "CustomerHistory Destionation" : send all the data and assign the "From_Date" to "Update_Date" and by default 
                                      the "To_Date" will be "9999-12-30" 


	-- in case "Lookup match output" means the data is already exists in the target and need to update :
	6- "Check Changed Data" : check if the value of city or email is changed or not

 	-- in case if changed
	7- "CustomerHistory Lookup" : we use additional lookup "CustomerHistory" because we need "From_Date" attribute to update 
                                the corresponding "To_Date" with the "Update_Date"
	
	8- "Second Multicast" : here we use multicast to send the extracted data to two target tables

	9- "Update City_Email in CustomerSCD4" : update "City" and "Email" in "CustomerSCD4" Using the lookupID

	10- "Update To_Date in CustomerHistory" : update "To_Date" to "Update_Date" using lookupID and "From_Date"

	11-"CustomerHistory Destination" : insert the updated data in the "CustomerHistory" table  

 




  
## Task 3: Load Source Data with Versioning
- **Problem**: Load source data into a target table with versioning.
- **Solution Approach**: Implement versioning logic using SSIS for loading data from `Employee_Q3` into the target table.
- **Steps**:

--------------- in the "Data Flow Task" in details ------------------

    1- "Employee Table Source" : we select all row from the "Employee" table

    2- "TargetEmployee Lookup" : we use "TargetEmployee" table as lookup to determine if the extracted data exists in the 
                                target tables or not , we select the following four attributes 
                                "Emp_Key"  , "ID" , "Insert_Date" , "Version_No" only if the "Active_Flag" = 1
                                "ID" to make join , "Insert_Date" to check if the Date is changed or not 
                                "Version_No" we check if the Date wasn't changed increment it by 1

	-- in case "Lookup match output" means the data is already exists in the target and need to update :
 

    3- "Update Active_Flag in TargetEmployee" : set the "Active_Flag" to zero where the "ID" = "LookupID" 

    4- "Check Date" : conditional split to check if the "Schedule_Date" was changed or not (to update Version_No)

     -- in case "Lookup no match output" means the data is not exists in the target and need to be inserted : 


    5- "Union All" : Unoin All output of " Lookup no match output " with output of conditinal split "Changed" that mean the "Schedule_Date" was changed

    6- "TargetEmployee Destination" : insert all data in the "TargetEmployee" table expect
                                      "Active_Flag" and "Version_No" because it will be one by default 

    7- "New_Version_No" : if the "Schedule_Date" wasn't changed we use derived column to increment "Version_No" by one 

    8- "TargetEmployee Destination" : insert all data in the "TargetEmployee" table expect "Active_Flag" 
                                      because it will be one by default and "Version_No" will be assign to "new_version_no"
                                      
  

## Task 4: Transform Attendance Device Data
- **Problem**: Read data from an attendance device and transform it into a target table with a descriptive state for each record.
- **Solution Approach**: Use SSIS to process data from the `Attendance_Device` source table and transform it into the `Employee_Attendance_Details` target table.
- **Steps**:
  
  --------------- in the "Data Flow Task" in details -----------------
  
      1- "EmployeeAttendance_in Source" (to get Time_in): we select 'Employee_id' , date and 'min time ' of the check in for each employee in different date , and we select 'Finger_Print_TS' to
  					  use it to get the diffrenece between two times
     
      2- "EmployeeAttendance_out Source" (to get Time_out): we select 'Employee_id' , date and 'min time ' of the check out only if it is >= the max check in time  for each employee in different date , and we select 
                                           'Finger_Print_TS' to use it to get the diffrenece between two times

      3- "Sort Date and ID" : sort the data of the "EmployeeAttendance_in Source" based on the date and ID

      4- "Sort Date and ID" : sort the data of the "EmployeeAttendance_in Source" based on the date and ID

      5- "Merge Join" : Merge with Full outer join of the two sources based on hte date and ID to keep the null value

      6- "Worked_hours" :   get the Emp_ID from any source to avoid the null (using ISNULL)
                            get the Date from any source to avoid null (using ISNULL)
                            get the worked_hours using the diffrence between "Finger_Print_TS"
  
      7- "State" : get the State according to the following criteria :
			![image](https://github.com/ahmedsaad123456/SSIS_DataIntegration/assets/92929722/dc615b06-5631-4b08-9300-4c254b33e661)


      8- "Employee_Attendance_Details Destination" :  insert all data in the "Employee_Attendance_Details" table


