-- drop table employee;
-- drop table job_history;
-- drop table jobs;
-- drop tablePRIMARY departments;
-- drop table locations;
-- drop table countries;
-- drop table regions;


CREATE TABLE regions(
	REGION_ID int PRIMARY KEY,
    REGION_NAME varchar(25)
);

CREATE TABLE countries(
	COUNTRY_ID varchar(2) PRIMARY KEY,
    COUNTRY_NAMAE varchar(40),
    REGION_ID int,
	CONSTRAINT FK_REGION_ID FOREIGN KEY (REGION_ID) REFERENCES regions(REGION_ID)
);

CREATE TABLE locations(
	LOCATION_ID int PRIMARY KEY,
    STREET_ADDRESS varchar(25),
    POSTAL_CODE varchar(12),
	CITY varchar(30),
    STATE_PROVINCE varchar(12),
    COUNTRY_ID varchar(2),
	CONSTRAINT FK_COUNTRY_ID FOREIGN KEY (COUNTRY_ID) REFERENCES countries(COUNTRY_ID)
);

CREATE TABLE departments(
	DEPARTMENT_ID int PRIMARY KEY,
    DEPARTMENT_NAME varchar(30),
    MANAGER_ID int,
    LOCATION_ID int,
	CONSTRAINT FK_LOCATION_ID FOREIGN KEY (LOCATION_ID) REFERENCES locations(LOCATION_ID)
);

CREATE TABLE jobs(
	JOB_ID varchar(10) PRIMARY KEY,
    JOB_TITLE varchar(35),
    MIN_SALARY int,
    MAX_SALARY int
);

CREATE TABLE job_history(
	EMPLOYEE_ID int,
    START_DATE date,
    END_DATE date,
    JOB_ID varchar(10),
    DEPARTMENT_ID int,
    PRIMARY KEY (EMPLOYEE_ID, START_DATE),
    CONSTRAINT FK_JOB_ID_JOB_HISTORY FOREIGN KEY (JOB_ID) REFERENCES jobs(JOB_ID),
	CONSTRAINT FK_DEPARTMENT_ID_JOB_HISTORY FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID)
);

CREATE TABLE employees(
	EMPLOYEE_ID int PRIMARY KEY,
    FIRST_NAME varchar(20),
    LAST_NAME varchar(25),
    EMAIL varchar(25),
    PHONE_NUMBER varchar(20),
    HIRE_DATE date,
    JOB_ID varchar(10),
    SALARY int,
    COMMISSION_PCT int,
    MANAGER_ID int,
    DEPARTMENT_ID int,
	CONSTRAINT FK_DEPARTMENT_ID_EMPLOYEE FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID),
	CONSTRAINT FK_JOB_ID_EMPLOYEE FOREIGN KEY (JOB_ID) REFERENCES jobs(JOB_ID),
	CONSTRAINT FK_EMPLOYEE_ID FOREIGN KEY (EMPLOYEE_ID) REFERENCES job_history(EMPLOYEE_ID)
);
    
    
    
    
    