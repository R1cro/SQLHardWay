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


#sqlite> SELECT person.last_name, car.name FROM person INNER JOIN car ON person.last_name = "Teseyko";

