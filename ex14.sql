BEGIN;
DROP TABLE IF EXISTS person;
CREATE TABLE person (
	id INTEGER PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	age INTEGER
);

DROP TABLE IF EXISTS person_pet;
CREATE TABLE person_pet (
	person_id INTEGER,
	pet_id INTEGER
);

DROP TABLE IF EXISTS pet;
CREATE TABLE pet (
	id INTEGER PRIMARY KEY,
	name TEXT,
	breed TEXT,
	age INTEGER,
	dead INTEGER,
	dob DATETIME
);

ALTER TABLE person ADD COLUMN dead INTEGER;
ALTER TABLE person ADD COLUMN phone_number TEXT;
ALTER TABLE person ADD COLUMN salary FLOAT;
ALTER TABLE person ADD COLUMN dob DATETIME;

ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;

ALTER TABLE pet ADD COLUMN parent INTEGER;

INSERT INTO person VALUES (0, "Alex", "Richerdson", 29, 0, "13-333-222", "99999", "2013-10-07 08:23:19.120" );
INSERT INTO person VALUES (1, "XXX", "XXX", 37, 0, "13-444-333", "199000", "2014-11-27 18:33:12.120" );
INSERT INTO person VALUES (2, "Anatoly", "Teseyko", 24, 0, "017-338-69-69", "600", "2016-08-02 16:33:20.120" );
INSERT INTO person VALUES (3, "John", "Morph", 29, 0, "14-222-999", "11.111", "2011-11-12 18:11:19.120" );

INSERT INTO pet VALUES (0, "Pika", "Chu", 15, 0, "2016-08-01 00:00:00", 2);
INSERT INTO pet VALUES (1, "Windy", "The Dog", 5, 0, "2008-08-02 00:00:00" , 2);
INSERT INTO pet VALUES (2, "Ralef", "Cat", 3, 0, "2002-08-03 00:00:00" , 3);
INSERT INTO pet VALUES (3, "Yahoooch", "Fox", 7, 0, "2005-08-03 00:00:00" , 2);
INSERT INTO pet VALUES (4, "Poo", "Panda", 24, 0, "2003-08-04 00:00:00", 4);

INSERT INTO person_pet VALUES (0, 0, "2016-08-01 00:00:00");
INSERT INTO person_pet VALUES (0, 1, "2008-08-02 00:00:00");
INSERT INTO person_pet VALUES (1, 2, "2004-01-01 00:00:00");
INSERT INTO person_pet VALUES (2, 3, "2005-08-04 00:00:00");
INSERT INTO person_pet VALUES (3, 4, "2003-08-05 00:00:00");

UPDATE person SET phone_number = "029-338-69-68" WHERE last_name = "Teseyko";
UPDATE person SET first_name = "Zed is BACK!" WHERE id IN (
	SELECT person.id 
	FROM person
	WHERE age = 37
	);

SELECT DISTINCT pet.name, person.first_name
FROM pet, person, person_pet
WHERE person.id = person_pet.person_id AND 
			pet.id = person_pet.pet_id AND
			person_pet.purchased_on = "2004-01-01 00:00:00";

SELECT person.first_name, pet.name, pet.breed
FROM person, pet
WHERE person.id = pet.parent
AND pet.parent IN ( 
	SELECT pet.parent
  FROM pet
  GROUP BY pet.parent
  HAVING COUNT(pet.parent) > 1);

COMMIT;

