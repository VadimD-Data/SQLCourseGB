-- START TRANSACTION;

/*
SELECT 
id,
created_at

FROM `user`

ORDER BY created_at --DESC -- (для отображения нужных данных вначале)
-- тут я выполняю поиск по всем данным таблицы и фильтрую по значению created_at так я узнаю что всего данных 200 и нужные мне отфильтрованны в конце списка(5 штук)
*/
DELETE 
FROM `user`
WHERE id != 0
ORDER BY created_at
LIMIT 195
-- Код Рабочий  !!!! УРАА 

/*
SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;
SHOW VARIABLES LIKE 'FOREIGN_KEY_CHECKS'
-- Исправление ошибки внешнего ключа(Отключение и включение)
*/
-- COMMIT  -- Фиксация	
-- ROLLBACK -- Откат