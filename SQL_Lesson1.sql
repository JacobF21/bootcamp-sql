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





