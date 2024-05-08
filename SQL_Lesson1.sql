use sys;

-- Create Table Statement
create table Circle(
	radius decimal(3,2)
);

-- Basic Select Statement
select * from Circle;

-- Insert data
-- Approach 1: insert into xxx (column_name ....) value(...);
insert into Circle (RADIUS) VALUES (2.34);  -- Decimal(3,2) -> 1 integer, 2 decimal places
insert into Circle (RADIUS) VALUES (1.3456); -- MySQL product behaviour 1.3456->1.35
insert into Circle (RADIUS) VALUES (0.78); 
-- insert into Circle (RADIUS) VALUES (2455.34); 

-- Approach 2: insert into xxx value(...);
insert into Circle VALUES (0.37); 

-- Delete data
delete from CIRCLE WHERE radius >=1.35;
delete from CIRCLE WHERE radius <=1;

-- Update data (UPDATE table_name SET COLUMN_NAME = xxx WHERE ...)
UPDATE circle set radius = 2.5 WHERE radius=1.99;
UPDATE circle set radius = 2.3 WHERE radius = 1.99;

-- Add column
ALTER table CIRCLE ADD color varchar(20);
SELECT * from circle;

-- insert
insert into circle (color, radius) values ('RED', 3.14); 
insert into circle values (3.15,'Yellow');
UPDATE circle set color = 'BLACK' WHERE radius = 2.3;

ALTER table CIRCLE ADD name varchar(3);
insert into circle values (4.23,'YELLOW','abcd');

CREATE TABLE test (
  radius decimal(3,2),
  color VARCHAR(50) CONSTRAINT CHK_UppercaseColumn CHECK (UPPER(color) = color)
);
select * from circle;
insert into test values(3.14,'BLACK');
insert into test values(5.45,'yellow');

-- select where and
select * from circle where color = 'YELLOW' and radius >3;
select * from circle where color is null;
select * from circle where color is not null;

-- MATH Operator
-- =,>=,<=,>,<,<>
select * from circle where color <> 'BLACK';
-- <> 'BLACK' did not include the entry with null color value 
select * from circle where color <> 'BLACK' or color is null;

-- duel
select 1, 'hello' from duel;
select * from circle;
select radius, color from circle;
select radius, color, 'hello' from circle;
select radius, color, 'hello' as abc from circle;
select radius as c_radius, color as c_color, 'hello' as abc from circle;

delete from circle;
select * from test;
truncate test;

insert into Circle  VALUES (2.34,'BLACK', 'HAH');
insert into Circle  VALUES (4.56,'GREEN', 'HIH');
insert into Circle  VALUES (5.23,'PINK', 'HEH');
insert into Circle  VALUES (1,'PINK', 'HEH');
insert into Circle  VALUES (5,'PINK', 'HEH');

-- DISTINCT
select distinct color from circle;
select distinct color from circle where radius >2;

-- BETWEEN
select * from circle where radius between 1 and 5;
select * from circle;

alter table circle add create_date date;
insert into circle values (9.43,'WHITE','GG',STR_TO_DATE('20012013','%d%m%Y'));
insert into circle values (4.43,'RED','GG',STR_TO_DATE('2014,01,31','%Y,%m,%d'));

select * from circle order by create_date asc;
select * from circle order by create_date desc;
select * from circle where create_date is not null order by create_date desc;

-- MATH operation, +,-,*,/, pi(), round()
select radius,round(radius * radius *pi()) as area from circle;
select 5%2 from dual;

-- LIMIT (use it with ordering)
select * from circle where create_date is not null order by create_date desc limit 1;

-- LIKE
select * from circle where color like '%E%'; -- all color starts with R character

Select * from circle;

Select * from circle where color in ('RED','BLACK') and name is not null order by radius desc;

Create table customer2(
	id integer,
    first_name varchar(20),
	last_name varchar(20),
    phone varchar(50),
    email varchar(50)
);

insert into customer2 values (1, 'Vincent', 'Lau','852 12345678', 'vincent@gmail.com'),
							 (2, 'Oscar', 'Lo','852 87654321', 'oscar@gmail.com');
insert into customer2 values (1, 'Vincent', 'Lau',' 852 12345678 ', 'vincent@gmail.com');

select *, concat(first_name, ' ', last_name) as full_name from customer2;
select substring(last_name,1,1) as first_character from customer2;
select upper(first_name), lower(first_name), concat(first_name,' ',upper(last_name)) from customer2;
select * from customer2;
select c.*, length(trim(c.phone)), length(c.phone) from customer2 c;
select replace(concat(first_name,' ',last_name),'Lau','Chan') new_name from customer2;
select left(first_name,2), right(first_name,2) from customer2;
select concat_ws(' ', first_name, last_name), concat(first_name, ' ', last_name) as full_name from customer2;
select length(last_name) from customer2;

