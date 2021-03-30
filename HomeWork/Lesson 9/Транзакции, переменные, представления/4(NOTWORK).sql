-- START TRANSACTION;


DELETE 

FROM `user`

WHERE id != 0

ORDER BY created_at
LIMIT COUNT(created_at)-5 

-- Я пытался и искал как можно засунуть в LIMIT функции ... Искал точно пол часа по документации и в гугле... Не нашёл поэтому не получилось, а жаль

/*
SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;
SHOW VARIABLES LIKE 'FOREIGN_KEY_CHECKS'
-- Исправление ошибки внешнего ключа
*/
-- COMMIT  -- Фиксация	
-- ROLLBACK -- Откат