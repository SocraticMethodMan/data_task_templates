-- 1. Boot mysql: 
mysql -u root -p

-- 2. Set database to db_test 
use db_test

-- 3. Create table for .csv to import into. Note that columns need to line up. 
DROP TABLE IF EXISTS db_test.Police_Department_Incident_Reports__2018_to_Present_20240204;
CREATE TABLE `Police_Department_Incident_Reports__2018_to_Present_20240204`
(
`Incident_Datetime` text,
`Incident_Date` text,
`Incident_Time` text,
`Incident_Year` text,
`Incident_Day_of_Week` text,
`Report_Datetime` text,
`Row_ID` text,
`Incident_ID` text,
`Incident_Number` text,
`CAD_Number` text,
`Report_Type_Code` text,
`Report_Type_Description` text,
`Filed_Online` text,
`Incident_Code` text,
`Incident_Category` text,
`Incident_Subcategory` text,
`Incident_Description` text,
`Resolution` text,
`Intersection` text,
`CNN` text,
`Police_District` text,
`Analysis_Neighborhood` text,
`Supervisor_District` text,
`Supervisor_District_2012` text,
`Latitude` text,
`Longitude` text,
`Point` text,
`Neighborhoods` text,
`ESNCAG_Boundary_File` text,
`Central_Market_Tenderloin_Boundary_Polygon_Updated` text,
`Civic_Center_Harm_Reduction_Project_Boundary` text,
`HSOC_Zones_as_of_2018_06_05` text,
`Invest_In_Neighborhoods_IIN_Areas` text,
`Current_Supervisor_Districts` text,
`Current_Police_Districts` text
)
;

-- 4. Confifrm table was created
show tables 


-- 5. Import .csv 
LOAD DATA LOCAL INFILE '/Users/ernie/Downloads/Police_Department_Incident_Reports__2018_to_Present_20240204.csv'
INTO TABLE Police_Department_Incident_Reports__2018_to_Present_20240204
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Note: The following error indicates that the security settings of mysql do not allow importing from the Downloads directory
-- ERROR 1290 (HY000): The MySQL server is running with the --secure-file-priv option so it cannot execute this statement

-- 6. Show which directory is allowed
SHOW VARIABLES LIKE "secure_file_priv";

-- 7. Allow importing from local directories 
SET GLOBAL local_infile=1;

-- 8. Boot mysql with local_infile=1 
--local-infile=1 -uroot -p

-- 9. Set database to db_test 
use db_test

-- 10. Import data should work now
LOAD DATA LOCAL INFILE '/Users/ernie/Downloads/Police_Department_Incident_Reports__2018_to_Present_20240204.csv'
INTO TABLE Police_Department_Incident_Reports__2018_to_Present_20240204
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; 


-- 11. Test querying on table 
select * from Police_Department_Incident_Reports__2018_to_Present_20240204 limit 5;