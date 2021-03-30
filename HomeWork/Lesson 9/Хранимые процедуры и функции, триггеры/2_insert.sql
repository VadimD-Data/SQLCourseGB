DELIMITER //
CREATE TRIGGER check_product_name_insert BEFORE INSERT ON product
FOR EACH ROW
BEGIN
	DECLARE p_name VARCHAR(255);
    SET p_name = 'Тех.Ошибка'  ;
    SET NEW.name = COALESCE(NEW.name,p_name);
END//
DELIMITER ;

-- В таблице product тригер применён только к name в случае INSERT. 