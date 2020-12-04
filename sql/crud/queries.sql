use cours;

select users.username, users.email
from users
where id = 2;

update users
set username = 'Helixarrrrr'
where id = 3;

delete
from users
where id = 4;

select users.username, product_translations.name
from carts
         inner join users on carts.users_id = users.id
         inner join products on carts.products_id = products.id
         inner join product_translations on products.id = product_translations.id_products and product_translations.locale = 'en'
where carts.users_id = 2;