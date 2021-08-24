drop database MyJoinsDB;

create database MyJoinsDB;

use MyJoinsDB;

create table employee_name_telephone 
(
	idEmployee int auto_increment,
	name varchar(70),
    telephone varchar(14),
    primary key (idEmployee)
);

CREATE INDEX telephone ON employee_name_telephone (telephone);

create table employee_salary_title
(
	idEmployee int,
    title varchar(30),
    salary int,
    primary key (idEmployee)
);

create table employee_personalInformation
(
	idEmployee int,
    family varchar(20),
    date date,
    address varchar(100)
);

CREATE INDEX address ON employee_personalInformation (address);

alter table employee_personalInformation add constraint
FK_EmployeeId foreign key (idEmployee)
references employee_name_telephone (idEmployee)
		ON UPDATE  CASCADE 
		ON DELETE  SET NULL ;

alter table employee_salary_title add constraint
FK_EmployeeId_2 foreign key (idEmployee)
references employee_name_telephone (idEmployee)
		ON UPDATE  CASCADE 
		ON DELETE  CASCADE ;

insert employee_name_telephone
(name, telephone)
values
('Ivan Ivanenko', '(090)789-56-21'),
('Maryna Marynenko', '(050)123-32-80'),
('Kindrat Kindratenko', '(068)320-60-11');

insert employee_salary_title
(idEmployee, title, salary)
values
(1, 'director', 30000),
(2, 'manager', 15000),
(3, 'worker', 8000);

insert employee_personalInformation
(idEmployee, family, date, address)
values
(1, 'married', '1970-12-23' , 'Kyiv, Khreshchatyk, 23, apart. 57'),
(2, 'not married', '1997-06-18' , 'Lviv, Solomyanska, 123, apart. 2'),
(3, 'married', '1988-10-29' , 'Hluhiv, Shevchenka, 66, apart, 203');

select * from employee_name_telephone;
select * from employee_salary_title;
select * from employee_personalInformation;

-- 1)Получите контактные данные сотрудников (номера телефонов, место жительства).

select name, telephone, address from employee_name_telephone
join employee_personalInformation on employee_name_telephone.idEmployee = employee_personalInformation.idEmployee;

-- 2)Получите информацию о дате рождения всех холостых сотрудников и их номера.

select name, telephone, date from employee_name_telephone
join employee_personalInformation on employee_name_telephone.idEmployee = employee_personalInformation.idEmployee
where family = 'not married';

-- 3)Получите информацию обо всех менеджерах компании: дату рождения и номер телефона.

select name, telephone, date from employee_name_telephone
join employee_personalInformation on employee_name_telephone.idEmployee = employee_personalInformation.idEmployee
join employee_salary_title on employee_name_telephone.idEmployee = employee_salary_title.idEmployee
where title = 'director' or title = 'manager';
