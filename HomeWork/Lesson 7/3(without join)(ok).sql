SELECT DISTINCT
f.id,
CASE 
 WHEN `from` = 'moscow' THEN 'Москва'
 WHEN `from` = 'novgorod' THEN 'Новгород'
 WHEN `from` = 'irkutsk' THEN 'Иркутск'
 WHEN `from` = 'omsk' THEN 'Омск'
END `From`,
CASE 
 WHEN `to` = 'moscow' THEN 'Москва'
 WHEN `to` = 'novgorod' THEN 'Новгород'
 WHEN `to` = 'irkutsk' THEN 'Иркутск'
 WHEN `to` = 'omsk' THEN 'Омск'
 WHEN `to` = 'kazan' THEN 'Казань'
END `To`

FROM flights f



ORDER BY id;