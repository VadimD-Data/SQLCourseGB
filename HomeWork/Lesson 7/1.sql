SELECT 
u.id AS `id_client`,
product_name AS product
FROM `user` u
JOIN orders o ON u.id = o.user_id;

