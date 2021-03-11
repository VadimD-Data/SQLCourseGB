SELECT
user_id,
(SELECT COUNT(from_user_id) FROM friend_request WHERE from_user_id = user_id) AS friend_request,
(SELECT COUNT(from_user_id) FROM vk.likes WHERE from_user_id = user_id) AS likes,
(SELECT COUNT(from_user_id) FROM vk.media WHERE from_user_id = user_id) AS media,
(SELECT COUNT(from_user_id) FROM message WHERE from_user_id = user_id) AS message,
(SELECT COUNT(from_user_id) FROM vk.post WHERE from_user_id = user_id) AS post,
(SELECT SUM(friend_request+media+message+post))AS sum
FROM `profile`
GROUP BY user_id
ORDER BY sum 
LIMIT 10;

-- Я правда очень долго сидел и думал как тут заменить изначальный GROUP BY в подзапросах. 
-- В итоге пришёл к тому что лучше использовать WHERE, спустя часа 3 а может и больше(это сообщение я пишу в 3:39 ночи)
-- В итоге даже пришлось поменять название колонок в media и post из изначальных user_id в from_user_id иначе возникал конфликт(без ошибки просто не правильный вывод)
-- пожалуй изменение таблиц это самое лёгкое что я сегодня сделал. 
-- Спасибо!(я даже пару раз начинал писать вам в телеграме, но стирал и решил сделать через "немогу". В итоге на часах 3:42 и я иду спать.)
-- Спокойной Ночи!
 