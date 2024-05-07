CREATE TABLE Product (
  id integer,
  name VARCHAR(255),
  price DECIMAL(10,2),
  description TEXT,
  created_at TIMESTAMP
);
 insert into Product values(1,'Laptop', 999.99,"High-performance laptop with SSD storage.",CURRENT_TIMESTAMP);
 insert into Product values(2,'Smartphone', 599.5,"4G smartphone with advanced camera features.",CURRENT_TIMESTAMP);
 insert into Product values(3,'Headphone', 79.9,"Wireless headphones with noise-canceling technology",CURRENT_TIMESTAMP);
 
 
 select * from Product order by name asc;
SELECT * FROM Product WHERE price = (SELECT MAX(price) FROM Product);
SELECT distinct count(id) from PRODUCT;
SELECT * FROM Product WHERE lower(name) LIKE '%laptop%';

select AVG(price) as average_price from product;
select * from Product order by created_at Limit 1;
select Sum(price) as 'Total Price' from product;

select Max(price) as 'Max price for Phones', min(price) from product where name like '%phone%';
select description as 'Product Description' from Product where description like 'wireless';















