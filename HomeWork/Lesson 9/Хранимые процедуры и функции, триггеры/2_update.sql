DROP TRIGGER check_product_name_update;
DELIMITER //
CREATE TRIGGER check_product_name_update BEFORE UPDATE ON product
FOR EACH ROW
BEGIN
	DECLARE p_name VARCHAR(255);
    SET p_name = 'Тех.Ошибка'  ;
    SET NEW.name = COALESCE(NEW.name,OLD.name,p_name);
END//
DELIMITER ;

-- В таблице product тригер применён только к name в случае UPDATE. 