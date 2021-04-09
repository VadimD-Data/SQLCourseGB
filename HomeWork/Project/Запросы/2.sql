SELECT 
p.user_id,
CONCAT(p.firstname, ' ', p.lastname),
p.birthday,
p.gender,
c.name AS group_name,
c.created_at

FROM vk.profile p
JOIN community c ON p.user_id = c.admin_id

WHERE gender = 'm' -- Ограничение выдачи по гендерному признаку
GROUP BY p.user_id
HAVING YEAR(p.birthday) <= YEAR(now())-1 -- Тут можно ограничить возраст Администраторов группы путём изменения цифры (константы)
ORDER BY c.created_at
