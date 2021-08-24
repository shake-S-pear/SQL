CREATE DATABASE Cars;
							 
USE Cars;             

CREATE TABLE Cars
(
	 id INT AUTO_INCREMENT NOT NULL,
     mark VARCHAR(20),
     model VARCHAR (10),
     volume_engine DOUBLE,
     price INT,
     speed INT,
     PRIMARY KEY (id)
);

INSERT INTO cars (mark, model, volume_engine, price, speed) VALUES ('BMW', '320d', 2.4, 35000, 240);

INSERT INTO cars (mark, model, volume_engine, price, speed) VALUES ('Renault', '1.2tv', 1.2, 16000, 140);

INSERT INTO cars (mark, model, volume_engine, price, speed) VALUES ('Renault', '1.2tv', 1.2, 16000, 140);

SELECT * FROM Cars;
