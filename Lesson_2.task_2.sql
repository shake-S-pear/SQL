create database store;

use store;

create table supplier 
(
	supplierId int NOT NULL auto_increment ,				  
	supplierName varchar(50) NOT NULL,
    primary key (supplierId)
);

create table personal 
(
	personalId int NOT NULL auto_increment ,				  
	personalName varchar(50) NOT NULL,
    primary key (personalId)
);

create table orderer 
(
	ordererId int NOT NULL auto_increment ,				  
	ordererName varchar(50) NOT NULL,
    primary key (ordererId)
);

create table supplier_personal_orderer 
(
	 supplierId int NOT NULL,
	 personalId int NOT NULL,
     ordererId int NOT NULL,
	 PRIMARY KEY(supplierId, personalId, ordererId),
	 FOREIGN KEY (supplierId) references supplier(supplierId),
     FOREIGN KEY (personalId) references personal(personalId),
     FOREIGN KEY (ordererId) references orderer(ordererId)
);

insert into supplier 
(supplierName)
VALUES
('Ivan Ivanov'),
('Ivan Petrov'),
('Stepan Ivanov');

insert into personal 
(personalName)
VALUES
('Maria Stepova'),
('Marfa Shevchenko'),
('Paraska Kulyk');

insert into orderer
(ordererName)
VALUES
('Maxym Ivanenko'),
('Taras Petrenko'),
('Olha Sternova');

INSERT INTO supplier_personal_orderer 
( supplierId, personalId, ordererId)
VALUES
(1,1,2),
(2,1,3),
(3,3,1),
(3,1,2),
(2,2,1);

SELECT * FROM supplier;
SELECT * FROM personal;
SELECT * FROM orderer;
SELECT * FROM supplier_personal_orderer;