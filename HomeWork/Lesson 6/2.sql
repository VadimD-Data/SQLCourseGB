SELECT 	from_user_id, 
		to_user_id, 
		COUNT(from_user_id=2) 		AS recieved ,
		COUNT(to_user_id=2)   		AS sent  ,
		(SELECT SUM(
					COUNT(from_user_id=2)
                    +
					COUNT(to_user_id=2)                 
					)) AS sum
FROM 		message 
WHERE 		from_user_id= 2 OR to_user_id= 2 
GROUP BY	from_user_id, to_user_id 
ORDER BY 	sum DESC  ;

-- Хотел как то объеденить две колонки (полученные и отправленные) 
-- но не дошёл до того как её реализовать(без ошибки)(тогда можно было бы сортировку по ней сделать и быть более точным)
-- Самое интересное что в 5 задании я как то умудрился эту сумму сделать но возвращаясь сюда ничего не выходит(
-- Прошло пол часа и сейчас уже 4:18. Я реализовал сумму. Я дурак. Спокойной ночи! 