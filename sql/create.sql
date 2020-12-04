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
    id_products bigint unsigned                not null,
    active      tinyint unsigned default (1),
    created_at  datetime,
    updated_at  datetime
) engine = InnoDB;

create table if not exists categories_translations
(
    id            bigint unsigned auto_increment not null primary key,
    id_categories bigint unsigned                not null,
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
    active     tinyint unsigned default (1),
    rating     int,
    count      int,
    price      varchar(255),
    created_at datetime,
    updated_at datetime
) engine = InnoDB;

create table if not exists carts
(
    id          bigint unsigned auto_increment not null primary key,
    users_id    bigint unsigned                not null,
    products_id bigint unsigned                not null,
    count       Int,
    id_users    Int,
    created_at  datetime,
    updated_at  datetime
) engine = InnoDB;

create table if not exists product_translations
(
    id                 bigint unsigned auto_increment not null primary key,
    id_products                              bigint unsigned                not null,
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
    id_categories bigint unsigned not null,
    id_products           bigint unsigned not null
) engine = InnoDB;

create table if not exists carts_products
(
    id_products bigint unsigned not null,
    id_carts    bigint unsigned not null
) engine = InnoDB;

alter table categories_translations
    add constraint categories_translations_categories_FK foreign key (id_categories) REFERENCES categories (id);

alter table product_translations
    add constraint product_translations_products_FK foreign key (id_products) references products (id);

alter table carts
    add constraint carts_users_FK foreign key (users_id) references users (id);

alter table products_categories
    add constraint products_categories_PK primary key (id_products, id_categories),
    add constraint products_product_categories_product_categories_FK foreign key (id_categories) references categories (id),
    add constraint products_product_categories_products0_FK foreign key (id_products) references products (id);

alter table carts_products
    add constraint carts_products_PK primary key (id_products, id_carts),
    add constraint carts_products_products_FK foreign key (id_products) references products (id),
    add constraint carts_products_carts0_FK foreign key (id_carts) references carts (id);