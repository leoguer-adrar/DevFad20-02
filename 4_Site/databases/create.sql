CREATE DATABASE pfrATMarchitecture /*!40100 COLLATE 'utf8mb4_general_ci' */;

USE pfratmarchitecture;

-- drop permet de supprimer toutes les tables initiée
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE if EXISTS User;
DROP TABLE if EXISTS News;
DROP TABLE if EXISTS Quote;
DROP TABLE if EXISTS Comment_quote;
DROP TABLE if EXISTS Category;
DROP TABLE if EXISTS Project;
DROP TABLE if EXISTS Document;
DROP TABLE if EXISTS manage;
SET FOREIGN_KEY_CHECKS = 1;



CREATE TABLE User
(
    id            Int Auto_increment NOT NULL,
    last_name     Varchar(100)       NOT NULL,
    first_name    Varchar(100)       NOT NULL,
    mail          Varchar(50)        NOT NULL,
    user_name     Varchar(50)        NOT NULL,
    password      Varchar(10)        NOT NULL,
    phone         Varchar(15)        NOT NULL,
    address_line1 Varchar(50)        NOT NULL,
    address_line2 Varchar(50)        NOT NULL,
    postcode      Varchar(6)         NOT NULL,
    city          Varchar(50)        NOT NULL,
    country       Varchar(20)        NOT NULL,
    administrator TINYINT            NOT NULL DEFAULT 0,
    CONSTRAINT User_PK PRIMARY KEY (id)
) ENGINE = InnoDB;


CREATE TABLE News
(
    id       Int Auto_increment NOT NULL,
    date     Datetime           NOT NULL DEFAULT CURRENT_TIMESTAMP,
    title    Varchar(200)       NOT NULL,
    article  Text               NOT NULL,
    picture1 Varchar(50),
    picture2 Varchar(50),
    picture3 Varchar(50),
    picture4 Varchar(50),
    picture5 Varchar(50),
    id__User Int,
    CONSTRAINT News_PK PRIMARY KEY (id)
) ENGINE = InnoDB;


CREATE TABLE Quote
(
    id       Int Auto_increment NOT NULL,
    date     Datetime           NOT NULL DEFAULT CURRENT_TIMESTAMP,
    title    Varchar(100)       NOT NULL,
    article  Text               NOT NULL,
    picture1 Varchar(50),
    picture2 Varchar(50),
    id__User Int,
    CONSTRAINT Quote_PK PRIMARY KEY (id)
) ENGINE = InnoDB;


CREATE TABLE Comment_quote
(
    id       Int Auto_increment NOT NULL,
    comment  Varchar(500)       NOT NULL,
    id_Quote Int,
    id__User Int,
    CONSTRAINT Comment_quote_PK PRIMARY KEY (id)
) ENGINE = InnoDB;


CREATE TABLE Category
(
    id   Int Auto_increment NOT NULL,
    name Varchar(250)       NOT NULL,
    CONSTRAINT Category_PK PRIMARY KEY (id)
) ENGINE = InnoDB;


CREATE TABLE Project
(
    id                    Int Auto_increment NOT NULL,
    name                  Varchar(250)       NOT NULL,
    project_city          Varchar(100)       NOT NULL,
    service               Varchar(100)       NOT NULL,
    master_builder        Varchar(150)       NOT NULL,
    master_builder_adress Varchar(50),
    master_builder_CP     Varchar(50),
    master_builder_city   Varchar(50),
    amount_HT             Int                NOT NULL,
    surface               Int DEFAULT 0,
    surface_site          Int DEFAULT 0,
    surface_building      Int DEFAULT 0,
    status                Varchar(50)        NOT NULL,
    end_date              Int                NOT NULL,
    id_Category           Int,
    CONSTRAINT Project_PK PRIMARY KEY (id)
) ENGINE = InnoDB;


CREATE TABLE Document
(
    id         Int Auto_increment NOT NULL,
    name       Varchar(150)       NOT NULL,
    id_Project Int,
    CONSTRAINT Document_PK PRIMARY KEY (id)
) ENGINE = InnoDB;


-- Création des foreign key

ALTER TABLE News
    ADD CONSTRAINT News_User_FK FOREIGN KEY (id__User) REFERENCES User (id);


ALTER TABLE Quote
    ADD CONSTRAINT Quote_User_FK FOREIGN KEY (id__User) REFERENCES User (id);


ALTER TABLE Comment_quote
    ADD CONSTRAINT Comment_quote_Quote_FK FOREIGN KEY (id_Quote) REFERENCES Quote (id),
    ADD CONSTRAINT Comment_quote_User0_FK FOREIGN KEY (id__User) REFERENCES User (id);


ALTER TABLE Project
    ADD CONSTRAINT Project_Category_FK FOREIGN KEY (id_Category) REFERENCES Category (id);


ALTER TABLE Document
    ADD CONSTRAINT Document_Project_FK FOREIGN KEY (id_Project) REFERENCES Project (id);


CREATE TABLE manage
(
    id_Project Int NOT NULL,
    id__User   Int NOT NULL,
    CONSTRAINT manage_PK PRIMARY KEY (id_Project, id__User),
    CONSTRAINT manage_Project_FK FOREIGN KEY (id_Project) REFERENCES Project (id)
        ON DELETE CASCADE #supp auto si ligne supprimée dans origine
        ON UPDATE RESTRICT, #meme chose pour midification
    CONSTRAINT manage_User0_FK FOREIGN KEY (id__User) REFERENCES User (id)
        ON DELETE CASCADE #supp auto si ligne supprimée dans origine
        ON UPDATE RESTRICT #meme chose pour midification
) ENGINE = InnoDB;


