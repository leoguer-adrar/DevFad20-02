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
DROP TABLE if EXISTS manage;
DROP TABLE if EXISTS inform;
DROP TABLE if EXISTS ask;
DROP TABLE if EXISTS identify;
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
    id             Int Auto_increment NOT NULL,
    name           Varchar(250)       NOT NULL,
    service        Varchar(100)       NOT NULL,
    master_builder Varchar(150)       NOT NULL,
    amount_HT      Int                NOT NULL,
    surface        Varchar(100)       NOT NULL,
    status         Varchar(50)        NOT NULL,
    end_date       Int                NOT NULL,
    doc1           Varchar(50)        NOT NULL,
    doc2           Varchar(50),
    doc3           Varchar(50),
    doc4           Varchar(50),
    doc5           Varchar(50),
    id_Category    Int,
    CONSTRAINT Project_PK PRIMARY KEY (id)
) ENGINE = InnoDB;


-- Création des foreign key

ALTER TABLE Comment_quote
    ADD CONSTRAINT Comment_quote_Quote_FK FOREIGN KEY (id_Quote) REFERENCES Quote (id),
    ADD CONSTRAINT Comment_quote_User0_FK FOREIGN KEY (id__User) REFERENCES User (id);

ALTER TABLE Project
    ADD CONSTRAINT Project_Category_FK FOREIGN KEY (id_Category) REFERENCES Category (id);


CREATE TABLE manage
(
    id       Int NOT NULL,
    id__User Int NOT NULL,
    CONSTRAINT manage_PK PRIMARY KEY (id, id__User),
    CONSTRAINT manage_Project_FK FOREIGN KEY (id) REFERENCES Project (id),
    CONSTRAINT manage_User0_FK FOREIGN KEY (id__User) REFERENCES User (id)
) ENGINE = InnoDB;


CREATE TABLE inform
(
    id       Int NOT NULL,
    id__User Int NOT NULL,
    CONSTRAINT inform_PK PRIMARY KEY (id, id__User),
    CONSTRAINT inform_News_FK FOREIGN KEY (id) REFERENCES News (id),
    CONSTRAINT inform_User0_FK FOREIGN KEY (id__User) REFERENCES User (id)
) ENGINE = InnoDB;


CREATE TABLE ask
(
    id       Int NOT NULL,
    id__User Int NOT NULL,
    CONSTRAINT ask_PK PRIMARY KEY (id, id__User),
    CONSTRAINT ask_Quote_FK FOREIGN KEY (id) REFERENCES Quote (id),
    CONSTRAINT ask_User0_FK FOREIGN KEY (id__User) REFERENCES User (id)
) ENGINE = InnoDB;



CREATE TABLE identify
(
    id       Int NOT NULL,
    id__User Int NOT NULL,
    CONSTRAINT identify_PK PRIMARY KEY (id, id__User),
    CONSTRAINT identify_Comment_quote_FK FOREIGN KEY (id) REFERENCES Comment_quote (id),
    CONSTRAINT identify_User0_FK FOREIGN KEY (id__User) REFERENCES User (id)
) ENGINE = InnoDB;


