SELECT 
p.id AS catalog_id,
`name` AS product_name,
p.catalog_id,
`type` AS type_name 

FROM product p
JOIN catalog c ON p.catalog_id=c.id

ORDER BY p.catalog_id;