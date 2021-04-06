CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `user_popular` AS
    SELECT 
        `profile`.`user_id` AS `user_id`,
        (SELECT 
                COUNT(`friend_request`.`to_user_id`)
            FROM
                `friend_request`
            WHERE
                (`friend_request`.`to_user_id` = `profile`.`user_id`)) AS `friend_request`,
        (SELECT 
                COUNT(`likes`.`to_user_id`)
            FROM
                `likes`
            WHERE
                ((`likes`.`to_user_id` = `profile`.`user_id`)
                    AND (`likes`.`to_user_id` IS NOT NULL))) AS `likes`,
        (SELECT 
                COUNT(`m`.`from_user_id`)
            FROM
                (`likes` `l`
                JOIN `media` `m` ON ((`l`.`id` = `m`.`from_user_id`)))
            WHERE
                ((`l`.`to_media_id` IS NOT NULL)
                    AND (`m`.`from_user_id` = `profile`.`user_id`))
            GROUP BY `m`.`from_user_id`) AS `media`,
        (SELECT 
                COUNT(`message`.`to_user_id`)
            FROM
                `message`
            WHERE
                (`message`.`to_user_id` = `profile`.`user_id`)) AS `message`,
        (SELECT SUM(((`friend_request` + `media`) + `message`))) AS `sum`
    FROM
        `profile`
    GROUP BY `profile`.`user_id`
    ORDER BY `sum` DESC
    LIMIT 10