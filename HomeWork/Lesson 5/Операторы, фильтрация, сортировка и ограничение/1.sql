

UPDATE 
	`user` 
SET 
	created_at = NOW(),
    updated_at = NOW()
WHERE 
	created_at IS NOT NULL;

SELECT * FROM `user` ;