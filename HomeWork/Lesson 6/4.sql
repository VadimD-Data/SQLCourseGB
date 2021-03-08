SELECT 
(SELECT COUNT(from_user_id)  FROM `likes`  WHERE from_user_id IN (SELECT user_id FROM `profile` WHERE gender LIKE 'm')) AS MAN,
(SELECT COUNT(from_user_id)  FROM `likes` WHERE from_user_id IN (SELECT user_id FROM `profile` WHERE gender LIKE 'f')) AS WOMAN;


