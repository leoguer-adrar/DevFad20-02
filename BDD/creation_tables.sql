CREATE DATABASE restaurant;
USE restaurant;
-- DROP DATABASE restaurant;

-- #######################################################
-- #########--      Tables
-- #####################################################

CREATE TABLE Dishes(
    id INT UNSIGNED auto_increment PRIMARY KEY NOT NULL,
   `name` VARCHAR(50),
    date_creation DATE,
    id_type INT 
)ENGINE=InnoDB;

CREATE TABLE Menus(
    id INT UNSIGNED auto_increment PRIMARY KEY NOT NULL,
    `name` VARCHAR(50),
    date_creation DATE
)ENGINE=InnoDB;

CREATE TABLE Administrateurs(
    id INT UNSIGNED auto_increment PRIMARY KEY NOT NULL,
    `name` VARCHAR(50),
    surname VARCHAR(50),
    email VARCHAR(50),
    `password` VARCHAR(50),
    date_creation DATE
)ENGINE=InnoDB;

CREATE TABLE Reservations(
    id INT UNSIGNED auto_increment PRIMARY KEY NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `surname` VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(50) NOT NULL,
    size TINYINT,
    date_reservation DATE NOT NULL,
    date_creation DATE NOT NULL
)ENGINE=InnoDB;

CREATE TABLE Types(
    id INT NOT NULL auto_increment PRIMARY KEY NOT NULL,
    `name` VARCHAR(50)
)ENGINE=InnoDB;

CREATE TABLE Drinks(
    id INT UNSIGNED auto_increment PRIMARY KEY NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    price VARCHAR(50)
)ENGINE=InnoDB;

CREATE TABLE Tables(
    id INT UNSIGNED auto_increment PRIMARY KEY NOT NULL,
    `name` VARCHAR(50),
    size TINYINT
)ENGINE=InnoDB;

CREATE TABLE Messages(
    id INT UNSIGNED auto_increment PRIMARY KEY NOT NULL,
    sender_name VARCHAR(50),
    sender_surname VARCHAR(50),
    sender_email VARCHAR(50),
    sender_phone VARCHAR(50),
    content TEXT,
    `state` TINYINT NOT NULL
)ENGINE=InnoDB;


-- #######################################################
-- #########--      Tables d'associations
-- #####################################################

CREATE TABLE Contenir(
    id_menu INT UNSIGNED NOT NULL,
    id_dish INT UNSIGNED NOT NULL
)ENGINE=InnoDB;

CREATE TABLE Creer(
    id_menu INT UNSIGNED NOT NULL,
    id_admin INT UNSIGNED NOT NULL
)ENGINE=InnoDB;

CREATE TABLE Gerer(
    id_table INT UNSIGNED NOT NULL,
    id_admin INT UNSIGNED NOT NULL
)ENGINE=InnoDB;

CREATE TABLE Lier(
    id_table INT UNSIGNED NOT NULL,
    id_reservation INT UNSIGNED NOT NULL
)ENGINE=InnoDB;

CREATE TABLE Valider(
    id_reservation INT UNSIGNED NOT NULL,
    id_admin INT UNSIGNED NOT NULL,
    `date`DATE
)ENGINE=InnoDB;


-- #######################################################
-- #########--      KEYS
-- #####################################################


ALTER TABLE Dishes
    ADD CONSTRAINT fk_dish_type FOREIGN KEY(id_type) REFERENCES Types(id);

ALTER TABLE Contenir 
    ADD CONSTRAINT fk_contenir_dish FOREIGN KEY(id_dish) REFERENCES Dishes(id),
    ADD CONSTRAINT fk_contenir_menu FOREIGN KEY(id_menu) REFERENCES Menus(id),
    ADD CONSTRAINT pk_contenir PRIMARY KEY(id_menu,id_dish);

ALTER TABLE Gerer 
    ADD CONSTRAINT fk_gerer_admin FOREIGN KEY(id_admin) REFERENCES Administrateurs(id),
    ADD CONSTRAINT fk_gerer_table FOREIGN KEY(id_table) REFERENCES Tables(id),
    ADD CONSTRAINT pk_gerer PRIMARY KEY(id_admin,id_table);

ALTER TABLE Creer 
    ADD CONSTRAINT fk_creer_admin FOREIGN KEY(id_admin) REFERENCES Administrateurs(id),
    ADD CONSTRAINT fk_creer_menus FOREIGN KEY(id_menu) REFERENCES Menus(id),
    ADD CONSTRAINT pk_creer PRIMARY KEY (id_admin,id_menu);

ALTER TABLE Lier 
    ADD CONSTRAINT fk_lier_table FOREIGN KEY (id_table) REFERENCES Tables(id),
    ADD CONSTRAINT fk_lier_reservation FOREIGN KEY (id_reservation) REFERENCES Menus(id),
    ADD CONSTRAINT pk_lier PRIMARY KEY (id_table,id_reservation);

ALTER TABLE Valider
    ADD CONSTRAINT fk_valider_admin FOREIGN KEY (id_admin) REFERENCES Administrateurs(id),
    ADD CONSTRAINT fk_valider_reservation FOREIGN KEY (id_reservation) REFERENCES Reservations(id),
    ADD CONSTRAINT pk_valider PRIMARY KEY (id_admin,id_reservation);




