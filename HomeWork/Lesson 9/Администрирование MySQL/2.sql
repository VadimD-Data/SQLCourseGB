CREATE VIEW username AS

SELECT 
id,
name
FROM accounts;

CREATE USER `user_read`;
GRANT SELECT ON vk.username TO user_read;
