use ju_petillant;

-- drop permet de supprimer toutes les tables initiées
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE if EXISTS `user`;
DROP TABLE if EXISTS article;
DROP TABLE if EXISTS form;
DROP TABLE if EXISTS `comment`;
DROP TABLE if EXISTS picture;
DROP TABLE if EXISTS category;
DROP TABLE if EXISTS associate;
DROP TABLE if EXISTS manage;
SET FOREIGN_KEY_CHECKS = 1;

-- Creation table Utilisateur
CREATE TABLE if NOT EXISTS `user`(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    firstName VARCHAR (255) NOT NULL,
    lastName VARCHAR (255) NOT NULL,
    `login` VARCHAR (255) NOT NULL,
    `password` VARCHAR (255) NOT NULL,
    mail VARCHAR (255) NOT NULL,
    is_administrateur TINYINT UNSIGNED DEFAULT 0
) engine = InnoDB;

-- Creation table Commentaire
CREATE TABLE if NOT EXISTS `comment`(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    content TEXT NOT NULL,
    `from` INT UNSIGNED, 
    creationDate DATETIME NOT NULL, 
    id_user INT UNSIGNED NOT NULL,
    id_article INT UNSIGNED NOT NULL
) engine = InnoDB;

-- Creation table Formulaire contact
CREATE TABLE if NOT EXISTS form(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    content TEXT NOT NULL,
    mail_user VARCHAR (255) NOT NULL,
    firstName_user VARCHAR (255) NOT NULL,
    lastname_user VARCHAR (255) NOT NULL 
) engine = InnoDB;

-- Creation table Photo
CREATE TABLE if NOT EXISTS picture(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_article INT UNSIGNED NOT NULL,
    `name` VARCHAR (255) NOT NULL
) engine = InnoDB;

-- Creation table Categorie (article)
CREATE TABLE if NOT EXISTS category(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `name` VARCHAR (255) NOT NULL
) engine = InnoDB;

-- Creation table Article
CREATE TABLE if NOT EXISTS article(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    title VARCHAR (255) NOT NULL,
    content LONGTEXT NOT NULL,  
    creationDate DATETIME NOT NULL,
    modificationDate DATETIME NOT NULL,
    slug VARCHAR (255) NOT NULL,
    id_category INT UNSIGNED NOT NULL,
    id_user INT UNSIGNED NOT NULL
) engine = InnoDB;

-- Creation table gerer
CREATE TABLE if NOT EXISTS manage( 
    id_article INT UNSIGNED NOT NULL,
    id_user INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_article, id_user)
) engine = InnoDB;

-- Creation table associer
CREATE TABLE if NOT EXISTS associate(
    id_article INT UNSIGNED NOT NULL,
    id_picture INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_article, id_picture)
) engine = InnoDB;

-- Creation des Foreign Keys
ALTER TABLE associate
ADD CONSTRAINT fk_associate_article FOREIGN KEY (id_article) REFERENCES article (id);

ALTER TABLE associate
ADD CONSTRAINT fk_associate_picture FOREIGN KEY (id_picture) REFERENCES picture (id);

ALTER TABLE article
ADD CONSTRAINT fk_articles_category FOREIGN KEY (id_category) REFERENCES category (id);

ALTER TABLE manage
ADD CONSTRAINT fk_manage_article FOREIGN KEY  (id_article) REFERENCES article (id);

ALTER TABLE manage
ADD CONSTRAINT fk_manage_user FOREIGN KEY (id_user) REFERENCES `user` (id);
   
ALTER TABLE `comment`
ADD CONSTRAINT fk_comment_user FOREIGN KEY  (id_user) REFERENCES `user` (id);

ALTER TABLE `comment`
ADD CONSTRAINT fk_comment_article FOREIGN KEY  (id_article) REFERENCES article (id);
    




