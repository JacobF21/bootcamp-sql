-- drop table employees;
-- drop table job_history;
-- drop table jobs;
-- drop table departments;
-- drop table locations;
-- drop table countries;
-- drop table regions;

-- DELETE FROM employees;
-- DELETE FROM job_history;
-- DELETE FROM jobs;
-- DELETE FROM departments;
-- DELETE FROM locations;
-- DELETE FROM countries;
-- DELETE FROM regions;


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

INSERT INTO REGIONS (REGION_ID, REGION_NAME) VALUES
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia');

INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES
('US', 'United States', 2),
('IT', 'Italy', 1),
('DE', 'GERMANY', 1),
('UK', 'United Kingdom', 1),
('JP', 'Japan', 3);



INSERT INTO LOCATIONS (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES
(1001, '123 Main St', '12345', 'New York', 'NY', 'UK'),
(1002, '456 Elm St', '67890', 'London', NULL,'UK'),
(1000, '1297 Via Cola di Rie', '989', 'Roma', NULL,'IT'),
(1100, '93091 Calle della Te', '10934', 'Venice', NULL,'IT'),
(1200, '2017 Shinjuku-ku', '1689', 'Tokyo', NULL,'JP'),
(1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas','JP');

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(10, 'Administration', 101, 1100),
(20, 'Marketing', 102, 1200),
(30, 'Purchasing', 103, 1400);

INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES
('SALESMAN', 'Salesman', 30000, 60000),
('HR_REP', 'HR Representative', 35000, 70000),
('IT_PROG', 'IT Programmer', 40000, 80000),
('MK_REP', 'Marketing Rep', 40000, 80000);

INSERT INTO JOB_HISTORY (START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID, EMPLOYEE_ID) VALUES
('1993-01-13', '1998-07-24', 'IT_PROG', 20, 102),
('1989-09-21', '1993-10-27', 'MK_REP', 10, 101),
('1993-10-28', '1997-03-15', 'MK_REP', 30, 101),
('1996-02-17', '1999-12-19', 'SALESMAN', 30, 100),
('1998-03-23', '1999-12-31', 'MK_REP', 20, 103),
('2023-01-15', '2023-05-15', 'SALESMAN', 10, 104),
('2023-02-20', '2023-06-20', 'HR_REP', 20, 105),
('2023-03-25', NULL, 'IT_PROG', 30, 106);


INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES
(100, 'Steven', 'King', 'SKING', '515-123-4568', '1987-06-17', 'HR_REP', 24000, 0.00, 103,10),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515-123-4569', '1987-06-18', 'MK_REP', 17000, 0.00, 103,20),
(102, 'Lex', 'De Haan', 'LDEHAAN', '515-123-4570', '1987-06-19', 'IT_PROG', 17000, 0.00, 103,30),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590-4234567', '1987-06-20', 'MK_REP', 9000, 0.00, 103,20),
(104, 'John', 'Doe', 'john@example.com', '123-456-7890', '2023-01-15', 'SALESMAN', 50000, 0.05, 103, 10),
(105, 'Jane', 'Smith', 'jane@example.com', '987-654-3210', '2023-02-20', 'HR_REP', 55000, 0.07, 103, 20),
(106, 'Michael', 'Johnson', 'michael@example.com', '555-123-4567', '2023-03-25', 'IT_PROG', 60000, 0.06, 103,30);

-- Q.3
SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM countries c INNER JOIN locations l on c.country_id = l.country_id;

-- Q.4
SELECT first_name, last_name, department_id
FROM employees;

-- Q.5
SELECT e.first_name, e.last_name, e.job_id, e.department_id
FROM employees e inner join departments d inner join locations l inner join countries co on
e.department_id = d.department_id AND d.location_id=l.location_id AND l.country_id=co.country_id
WHERE co.country_name LIKE 'Japan';

-- Q.6
SELECT e1.employee_id, e1.last_name, e2.manager_id, e2.last_name
FROM employees e1, employees e2
WHERE e1.manager_id = e2.employee_id;

-- Q.7
SELECT * 
FROM employees
WHERE hire_date > 
(SELECT HIRE_DATE
FROM employees
WHERE FIRST_NAME = 'LEX' AND LAST_NAME = 'De Haan');

-- Q.8
SELECT d.DEPARTMENT_NAME, count(EMPLOYEE_ID) as num_of_employee
FROM departments d INNER JOIN employees e on d.department_id = e.department_id
GROUP BY d.department_id;

-- Q.9
SELECT e.employee_id, j.job_title, ifnull(DATEDIFF(jh.end_date,jh.start_date), 'WORKING') as num_of_days
FROM  employees e inner join job_history jh inner join jobs j on e.employee_id = jh.employee_id AND j.job_id =e.job_id
WHERE e.department_id=30;

-- Q.10
SELECT *
FROM departments d inner join locations l inner join countries c inner join employees e on
d.location_id = l.location_id AND c.country_id = l.country_id AND d.department_id = e.department_id
WHERE d.manager_id = e.employee_id;

-- Q.11
SELECT e.department_id, AVG(SALARY)
FROM departments d  inner join employees e on d.department_id = e.department_id
GROUP BY e.department_id;



    
    
    
    
    
