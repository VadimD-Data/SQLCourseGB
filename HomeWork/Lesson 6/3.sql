SELECT  to_user_id,COUNT(to_user_id) AS `likes` 
FROM `likes` 
WHERE to_user_id IN (SELECT * FROM(SELECT user_id FROM `profile` ORDER BY birthday DESC LIMIT 10) AS t) 
GROUP BY to_user_id  
ORDER BY `likes` DESC ;

