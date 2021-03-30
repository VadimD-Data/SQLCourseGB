SELECT 
id,
created_at,
if(created_at LIKE '2018-08-01%' OR created_at LIKE '2018-08-04%' OR created_at LIKE '2018-08-16%' OR created_at LIKE '2018-08-17%',1,0) AS ok
-- if(created_at IN ('2018-08-01%','2018-08-04%','2018-08-16%','2018-08-17%'),1,0) AS NOT_WORK -- Не рабочай вариант (глубокий вздох)

FROM vk.user

WHERE created_at LIKE '%-08-%'

ORDER BY ok DESC

-- Вывод происходит из всех лет с месяцем августа