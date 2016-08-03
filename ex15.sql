DROP TABLE IF EXISTS client;
CREATE TABLE client (
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
);

DROP TABLE IF EXISTS pet;
CREATE TABLE pet (
  id INTEGER PRIMARY KEY,
  name TEXT,
  category TEXT,
  card_id INTEGER
);

DROP TABLE IF EXISTS client_pet;
CREATE TABLE client_pet (
	client_id INTEGER,
	pet_id INTEGER
);

DROP TABLE IF EXISTS card;
CREATE TABLE card (
	id INTEGER PRIMARY KEY,
	disease TEXT,
	treatment TEXT
);

DROP TABLE IF EXISTS doctor;
CREATE TABLE doctor (
	id INTEGER PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	employee_id INTEGER,
	card_id INTEGER
);

DROP TABLE IF EXISTS pet_doctor;
CREATE TABLE pet_doctor (
	pet_id INTEGER,
	doctor_id INTEGER
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	id INTEGER PRIMARY KEY,
	position TEXT
);

INSERT INTO client VALUES (1, "Andrew", "Joy");
INSERT INTO client VALUES (2, "Alex", "Mayson");
INSERT INTO client VALUES (3, "Kira", "Roach");
INSERT INTO client VALUES (4, "Misty", "Loo");

INSERT INTO pet VALUES (1, "Pooooo", "Dog", 1);
INSERT INTO pet VALUES (2, "PiewDiePie", "Dog", 2);
INSERT INTO pet VALUES (3, "Kira's cat", "Cat", 3);
INSERT INTO pet VALUES (4, "Pokemon", "Pokemon", 4);

INSERT INTO client_pet VALUES (1, 1);
INSERT INTO client_pet VALUES (2, 2);
INSERT INTO client_pet VALUES (3, 3);
INSERT INTO client_pet VALUES (4, 4);
INSERT INTO client_pet VALUES (4, 1);

INSERT INTO card VALUES (1, "VERY BIG POOOOOOO!", "Cut 'O'.");
INSERT INTO card VALUES (2, "Youtuber", "IDK.");
INSERT INTO card VALUES (3, "IDK", "No treatment.");
INSERT INTO card VALUES (4, "Nintendo", "No treatment.");

INSERT INTO doctor VALUES (1, "John", "Ulrich", 1, 3);
INSERT INTO doctor VALUES (2, "Mike", "Carrow", 1, 2);
INSERT INTO doctor VALUES (3, "Jessie", "James", 2, 4);
INSERT INTO doctor VALUES (4, "Dr.Poke", "Pokemon", 3, 1);

INSERT INTO pet_doctor VALUES(1, 1);
INSERT INTO pet_doctor VALUES(1, 2);
INSERT INTO pet_doctor VALUES(1, 3);
INSERT INTO pet_doctor VALUES(2, 1);
INSERT INTO pet_doctor VALUES(2, 3);
INSERT INTO pet_doctor VALUES(3, 3);

INSERT INTO employee VALUES (1, "1st class doctor");
INSERT INTO employee VALUES (2, "2nd class doctor");
INSERT INTO employee VALUES (3, "3rd class doctor");

SELECT client.id, client.first_name, COUNT(client.id)
	FROM client, pet, client_pet
	WHERE client.id = client_pet.client_id AND 
				pet.id = client_pet.pet_id
	GROUP BY client.id
	HAVING COUNT(client.id) = 1;

SELECT client.id, client.first_name, COUNT(client.id)
	FROM client
	INNER JOIN client_pet ON client.id = client_pet.client_id
	GROUP BY client.id
	HAVING COUNT(client.id) > 1;

SELECT doctor.id, 
			 doctor.employee_id, 
			 doctor.first_name, 
			 employee.position
	FROM doctor
	INNER JOIN employee ON doctor.employee_id = employee.id;

	SELECT employee.position, 
				 COUNT(employee.position) AS "Count"
		FROM doctor
		INNER JOIN employee ON doctor.employee_id = employee.id
		GROUP BY employee.position;

	SELECT doctor.id, doctor.first_name
		FROM doctor, employee
		WHERE doctor.employee_id = employee.id AND
					employee.position = "1st class doctor";
		-- employee.id = 1;

	SELECT client.first_name AS "Client name", 
				 pet.category AS "Animal",
				 pet.name AS "Pet name", 
				 card.id AS "Card code",
				 doctor.first_name AS "Doctor",
				 employee.position 
		FROM client, pet, client_pet, doctor, employee, card
		WHERE client.id = client_pet.client_id AND
					pet.id = client_pet.pet_id AND
					pet.card_id = card.id AND
					doctor.card_id = card.id AND
					doctor.employee_id = employee.id;

	SELECT pet.id, 
				 pet.name AS "Pet name", 
				 COUNT(pet.id) AS "Have doctors"
		FROM pet
		INNER JOIN pet_doctor ON pet.id = pet_doctor.pet_id
		GROUP BY pet.id
		HAVING COUNT(pet.id) >= 1;

	SELECT doctor.id, 
				 doctor.first_name AS "Doctor", 
				 COUNT(doctor.id) AS "Have pets"
		FROM doctor
		INNER JOIN pet_doctor ON doctor.id = pet_doctor.doctor_id
		GROUP BY doctor.id
		HAVING COUNT(doctor.id) >= 1;






















