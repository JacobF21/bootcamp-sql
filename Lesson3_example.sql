Create table customer3(
	id integer primary key auto_increment,
    first_name varchar(20),
	last_name varchar(20),
    phone varchar(50),
    email varchar(50)
);

CREATE TABLE order3 (
    id INT AUTO_INCREMENT,
    customer_id INT,
    delivery_address VARCHAR(100),
    total_amount DECIMAL(10, 2),
    CONSTRAINT PK_Order PRIMARY KEY (id),-- another way to add primary key
    CONSTRAINT FK_CustomerOrder FOREIGN KEY (customer_id) REFERENCES customer3 (id)
);

insert into customer3 values (1, 'Vincent', 'Lau','852 12345678', 'vincent@gmail.com'),
							 (2, 'Oscar', 'Lo','852 87654321', 'oscar@gmail.com');
insert into customer3 values (3, 'Jenny', 'Lau',' 852 12345678 ', 'vincent@gmail.com');
insert into customer3 values (4, 'Sally', 'Lau',' 852 12345678 ', 'vincent@gmail.com');

insert into order3 values(1,2,'ABC XYZ',100.44);
insert into order3 values(2,2,'xxxABC XYZ',22.88);
insert into order3 values(3,1,'aaABC XYZ',12.12);
insert into order3 values(4,3,'aaAfffffABC XYZ',90.12);

-- With foreign key: you cannot add a child row with foreign key value not exists in parent primary key column
insert into order3 values (5,4,'XYZ',90.12);

SELECT c.first_name, c.last_name, o.delivery_address, o.total_amount
FROM customer3 c inner join order3 o on c.id = o.customer_id;

-- left join
SELECT c.first_name, c.last_name, o.delivery_address, ifnull(o.total_amount,0)
FROM customer3 c left join order3 o on c.id = o.customer_id
WHERE o.customer_id is null
;
