CREATE table Sales(
 id integer,
 product_id integer,
 product_name varchar(255),
 unit_price decimal(10,2),
 quantity_sold integer,
 discount_amount decimal(10,2),
 tax_rate decimal(5,2),
 shipping_cost decimal(10,2),
 handling_fee decimal(10,2)
 );
 
insert into Sales value(1,1,'Laptop',999.99,2,0,5,10.5,5.25);
insert into Sales value(2,2,'Smartphone',599.5,5,25.75,7.5,5.75,3.25);
insert into Sales value(3,3,'Headphones',79.99,10,5,5,2.99,1.5);
 
 Select * from sales;