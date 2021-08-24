use shopdb;

drop table customers;

create table customers (id int, name varchar(30));

insert customers
values
(1, 'Tanya'),
(2, 'Vanya'),
(3, 'Manya'),
(4, 'Zhenya');

explain select * from customers where name = 'Zhenya';

drop table customers;

create table customers (id int primary key, name varchar(30));

insert customers
values
(1, 'Tanya'),
(2, 'Vanya'),
(3, 'Manya'),
(4, 'Zhenya');

explain select * from customers where id = 4;

drop table employees;

create table employees (id int primary key, name varchar(30));

insert employees
values
(1, 'Petro'),
(2, 'Panas'),
(3, 'Olya'),
(4, 'Maryna');

drop view Names;

create view Names
as select customers.name as cust_name, employees.name as empl_name  from customers, employees;

select * from Names;

-- Используя базу данных ShopDB и таблицу Customers (удалите таблицу, если есть и создайте заново первый раз без первичного ключа затем – с первичным) 
-- и затем добавьте индексы и проанализируйте выборку данных.