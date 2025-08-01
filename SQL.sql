CREATE DATABASE demo;

USE demo;


CREATE TABLE abc1(
	id INT NOT NULL,
    first_name VARCHAR(50) UNIQUE,
    last_name VARCHAR(50),
    age INT CHECK( age >=18),
    balance INT DEFAULT 25
);

DROP TABLE customer;

SELECT first_name, age FROm abc1;


CREATE TABLE customer(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT CHECK(age >=18),
    gender CHAR(1) CHECK (gender IN ('M', 'F', 'O')),
    ph_number BIGINT UNIQUE CHECK (ph_number >=1000000000 AND ph_number <=9999999999)
)auto_increment=4000;

INSERT INTO customer( first_name, last_name, age, gender, ph_number)
VALUES
	  ('Thomas','Wyane',40,'M',1234567790),
      ('Bruce','Wyane',41,'M',1238491201),
      ('Clark','Kent',43,'M',9812640173),
      ('Peter','Parker',24,'M',9876521340),
      ('Bruce','Banner',39,'M',9612478017),
      ('Tony','Stark',40,'M',9736109461),
      ('Steven','Rogers',90,'M',9162748013),
      ('Oliver','Quinn',35,'M',9712347805),
      ('Wally','West',29,'M',9718201734),
      ('Barry','Allen',30,'M',9271829371)
      ;
      
INSERT INTO customer( first_name, last_name, age, gender, ph_number)
VALUES
	  ('Louis','Wyane',40,'O',1234567710);

#AND to include both condition and OR for any one
SELECT * FROM customer WHERE age >25 AND gender='M';

#between for range
SELECT * from customer WHEre age BETWEEN 25 AND 45;

SELECT * from customer WHERE gender IN('O');

#NOT for complementary
SELECT * from customer WHERE gender NOT IN ('M','F');

#delete using unique value ie id
DELETE FROM customer WHERE id=4003;

#limit for top 3
SELECT * from customer LIMIT 3;

SELECT * FROM customer;

#Order by ASC for ascending and DESC for descending
SELECT first_name FROM customer WHERE gender='M' ORDER BY age DESC LIMIT 1;

#Aggegrate

SELECT COUNT(first_name) FROM customer;

SELECT MAX(age) FROM customer;

SELECT MIN(age) FROM customer;

SELECT AVG(age) FROM customer;

SELECT SUM(age) FROM customer;

SELECT first_name, COUNT(ID) 
FROM customer 
GROUP BY first_name;

SELECT first_name, COUNT(ID) AS frequency
FROM customer 
GROUP BY first_name
HAVING min(age)<26; 


# order of SELECT,FROM,WHERE,GROUP BY, HAVING, ORDER BY

SELECT first_name
FROM customer
GROUP BY first_name, age
HAVING age=(SELECT MAX(age) FROM customer);
