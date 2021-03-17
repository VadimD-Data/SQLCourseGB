SELECT
f.id,
`from` AS fr,
`to` AS t,
if(`from`=label, `name`, ''),
if(`to`=label, `name`,''),
label,
`name`

FROM flights f
JOIN cities c ON `from` = c.label OR `to` = c.label

ORDER BY id;