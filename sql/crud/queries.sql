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

with query as (
    select p.id as product_id,
           min(cp.count) as cart_product_count,
           group_concat(ct.name) as category_name,
           min(p.price) as product_price,
           min(p.price) * min(cp.count) as total_per_product
    from users
             inner join carts as c on users.id = c.id_user
             inner join carts_products as cp on c.id = cp.id_cart
             inner join products as p on cp.id_product = p.id
             inner join products_categories as pc on p.id = pc.id_product
             inner join categories_translations as ct on pc.id_category = ct.id_category and ct.locale = 'fr'
    where users.id = 1
    group by p.id
)
select '' as product_id,
       concat('total : ', sum(query.cart_product_count)) as cart_product_count,
       '' as category_name,
       '' as product_price,
       concat('total : ', sum(query.total_per_product)) as product_price,
       '' as total_per_product
from query
union select query.*, pt.name from query
inner join product_translations as pt on query.product_id = pt.id_product and pt.locale = 'fr';

-- Change 'group by' possible error
select @@sql_mode;

set global sql_mode = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION,ONLY_FULL_GROUP_BY'