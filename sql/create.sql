use cours;

SET FOREIGN_KEY_CHECKS = 0;
drop table if exists users;
drop table if exists carts;
drop table if exists products;
drop table if exists categories;
drop table if exists carts_products;
drop table if exists carts_products;
drop table if exists products_categories;
drop table if exists categories_translations;
drop table if exists product_translations;
SET FOREIGN_KEY_CHECKS = 1;

#tables
create table if not exists users
(
    id                       bigint unsigned auto_increment not null primary key,
    username                 varchar(255) not null,
    password                 varchar(255) not null,
    email                    varchar(255) not null unique,
    email_verification_token varchar(255),
    verified_at              datetime,
    created_at               datetime,
    updated_at               datetime
) engine = InnoDB;

create table if not exists categories
(
    id          bigint unsigned auto_increment not null primary key,
    code       varchar(255),
    active      tinyint(1) unsigned default (1),
    created_at  datetime,
    updated_at  datetime
) engine = InnoDB;

create table if not exists categories_translations
(
    id            bigint unsigned auto_increment not null primary key,
    id_category bigint unsigned                not null,
    name          varchar(255),
    slug          varchar(255),
    description   longtext,
    meta          varchar(255),
    locale        varchar(255),
    created_at    datetime,
    updated_at    datetime
) engine = InnoDB;

create table if not exists products
(
    id         bigint unsigned auto_increment not null primary key,
    code       varchar(255),
    active     tinyint(1) unsigned default (1),
    rating     int,
    count      int,
    price      int,
    created_at datetime,
    updated_at datetime
) engine = InnoDB;

create table if not exists carts
(
    id          bigint unsigned auto_increment not null primary key,
    id_user    bigint unsigned                not null,
    created_at  datetime,
    updated_at  datetime
) engine = InnoDB;

create table if not exists product_translations
(
    id                 bigint unsigned auto_increment not null primary key,
    id_product                              bigint unsigned                not null,
    name                                     varchar(255),
    slug                                     varchar(255),
    description                              Longtext,
    meta                                     varchar(255),
    locale                                   varchar(255),
    created_at                               datetime,
    updated_at                               datetime
) engine = InnoDB;

create table if not exists products_categories
(
    id_category bigint unsigned not null,
    id_product           bigint unsigned not null
) engine = InnoDB;

create table if not exists carts_products
(
    id_product bigint unsigned not null,
    id_cart    bigint unsigned not null,
    count       Int
) engine = InnoDB;

alter table categories_translations
    add constraint categories_translations_categories_FK foreign key (id_category) REFERENCES categories (id) on delete cascade;

alter table product_translations
    add constraint product_translations_products_FK foreign key (id_product) references products (id) on delete cascade;

alter table carts
    add constraint carts_users_FK foreign key (id_user) references users (id) on delete cascade;

alter table products_categories
    add constraint products_categories_PK primary key (id_product, id_category),
    add constraint products_product_categories_product_categories_FK foreign key (id_category) references categories (id),
    add constraint products_product_categories_products0_FK foreign key (id_product) references products (id);

alter table carts_products
    add constraint carts_products_PK primary key (id_product, id_cart),
    add constraint carts_products_products_FK foreign key (id_product) references products (id),
    add constraint carts_products_carts0_FK foreign key (id_cart) references carts (id);