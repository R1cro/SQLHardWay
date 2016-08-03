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
  card_id INTEGER,
  FOREIGN KEY (card_id) REFERENCES card(id)
);

DROP TABLE IF EXISTS client_pet;
CREATE TABLE client_pet (
  client_id INTEGER,
  pet_id INTEGER,
  FOREIGN KEY (client_id) REFERENCES client(id),
  FOREIGN KEY (pet_id) REFERENCES pet(id)
);

DROP TABLE IF EXISTS card;
CREATE TABLE card (
  id INTEGER PRIMARY KEY,
  disease TEXT,
  treatment TEXT
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  position TEXT
);

DROP TABLE IF EXISTS doctor;
CREATE TABLE doctor (
  id INTEGER PRIMARY KEY,
  employee_id INTEGER,
  class TEXT,
  FOREIGN KEY (employee_id) REFERENCES employee(id)
);

DROP TABLE IF EXISTS pet_doctor;
CREATE TABLE pet_doctor (
  pet_id INTEGER,
  doctor_id INTEGER,
  FOREIGN KEY (pet_id) REFERENCES pet(id),
  FOREIGN KEY (doctor_id) REFERENCES doctor(id)
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

INSERT INTO doctor VALUES (1, 1, "1st class");
INSERT INTO doctor VALUES (2, 2, "2nd class");
INSERT INTO doctor VALUES (3, 4, "2nd class");

INSERT INTO pet_doctor VALUES(1, 1);
INSERT INTO pet_doctor VALUES(1, 2);
INSERT INTO pet_doctor VALUES(1, 3);
INSERT INTO pet_doctor VALUES(2, 1);
INSERT INTO pet_doctor VALUES(2, 3);
INSERT INTO pet_doctor VALUES(3, 3);

INSERT INTO employee VALUES (1, "John", "Ulrich", "Doctor" );
INSERT INTO employee VALUES (2, "Mike", "Crow", "Doctor");
INSERT INTO employee VALUES (3, "Jessie", "James", "Medic");
INSERT INTO employee VALUES (4, "Poke", "Pokemon", "Doctor");

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
       employee.first_name, 
       employee.position,
       doctor.class
FROM doctor
INNER JOIN employee ON doctor.employee_id = employee.id;

SELECT doctor.class, 
       COUNT(doctor.class) AS "Count"
FROM employee
INNER JOIN doctor ON doctor.employee_id = employee.id
GROUP BY doctor.class;

SELECT employee.id, 
       employee.first_name
FROM employee, doctor
WHERE doctor.employee_id = employee.id AND
      employee.position = "Doctor";

SELECT pet.id, 
       pet.name AS "Pet name", 
       COUNT(pet.id) AS "Have doctors"
FROM pet
INNER JOIN pet_doctor ON pet.id = pet_doctor.pet_id
GROUP BY pet.id
HAVING COUNT(pet.id) >= 1;

SELECT doctor.id, 
       employee.first_name AS "Doctor", 
       COUNT(doctor.id) AS "Have pets"
FROM employee 
INNER JOIN doctor ON employee.id = doctor.employee_id
INNER JOIN pet_doctor ON doctor.id = pet_doctor.doctor_id
GROUP BY doctor.id
HAVING COUNT(doctor.id) >= 1;











