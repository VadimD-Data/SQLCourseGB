CREATE DEFINER=`root`@`localhost` TRIGGER `likes_BEFORE_INSERT` BEFORE INSERT ON `likes` FOR EACH ROW BEGIN
	DECLARE a INT DEFAULT 1;
    IF 
    NEW.to_user_id IS NOT NULL THEN SET a = a + 1;
	END IF;
    
	IF 
    NEW.to_post_id IS NOT NULL THEN SET a = a + 1;
	END IF;
    
	IF 
    NEW.to_media_id IS NOT NULL THEN SET a = a + 1;
	END IF;
    
	IF a > 2 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Custom error';
    END IF;
END