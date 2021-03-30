CREATE VIEW select_name AS 

SELECT 
p.id,
p.name AS product_name,
c.type AS `catalog_name`

FROM product p
JOIN catalog c ON p.catalog_id = c.id
