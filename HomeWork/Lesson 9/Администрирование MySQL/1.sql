CREATE USER `shop_read`;
CREATE USER `shop`;

GRANT SELECT ON *.* TO shop_read;
GRANT ALL  ON *.* TO shop;
GRANT GRANT OPTION  ON *.* TO shop;
