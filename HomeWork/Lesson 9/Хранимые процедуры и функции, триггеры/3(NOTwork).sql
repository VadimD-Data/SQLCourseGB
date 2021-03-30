CREATE DEFINER=`root`@`localhost` PROCEDURE `fib_num`(IN val INT)
BEGIN
DECLARE a INT;
DECLARE b INT;
DECLARE c INT;
SET a = 0;
SET b = 1;
SELECT a AS '1',b AS '2';
SET c = 3;
WHILE (val!=0) 
	DO
    SET a= a+b;
    SELECT a AS c;
    SET val = val-1;
    SET c = c +1;
    END WHILE;
END


--Я пытался, но нельзя засунуть IF в WHILE поэтому не понял как вообще можно это реализовать... код не рабочий