-- UPDATE pet SET name = "Zed's Pet" WHERE id IN (
--     SELECT pet.id
--     FROM pet, person_pet, person
--     WHERE
--     person.id = person_pet.person_id AND
--     pet.id = person_pet.pet_id AND
--     person.first_name = "Zed"
-- );

UPDATE pet SET name = "Zed's DEAD Pet" Where id IN (
	SELECT pet.id 
	FROM pet, person_pet, person
	WHERE person.id = person_pet.person_id AND
	pet_id = person_pet.pet_id AND
	pet.dead = 1 AND
 	person.first_name = "Zed"
	);
