DROP TABLE IF EXISTS archive;
CREATE TABLE `vk`.`archive` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`id`))
ENGINE = ARCHIVE;

DROP TRIGGER IF EXISTS user_to_archive;
CREATE TRIGGER user_to_archive AFTER INSERT ON user
FOR EACH ROW 
INSERT INTO archive
SET `name`=
(
	SELECT email
    FROM user 
    ORDER BY id DESC
    LIMIT 1    
),
table_name = 'user';

DROP TRIGGER IF EXISTS catalog_to_archive;
CREATE TRIGGER catalog_to_archive AFTER INSERT ON catalog
FOR EACH ROW 
INSERT INTO archive
SET `name`=
(
    SELECT type
    FROM catalog
	ORDER BY id DESC
    LIMIT 1    
),
table_name = 'catalog';

DROP TRIGGER IF EXISTS product_to_archive;
CREATE TRIGGER product_to_archive AFTER INSERT ON product
FOR EACH ROW 
INSERT INTO archive
SET `name`=
(
    SELECT name
    FROM product 
	ORDER BY id DESC
    LIMIT 1    
),
table_name = 'product';

-- я правда хотел не лимитировать лишний раз и вместо ORDER BY id DESC LIMIT 1  написать WHERE id = last_insert_id() но по непонятной мне причине эта функция НЕ работала и пришлось найти другое решение