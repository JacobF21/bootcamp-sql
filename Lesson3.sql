-- "primary key" -> unique, not null, index
-- "auto increment -> exisiting max value + 1"
CREATE TABLE computer_scientists (
  id integer primary key auto_increment, 
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  Date_of_Birth DATE,
  Nationality varchar(2)
);

select * from computer_scientists;
insert into computer_scientists values(21,'Shafria', 'Goldwasser',null,'US');
insert into computer_scientists values(22,'Alan', 'Turing','1912-05-23','UK');
insert into computer_scientists values(23,'Judea', 'Pearl','1936-09-03','IL');
insert into computer_scientists values(24,'Leslie', 'Lamport','1941-02-07','US');
insert into computer_scientists values(25,'Michael', 'Stonebraker','1943-10-11','US');
insert into computer_scientists values(26,'Shafria', 'Diffie','1944-05-05','US');
insert into computer_scientists values(27,'Martin', 'Hellman','1945-10-02','US');
insert into computer_scientists values(28,'Silvio', 'Micali','1954-10-13','IT');
insert into computer_scientists values(30,'test', 'Micali','1954-10-13','IT');
insert into computer_scientists values(null,'test', 'Micali','1954-10-13','IT');
insert into computer_scientists values(23,'test', 'Micali','1954-10-13','IT');

CREATE TABLE winner (
  id integer primary key auto_increment,
  Recipient integer not null,
  Year YEAR
);

select * from winner;
insert into winner values (58,23,2011);
insert into winner values (59,21,'2012');
insert into winner values (60,28,'2012');
insert into winner values (61,24,'2013');
insert into winner values (62,25,'2014');
insert into winner values (63,26,'2015');
insert into winner values (64,27,'2015');

CREATE TABLE countries (
  id varchar(2),
  Country_name varchar(255)
);

select * from countries;
insert into countries values ('IL','Israel');
insert into countries values ('IT','Italy');
insert into countries values ('UK','United Kingdom');
insert into countries values ('US','United States');

CREATE TABLE awards (
  id YEAR,
  Main_contribution Text
);

select * from awards;
insert into awards values (2011,'Bayesian inference algorithms.');
insert into awards values (2012,'Secure criptographic proofs.');
insert into awards values (2013,'Distributed computing system design.');
insert into awards values (2014,'Database systems design.');
insert into awards values (2015,'Diffie-Helmann key sharing.');

Select c.first_name, c.last_name,a.Main_contribution, co.Country_name
From computer_scientists c inner join winner w inner join awards a inner join countries co on c.id = w.recipient and w.year = a.id and co.id = c.nationality
Where w.year = 2015;

Select c.first_name, c.last_name,a.Main_contribution
From computer_scientists c, winner w, awards a
Where c.id = w.recipient and w.year = a.id and w.year = 2015;

-- Foreign Key

-- Primary Key





