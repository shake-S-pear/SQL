drop database Transaction;

create database Transaction;

use transaction;

create table employees
(id int auto_increment primary key,
name varchar (30),
telephone varchar (15));

create table job_info
(id int,
salary int,
title varchar(30),
foreign key(id) references employees(id));

create table family
(id int,
family varchar(30),
date date,
address varchar(50),
foreign key(id) references employees(id));

DELIMITER |
DROP procedure insert_data; |

CREATE PROCEDURE insert_data(in nameXX varchar (30), telephoneXX varchar (15), salaryXX int, titleXX varchar(30), familyXX varchar(30), dateXX date, addressXX varchar(50))
BEGIN
DECLARE IdXX int;
START TRANSACTION;

    insert employees (name, telephone) values (nameXX, telephoneXX);
    SET IdXX = @@IDENTITY;
    
    insert job_info (id, salary, title) values (IdXX, salaryXX, titleXX);
    
    insert family (id, family, date, address) values (IdXX, familyXX, dateXX, addressXX);
    
    IF EXISTS (SELECT * FROM employees WHERE name = nameXX AND telephone = telephoneXX and id != IdXX)
			THEN
				ROLLBACK; 
			END IF;	
		COMMIT; 
END; |
    
CALL insert_data('Roman Ivanenko', '(090)789-56-21', 30000, 'director', 'married', '1970-12-23' , 'Kyiv, Khreshchatyk, 23, apart. 57');|
CALL insert_data('Olha Marynenko', '(050)123-32-80', 15000, 'manager', 'not married', '1997-06-18' , 'Lviv, Solomyanska, 123, apart. 2');|
CALL insert_data('Davyd Ivanenko', '(090)789-56-21', 8000, 'worker', 'married', '1988-10-29' , 'Hluhiv, Shevchenka, 66, apart, 203');|
|
select * from employees;|
select * from job_info;|
select * from family;|

CREATE TRIGGER delete_data
BEFORE DELETE ON employees 
FOR EACH ROW 
  BEGIN
    DELETE FROM job_info WHERE id = OLD.id;
    DELETE FROM family WHERE id = OLD.id;
 END;
|

DELETE FROM employees WHERE id = 2; |    
    
-- Задание 4
-- Выполните ряд записей вставки в виде транзакции в хранимой процедуре. Если такой сотрудник имеется откатите базу данных обратно.
-- Задание 5
-- Создайте триггер, который будет удалять записи со 2-й и 3-й таблиц перед удалением записей из таблиц сотрудников (1-й таблицы), чтобы не нарушить целостность данных.