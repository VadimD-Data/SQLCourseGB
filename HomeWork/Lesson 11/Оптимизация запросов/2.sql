DELIMITER //
DROP PROCEDURE insert_user//
CREATE PROCEDURE insert_user(IN million INT)
BEGIN
DECLARE email INT DEFAULT 1;
DECLARE phone INT DEFAULT 1;
DECLARE phash INT DEFAULT 1;
DECLARE count INT DEFAULT 0;
WHILE (count != million)
do
INSERT INTO user VALUES (DEFAULT, email,phone,phash,now(),NULL,NULL);
SET email = email + 1;
SET phone = phone + 1;
SET phash = phash + 1;
SET count = count +1;
END  WHILE ;
END //
DELIMITER ;

-- Создал процедуру в которую можно поместить количество и она вставит данные