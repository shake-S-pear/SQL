CREATE DATABASE MyDB;

USE MyDB;

CREATE TABLE name_employee
(
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR (30),
    telephone VARCHAR (20),
    PRIMARY KEY (id)
);

CREATE TABLE employee_salary
(
	id INT AUTO_INCREMENT NOT NULL,
    salary DOUBLE,
    job VARCHAR (40),
	PRIMARY KEY (id)
);

CREATE TABLE employee_family
(
	id INT AUTO_INCREMENT NOT NULL,
    family VARCHAR (20),
    birth_date DATE,
    address VARCHAR (50),
    PRIMARY KEY (id)
);

INSERT INTO name_employee (name, telephone) VALUE ('Paraska', '050-987-05-63');
INSERT INTO name_employee (name, telephone) VALUE ('Panas', '093-001-56-10');
INSERT INTO name_employee (name, telephone) VALUE ('Maryna', '063-321-22-99');
INSERT INTO name_employee (name, telephone) VALUE ('Makar', '067-403-91-44');

INSERT INTO employee_salary (salary, job) VALUE (10000.50, 'cleaner');
INSERT INTO employee_salary (salary, job) VALUE (23000.10, 'director');
INSERT INTO employee_salary (salary, job) VALUE (12030.60, 'secretary');
INSERT INTO employee_salary (salary, job) VALUE (14450.00, 'driver');

INSERT INTO employee_family (family, birth_date, address) VALUE ('married', '1960-03-23', 'Kyiv, Solomyanska, 23, appartment 12');
INSERT INTO employee_family (family, birth_date, address) VALUE ('married', '1975-09-11', 'Lviv, Franka, 105, appartment 78');
INSERT INTO employee_family (family, birth_date, address) VALUE ('married', '2001-06-08', 'Kharkiv, Shevchenka, 5, appartment 304');
INSERT INTO employee_family (family, birth_date, address) VALUE ('married', '1982-05-21', 'Kyiv, Solomyanska, 23, appartment 12');

UPDATE employee_family SET birth_date = '1960-03-23' WHERE id = 1;
UPDATE employee_family SET birth_date = '1975-09-11' WHERE id = 2;
UPDATE employee_family SET birth_date = '2001-06-08' WHERE id = 3;
UPDATE employee_family SET birth_date = '1982-05-21' WHERE id = 4;

SELECT * FROM name_employee;
SELECT * FROM employee_salary;
SELECT * FROM employee_family;

DELETE FROM employee_family WHERE id = 4;

ALTER TABLE employee_family MODIFY COLUMN family VARCHAR (20);

UPDATE employee_family SET family = 'not married' WHERE id = 6;

SELECT * FROM employee_family;

-- В созданной базе данных (из задания 2) создать 3 таблицы:
-- 1-я содержит имена и номера телефонов сотрудников некой компании,
-- 2-я содержит ведомости об их зарплате, и должностях,
-- 3-я содержит информацию о семейном положении, дате рождения и месте проживания.