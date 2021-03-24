SELECT
f.id,
if(`from`=c.label, c.name, `from`),
if(`to`=c1.label, c1.name,`to`)

FROM flights f
JOIN cities c ON `from` = c.label 
JOIN cities c1 ON `to` = c1.label

ORDER BY id

