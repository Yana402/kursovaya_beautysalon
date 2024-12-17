\c beauty_salon_database;

INSERT INTO users (phone, first_name, last_name, email)
VALUES
    ('375441234567', 'Anton', 'Antonov', 'anton@mail.ru'),
    ('375293311331', 'Alexey', 'Alexeev', 'lesha@gmail.com'),
    ('375447777777', 'Big', 'Smoke', 'grovestreetforever@hotmail.us'),
    ('375336677889', 'Danila', 'Danilov', 'krutoyperec@gmail.com'),
    ('375152233445', 'Trol', 'Trolev', 'anonim@anonim.ru'),
    ('375257654321', 'Admin', 'Adminushka', 'admin@beautyshop.com');


INSERT INTO user_credentials (phone, password, role, active)
VALUES
    ('375441234567', '$2a$10$Hb/cqHNmN60ed02PrCv1yuRQiVTVxiVj5qVdGxgTQVJ/sDdWLr6w6', 'CUSTOMER', true),
    ('375293311331', '$2a$10$2jfftyn3FNUILpDST1Wp6.R4eq9wKS5LKWzUG12qYdZMP7vObzv8m', 'CUSTOMER', true),
    ('375447777777', '$2a$10$zjyZt0c1HLQQhFtxIuEu7u0uUubGy2xCKw6gUcJzJ3GDmKb7MDjJy', 'CUSTOMER', true),
    ('375336677889', '$2a$10$co6ooEu1IDoV6Pato7zJKuEZKLIQ8Y0NwJQakqtrAxkcCPvr1pz5O', 'CUSTOMER', true),
    ('375152233445', '$2a$10$b54F7mkpXW.YBYi6wbBaveNnU3YRmfnfnTvBR4smQcO2IwBgpKbQO', 'CUSTOMER', false),
    ('375257654321', '$2a$10$co6ooEu1IDoV6Pato7zJKuEZKLIQ8Y0NwJQakqtrAxkcCPvr1pz5O', 'ADMIN', true);

INSERT INTO categories (id, name)
VALUES
    (1, 'Mens haircut'),
    (2, 'Womens haircut'),
    (3, 'Childrens haircut');

ALTER SEQUENCE categories_id_seq RESTART WITH 4;

INSERT INTO products (id, name, price, image_url, description, category_id)
VALUES
    (1, 'War and jazz', 20, 'https://firmbarbershop.com/wp-content/uploads/2019/11/FIRM-LB-Pers04-5890.jpg', 'asd', 1),
    (2, 'Caesar', 10, 'https://firmbarbershop.com/wp-content/uploads/2019/11/7ceaser-1024x819.jpg', 'asd', 1),
    (3, 'Cascade', 30, 'https://firmbarbershop.com/wp-content/uploads/2019/05/7kaskad.jpg', 'asd', 1),
    (4, 'Bob cut', 40, 'https://s16.stc.all.kpcdn.net/woman/wp-content/uploads/2023/10/strizhka-kare-1.jpg', 'asd', 2),
    (5, 'Pixie', 60, 'https://s5.stc.all.kpcdn.net/woman/wp-content/uploads/2023/07/img_1552.jpg', 'asd', 2);

ALTER SEQUENCE products_id_seq RESTART WITH 6;

INSERT INTO carts (id, user_phone, updated_at)
VALUES
    ('375441234567', '375441234567', NOW() - INTERVAL '7 days'),
    ('375293311331', '375293311331', NOW() - INTERVAL '1 day'),
    ('375447777777', '375447777777', NOW());

INSERT INTO cart_items (id, cart_id, product_id, quantity)
VALUES
    (1, '375441234567', '1', 2),
    (2, '375441234567', '2', 2),
    (3, '375441234567', '3', 2),
    (4, '375441234567', '4', 2),
    (5, '375293311331', '5', 1);

ALTER SEQUENCE cart_items_id_seq RESTART WITH 6;

INSERT INTO orders (id, user_phone,  status, created_at, completed_at)
VALUES
    (1, '375447777777', 'WAITING', NOW() - INTERVAL '5 days 20 minutes', NOW() - INTERVAL '5 days'),
    (2, '375293311331', 'WAITING', NOW() - INTERVAL '1 day', NOW() - INTERVAL '1 day'),
    (3, '375441234567', 'WAITING', NOW() - INTERVAL '1 hour', NULL),
    (4, '375336677889', 'WAITING', NOW(), NULL);

ALTER SEQUENCE orders_id_seq RESTART WITH 5;