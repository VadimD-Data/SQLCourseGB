SELECT 
if(uc.community_id IS NOT NULL,uc.community_id,'NO GROUP') AS group_id,
group_concat(DISTINCT p.user_id SEPARATOR ',') AS members,
AVG(YEAR(now()) - YEAR(p.birthday)) AS 'average age of group members'

FROM profile p 
LEFT JOIN user_community uc ON uc.user_id = p.user_id

WHERE p.gender = 'f' -- Ограничения гендера
GROUP BY uc.community_id
ORDER BY uc.community_id
-- Очень странный запрос и не рабочий. Я над ним сидел около 2 часов. в итоге психанул и перезалил новую базу с данными ибо думал что ошибки были из за рассинхрона старых данных между таблицами
-- Перезалил и новые данные работают так же... теряются строки при группировке по uc.community_id и теряется много строк. (из 400 (+ те что без группы) доходит только 95) А как исправить вообще не понимаю. 
-- Иимеется догадка что это из за рассинхрона в таблицах(проверил и да проблема именно там... Данные таблицы profile не совпадают (точнее просто отсутствуют) в сравнении с user_community)
-- Запрос должен выдавать id группы, id их участников (в конкатинации) и их срелний возраст. Всё ограниченно гендером
-- и он бы работал если бы не корявые данные( больше 2 часов на смарку ...
