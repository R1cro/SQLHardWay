UPDATE person SET first_name = "Zed"
    WHERE first_name = "Unknown guy";

-- UPDATE pet SET name = "Fancy Pants"
--     WHERE id=0;

-- UPDATE person SET first_name = "Zed"
--     WHERE id = 0;

-- UPDATE pet SET name = "DEADCEASED :("
--     WHERE pet.dead = 1;    
UPDATE person SET first_name = "Unknown guy" WHERE first_name IN (
	SELECT first_name 
	FROM person
	WHERE first_name = "Zed"
);