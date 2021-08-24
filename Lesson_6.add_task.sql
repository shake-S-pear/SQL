USE carsshop;

drop FUNCTION MinAge_1;

DELIMITER |
CREATE FUNCTION MinAge_1() 
RETURNS INT
DETERMINISTIC
BEGIN
declare numrows int;
declare i int;
declare min_age int;
   	SET numrows = (SELECT COUNT(age) FROM clients);
    set i = 1;
    set min_age = 1000;
     WHILE (i <= (SELECT MAX(id) FROM clients))
     do
		if min_age > (SELECT age FROM clients WHERE id = i)
        then set min_age = (SELECT age FROM clients WHERE id = i);
        end if;
		set i = i +1;
    end while;
    return min_age;
END;
|
drop FUNCTION MinAge_2;
|
CREATE FUNCTION MinAge_2() 
RETURNS INT
DETERMINISTIC
BEGIN
declare min_age int;
   	SET min_age = (SELECT min(age) FROM clients);
	return min_age;
END;|

select MinAge_1() as min_variant_1;|

select MinAge_2() as min_variant_2;|

DROP procedure getAllCarsOfThisClient; |

select * from cars;|
select * from marks;|
select * from clients;|
select * from orders;|

CREATE PROCEDURE getAllCarsOfThisClient(in age_X int)
BEGIN
    SELECT mark, (select name from clients where age = age_X) as client FROM marks 
        join orders on marks.id = orders.car_id
        join clients on orders.client_id = clients.id
        where age = age_X;
END|

CALL getAllCarsOfThisClient(25);|

-- Используя базу данных carsshop создайте функцию для нахождения минимального возраста клиента, затем сделайте выборку всех машин, которые он купил.
