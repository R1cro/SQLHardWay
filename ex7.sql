-- DROP TABLE person;
CREATE TABLE IF NOT EXISTS person (
	id INTEGER PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	age INTEGER
);
-- DROP TABLE pet;
CREATE TABLE IF NOT EXISTS pet (
	id INTEGER PRIMARY KEY,
	name TEXT,
	breed TEXT,
	age  INTEGER,
	dead INTEGER
);
-- DROP TABLE person_pet;
CREATE TABLE IF NOT EXISTS person_pet (
	person_id INTEGER,
	pet_id INTEGER
);
-- DROP TABLE car;
CREATE TABLE IF NOT EXISTS car (
	id INTEGER PRIMARY KEY,
	name TEXT,
	mark TEXT,
	year INTEGER
);

CREATE TABLE IF NOT EXISTS person_car (
	person_id INTEGER, 
	car_id INTEGER
);

INSERT INTO person (id, first_name, last_name, age)
    VALUES (0, "Zed", "Shaw", 37);
INSERT INTO person VALUES (1, "Anatoly", "Teseyko", 24);

INSERT INTO pet (id, name, breed, age, dead)
    VALUES (0, "Fluffy", "Unicorn", 1000, 0);

INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 1);
INSERT INTO pet VALUES (2, "Big Black", "Dog", 50, 100);

INSERT INTO car VALUES (0, "Coupe GT", "Audi", 1984);
INSERT INTO car VALUES (1, "M5", "BMW", 1994); 

INSERT INTO person_pet VALUES (0, 0);
INSERT INTO person_pet VALUES (0, 1);
INSERT INTO person_pet VALUES (1, 0);
INSERT INTO person_pet VALUES (1, 1);
INSERT INTO person_pet VALUES (1, 2);

INSERT INTO person_car VALUES (0, 1);
INSERT INTO person_car VALUES (1, 0);

INSERT INTO person_car VALUES (0, 1);
INSERT INTO person_car VALUES (1, 0);

SELECT * FROM person;
SELECT name, age FROM pet;
SELECT name, age FROM pet WHERE dead = 0;
SELECT * FROM person WHERE first_name != "Zed";
SELECT * FROM pet WHERE age > 10;
SELECT * FROM person WHERE first_name = "Anatoly" AND age > 20;
SELECT name, age FROM pet WHERE dead = 1;
DELETE FROM pet WHERE dead = 1;
SELECT * FROM pet;
INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 0);
SELECT * FROM pet;

SELECT DISTINCT pet.id, pet.name, pet.age, pet.dead
    FROM pet, person_pet, person
    WHERE
    pet.id = person_pet.pet_id AND
    person_pet.person_id = person.id AND
    person.first_name = "Zed";

SELECT DISTINCT pet.id, pet.name
    FROM pet, person_pet, person
    WHERE
    pet.id = person_pet.pet_id AND
    person_pet.person_id = person.id AND
    person.id = 0;