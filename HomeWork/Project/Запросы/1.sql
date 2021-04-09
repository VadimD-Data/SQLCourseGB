SELECT 
p.user_id,
CONCAT (p.firstname, ' ', p.lastname),
COUNT(l.from_user_id) AS likes_from_user ,
l.created_at

FROM profile p
LEFT JOIN likes l ON l.from_user_id = p.user_id

WHERE id != 0 -- просто чтобы добавить сюда WHERE (Улыбка)(Не придумал что ещё сюда засунуть, а без него не очень хотел)
GROUP BY p.user_id
HAVING l.created_at LIKE '2020%' -- Ограничение только этим годом 
-- AND likes_from_user > 0 -- Возможное ограничение по количеству лайков так как вместо нуля можно поставить любое число
ORDER BY p.user_id

-- Выборка данных по количеству лайков пользователя в 2020 году