insert into customer2 values(4,'Thomas','陳',' 852 43121234', 'thomas@gmail.com');
select c.*,length(last_name), char_length(last_name) from customer2 c;

select c.*, instr(c.first_name, 'i') from customer2 c;
select c.*, instr(c.first_name, 'in') from customer2 c;
select c.*, instr(c.first_name, 'Jenny') from customer2 c;
select c.*, instr(c.first_name, 'x') from customer2 c;


-- MySQL case insensitive (product specific feature)
select * from customer2 where last_name = 'Lau';
select * from customer2 where last_name = 'lau';

-- correct wat
select * from customer2 where upper(last_name) = 'LAU';
select * from customer2 where lower(last_name) = 'Lau';

-- Like %(zero or more character), + (single character)
select * from customer2 where first_name like '%ncent'; -- OK
select * from customer2 where first_name like '_ncent'; -- Not_OK
select * from customer2 where first_name like '_incent'; -- OK
select * from customer2 where first_name like '_incen%'; -- OK

select ceil(4.3) from dual;
select floor(2.33333) from dual;
select round(4.353,1), round(4.353,2) from dual;
select abs(-5), abs(5) from dual;
select power(2,3), power(-2,3) from dual;

-- DATEADD
select date_add('2023-07-15', interval 3 month) from dual;
select date_add('2023-07-15', interval 1 day) from dual;
select str_to_date('2023-07-15', '%Y-%m%d')+1 from dual; -- NOT OK
select date_sub('2024-01-02',interval 2 day) from dual;
select datediff('2023-12-31','2023-01-01')from dual;
select datediff('2023-01-01','2023-12-31')from dual;

select now() from dual;

select date_format('2023-12-31', '%Y-%m-%d') from dual;

select extract(year from '2023-12-31') from dual;
select extract(month from '2023-12-31') from dual;
select extract(day from '2023-12-31') from dual;

select ifnull(null,0) from dual;

select * from circle;
insert into circle values (null,'BLACK',null,null);
select round(ifnull(radius,0)*ifnull(radius,0)*pi(),2) from circle;
select round(coalesce(radius,0)*coalesce(radius,0)*pi(),2) from circle; -- coalesce() suppoeted in MySQL/PostgreSQL

select
	c.*,
	case
		when color ='RED' then 'R'
		when color ='YELLOW' then 'Y'
        else 'B'
	end as color_short_name
from circle c;


select * from customer2;
ALTER table customer2 add membership varchar(1);
update customer2 set membership = 'G' where upper(last_name) = 'LAU';
update customer2 set membership = 'S' where upper(coalesce(last_name,'x'))<>'LAU';

-- G 2
-- S 2
select distinct membership
from customer2;


select membership, count(membership)
from customer2
group by membership; -- first statement to execute

alter table customer2 add age int;
update customer2 set age =13 where first_name='Vincent';
update customer2 set age =18 where first_name='Jenny';
update customer2 set age =30 where first_name not in ('Vincent','Jenny');

select membership, count(membership), avg(age), max(age) -- aggregation function together with group by
from customer2
group by membership; -- first statement to execute

select count(last_name)
from customer2
group by last_name
having last_name = 'Lau';

select last_name, count(1)
from customer2
where upper(ifnull(last_name,'x')) <> 'LAU'
group by last_name;

-- Having
select last_name, count(1) as count
from customer2
where upper(ifnull(last_name,'x')) <> 'Lo' -- first execution (record level filtering)
group by last_name -- second execution
HAVING count(last_name)>1; -- third execution (group level filtering)

-- customer vs order
create table order2 (
	id int,
    customer_id int,
    delivery_address varchar(100),
    total_amount decimal(10,2)
);

insert into order2 values(1,2,'ABC XYZ',100.44);
insert into order2 values(2,2,'xxxABC XYZ',22.88);
insert into order2 values(3,1,'aaABC XYZ',12.12);
insert into order2 values(4,3,'aaAfffffABC XYZ',90.12);

select * from customer2;
select * from order2;

-- inner join (multiply 2 set of records)
select * 
from customer2 inner join order2;

-- inner join -> find all orders with its customer data
select c.first_name, c.last_name, c.phone, c.email, o.total_amount, o.delivery_address
from customer2 c inner join order2 o on c.id=o.customer_id
where o.total_amount > 30; -- execute after table join

select c.first_name, c.last_name, c.phone, c.email, o.total_amount, o.delivery_address
from customer2 c, order2 o
where c.id=o.customer_id
and o.total_amount > 30; -- execute after table join

select * from order2;
select * from customer2;
-- without foreign key
-- insert into order2 values (5, 99, 'asdf', 12.33); -- customer2 table may not have id 99






