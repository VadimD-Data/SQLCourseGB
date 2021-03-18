SELECT
f.id,
`from` AS fr,
`to` AS t,

CASE
WHEN `from` = `label` THEN `name`
END `from`,

CASE 
WHEN `to` = `label` THEN `name`
END `to`


FROM flights f, cities c
JOIN cities c1 ON `from` = c1.label 
JOIN cities c2	ON  `to` = c2.label

ORDER BY id;