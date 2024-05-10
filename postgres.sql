CREATE TABLE department (
	id serial primary key, -- serial = int + auto_increment
	department_name varchar(50)
)
	
select * from department;

CREATE TABLE employee (
	id serial primary key, 
	employee_name varchar(50),
	department_id int references department(id) -- foreign key
);

select * from employee;

-- insert into department values(1,'iT');
insert into department (department_name) values ('MK');
insert into department (department_name) values ('IT');
insert into department (department_name) values ('Sales');
insert into department (department_name) values ('HR');
SELECT * FROM department

insert into employee (employee_name, department_id) values ('Vincent',2)
insert into employee (employee_name, department_id) values ('Sally',3);
insert into employee (employee_name, department_id) values ('Cherry',1);
insert into employee (employee_name, department_id) values ('Jenny',1);
SELECT * FROM employee

SELECT * 
FROM department d left join employee e  on e.department_id= d.id;

SELECT * 
FROM department d full outer join employee e  on e.department_id= d.id
WHERE e.id is null;

SELECT d.* 
FROM department d
WHERE not exists(select 1 from employee e where e.department_id = d.id);

SELECT *
FROM employee e inner join department d on d.id = e.department_id;

SELECT *
FROM employee e,department d 
WHERE d.id = e.department_id;

select *
from employee;

-- PostgreSQL
-- distinct on + order by
-- distinct one column, but you can select some other column
SELECT distinct on (department_id) department_id, id, employee_name
from employee
order by department_id asc, id desc;

-- MySQL/PostgreSQL (the column for distinct and select are same)
-- result -> 1/2/3
SELECT distinct department_id
from employee;