use ju_petillant;

-- drop permet de supprimer toutes les tables initiée
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE if EXISTS utilisateurs;
DROP TABLE if EXISTS articles;
DROP TABLE if EXISTS formulaires_contact;
DROP TABLE if EXISTS commentaires;
DROP TABLE if EXISTS photos;
DROP TABLE if EXISTS categories;
DROP TABLE if EXISTS associer;
DROP TABLE if EXISTS gerer;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE if NOT EXISTS utilisateurs(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    prenom_utilisateur VARCHAR (255) NOT NULL,
    nom_utilisateur VARCHAR (255) NOT NULL,
    login_utilisateur VARCHAR (255) NOT NULL,
    password_utilisateur VARCHAR (255) NOT NULL,
    mail_utilisateur VARCHAR (255) NOT NULL,
    administrateur TINYINT UNSIGNED DEFAULT 0
) engine = InnoDB;

CREATE TABLE if NOT EXISTS commentaires(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    contenu_commentaire LONGTEXT NOT NULL,
    from_commentaire INT UNSIGNED, 
    datecreation_commentaire DATETIME NOT NULL, 
    id_utilisateur INT UNSIGNED NOT NULL,
    id_article INT UNSIGNED NOT NULL
) engine = InnoDB;


CREATE TABLE if NOT EXISTS formulaires_contact(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    contenu_formulaire_contact LONGTEXT NOT NULL,
    mail_utilisateur VARCHAR (255) NOT NULL,
    prenom_utilisateur VARCHAR (255) NOT NULL,
    nom_utilisateur VARCHAR (255) NOT NULL 
) engine = InnoDB;

CREATE TABLE if NOT EXISTS photos(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_article INT UNSIGNED NOT NULL,
    nom_photo VARCHAR (255) NOT NULL
) engine = InnoDB;

CREATE TABLE if NOT EXISTS categories(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_categorie VARCHAR (255) NOT NULL
) engine = InnoDB;

CREATE TABLE if NOT EXISTS articles(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titre_article VARCHAR (255) NOT NULL,
    contenu_article LONGTEXT NOT NULL,  
    datecreation_article DATETIME NOT NULL,
    datemodification_article DATETIME NOT NULL,
    slug_article VARCHAR (255) NOT NULL,
    id_categorie INT UNSIGNED NOT NULL,
    id_utilisateur INT UNSIGNED NOT NULL
) engine = InnoDB;

CREATE TABLE if NOT EXISTS gerer(
    id_article INT UNSIGNED NOT NULL,
    id_utilisateur INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_article, id_utilisateur)
) engine = InnoDB;

CREATE TABLE if NOT EXISTS associer(
    id_article INT UNSIGNED NOT NULL,
    id_photo INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_article, id_photo)
) engine = InnoDB;


ALTER TABLE associer
ADD CONSTRAINT fk_associer_article FOREIGN KEY (id_article) REFERENCES articles (id);

ALTER TABLE associer
ADD CONSTRAINT fk_associer_photo FOREIGN KEY (id_photo) REFERENCES photos (id);

ALTER TABLE articles
ADD CONSTRAINT fk_articles_categorie FOREIGN KEY (id_categorie) REFERENCES categories (id);

ALTER TABLE gerer
ADD CONSTRAINT fk_gerer_article FOREIGN KEY  (id_article) REFERENCES articles (id);

ALTER TABLE gerer
ADD CONSTRAINT fk_gerer_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs (id);
   
ALTER TABLE commentaires
ADD CONSTRAINT fk_commentaires_utilisateur FOREIGN KEY  (id_utilisateur) REFERENCES utilisateurs (id);

ALTER TABLE commentaires
ADD CONSTRAINT fk_commentaires_article FOREIGN KEY  (id_article) REFERENCES articles (id);
    




