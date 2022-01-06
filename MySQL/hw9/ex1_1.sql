START TRANSACTION;
TRUNCATE sample.users;

INSERT INTO sample.users SELECT * FROM shop.users WHERE shop.users.id = 1;

SELECT * FROM sample.users;

COMMIT;