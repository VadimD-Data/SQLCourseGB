CREATE DEFINER=`root`@`localhost` PROCEDURE `hello`()
BEGIN
SELECT 
CURTIME() AS time,
if(HOUR(now()) < 6,'Доброй ночи',
if(HOUR(now()) < 11,'Доброе утро',
if(HOUR(now()) < 17,'Добрый день',
if(HOUR(now()) < 23,'Доброй ночи','ошибка')))) AS greeting ;
END