-- DELETE FROM pet WHERE id IN (
-- 	SELECT pet.id
-- 	FROM pet, person_pet, person
-- 	WHERE person.id = person_pet.person_id AND
-- 	pet.id = person_pet.pet_id AND
-- 	person.first_name = "Zed"
-- );

-- DELETE FROM person_pet
--   WHERE pet_id NOT IN (
--     SELECT id FROM pet
-- 	);

-- INSERT INTO pet VALUES (3, "DreamCatcher", "Cat", 1, 1);
-- INSERT INTO person_pet VALUES (1,3);

-- DELETE FROM pet WHERE id IN (
-- 	SELECT pet.id
-- 	FROM pet, person_pet, person
-- 	WHERE person.id = person_pet.person_id AND
-- 	pet.id = person_pet.pet_id AND
-- 	person.last_name = "Teseyko" AND
-- 	pet.dead = 1);

DELETE FROM person_pet WHERE pet_id IN (
	SELECT pet_id 
	FROM pet, person_pet, person
	WHERE pet.id = person_pet.pet_id AND
	pet.dead = 1 AND
	person.last_name = "Teseyko"
);



