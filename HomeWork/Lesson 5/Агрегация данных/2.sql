SELECT DAYOFWEEK(created_at) AS birthday, COUNT(DAYOFWEEK(created_at)) AS COUNT FROM `user` GROUP BY birthday ORDER BY birthday;


-- Если быть честным я сомниваюсь что правильно понял задание. Код должен посчитать количество дней рождения пользователей и вывести их на экран(на каждый день из недели из всех годов и месяцев)