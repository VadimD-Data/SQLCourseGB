CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `user_active` AS
    SELECT 
        `profile`.`user_id` AS `user_id`,
        (SELECT 
                COUNT(`friend_request`.`from_user_id`)
            FROM
                `friend_request`
            WHERE
                (`friend_request`.`from_user_id` = `profile`.`user_id`)) AS `friend_request`,
        (SELECT 
                COUNT(`likes`.`from_user_id`)
            FROM
                `likes`
            WHERE
                (`likes`.`from_user_id` = `profile`.`user_id`)) AS `likes`,
        (SELECT 
                COUNT(`media`.`from_user_id`)
            FROM
                `media`
            WHERE
                (`media`.`from_user_id` = `profile`.`user_id`)) AS `media`,
        (SELECT 
                COUNT(`message`.`from_user_id`)
            FROM
                `message`
            WHERE
                (`message`.`from_user_id` = `profile`.`user_id`)) AS `message`,
        (SELECT 
                COUNT(`post`.`from_user_id`)
            FROM
                `post`
            WHERE
                (`post`.`from_user_id` = `profile`.`user_id`)) AS `post`,
        (SELECT SUM((((`friend_request` + `media`) + `message`) + `post`))) AS `sum`
    FROM
        `profile`
    GROUP BY `profile`.`user_id`
    ORDER BY `sum` DESC
    LIMIT 10