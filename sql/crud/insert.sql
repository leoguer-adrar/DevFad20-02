use cours;

SET FOREIGN_KEY_CHECKS = 0;
truncate users;
truncate products;
truncate categories;
truncate products_categories;
truncate carts;
truncate categories_translations;
truncate product_translations;
SET FOREIGN_KEY_CHECKS = 1;

-- créer un utilisateur
insert into users (username, password, email, email_verification_token, verified_at, created_at, updated_at)
values ('Helixar', '1234', 'contact@cloudnode.fr', 'sdkjlkgjmslkg', now(), now(), now()),
       ('Helixar2', '1234', 'contact2@cloudnode.fr', 'sdkjlkgjmslkg', now(), now(), now()),
       ('Helixar3', '1234', 'contact3@cloudnode.fr', 'sdkjlkgjmslkg', now(), now(), now()),
       ('Helixar4', '1234', 'contact4@cloudnode.fr', 'sdkjlkgjmslkg', now(), now(), now());

insert into products (code, active, rating, count, price, created_at, updated_at)
values ('wood', 1, 5, 1250, '12', now(), now()),
       ('iron', 1, 3, 123, '40', now(), now()),
       ('wheat', 1, 4, 1250211, '2', now(), now()),
       ('plastic', 1, 5, 1250, '7', now(), now()),
       ('gold', 1, 5, 10, '12000', now(), now());

insert into categories (code, active, created_at, updated_at)
values ('metal', 1, now(), now()),
       ('other', 1, now(), now()),
       ('vegetable', 1, now(), now());

insert into products_categories (id_category, id_product)
values (2, 1),
       (1, 2),
       (2, 3),
       (2, 4),
       (3, 1),
       (3, 3),
       (1, 5);

insert into carts (id_user, created_at, updated_at)
values (1, now(), now()),
       (2, now(), now());

insert into carts_products (id_product, id_cart, `count`)
values (1, 1, 5),
       (3, 1, 10),
       (5, 1, 11),
       (2, 2, 7),
       (3, 2, 2);

insert into categories_translations (id_category, name, slug, description, meta, locale, created_at, updated_at)
values (1, 'Métal', 'metal', 'lorem ipsum', 'metal', 'fr', now(), now()),
       (3, 'Végétaux', 'vegetaux', 'lorem ipsum', 'vegetaux', 'fr', now(), now()),
       (2, 'Autre', 'autre', 'lorem ipsum', 'autre', 'fr', now(), now()),
       (1, 'Metal', 'metal', 'lorem ipsum', 'metal', 'en', now(), now()),
       (3, 'Vegetable', 'vegetable', 'lorem ipsum', 'vegetable', 'en', now(), now()),
       (2, 'Other', 'other', 'lorem ipsum', 'other', 'en', now(), now());

insert into product_translations (id_product, name, slug, description, meta, locale, created_at, updated_at)
values (1, 'Bois', 'bois', 'lorem ipsum', 'bois', 'fr', now(), now()),
       (1, 'Wood', 'wood', 'lorem ipsum', 'wood', 'en', now(), now()),
       (2, 'Fer', 'fer', 'lorem ipsum', 'fer', 'fr', now(), now()),
       (2, 'Iron', 'iron', 'lorem ipsum', 'iron', 'en', now(), now()),
       (3, 'Blé', 'ble', 'lorem ipsum', 'blé', 'fr', now(), now()),
       (3, 'Wheat', 'wheat', 'lorem ipsum', 'wheat', 'en', now(), now()),
       (4, 'Plastique', 'plastique', 'lorem ipsum', 'plastique', 'fr', now(), now()),
       (4, 'Plastic', 'plastic', 'lorem ipsum', 'plastic', 'en', now(), now()),
       (5, 'Or', 'or', 'lorem ipsum', 'or', 'fr', now(), now()),
       (5, 'Gold', 'gold', 'lorem ipsum', 'gold', 'en', now(), now());