use projet;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE if EXISTS utilisateurs;
DROP TABLE if EXISTS jeux;
DROP TABLE if EXISTS bugs;
DROP TABLE if EXISTS contacts;
DROP TABLE if EXISTS commentaires;
SET FOREIGN_KEY_CHECKS = 1;

create table if not exists utilisateurs
(
        id_utilisateur Int  Auto_increment PRIMARY KEY  NOT NULL ,
        pseudo        Varchar (255) NOT NULL ,
        email         Varchar (255) NOT NULL ,
        motdepasse    Varchar (255) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE if not exists jeux
(
        id_jeu  Int  Auto_increment  NOT NULL ,
        id_bug  Int NOT NULL,
        nom_jeu Varchar (255) NOT NULL,
	    PRIMARY KEY (id_jeu)
)ENGINE=InnoDB;

CREATE TABLE if not exists bugs
(
        id_bug          Int  Auto_increment  NOT NULL ,
        titre_bug       Varchar (255) NOT NULL ,
        description_bug Varchar (255) NOT NULL ,
        video_bug       Varchar (255) NOT NULL ,
        id_utilisateur  Int NOT NULL ,
        id_jeu          Int NOT NULL,
        datebug         DATETIME NOT NULL,
	    PRIMARY KEY (id_bug)
)ENGINE=InnoDB;

CREATE TABLE if not exists contacts
(
        id_contact Int  Auto_increment  NOT NULL ,
        pseudo     Varchar (255) NOT NULL ,
        mail       Varchar (255) NOT NULL ,
        message    Longtext NOT NULL,
	    PRIMARY KEY (id_contact)
)ENGINE=InnoDB;

CREATE TABLE if not exists commentaires
(
        id_commentaire Int  Auto_increment  NOT NULL ,
        id_utilisateur Int NOT NULL ,
        reponse_a      Int NOT NULL ,
        position       Int NOT NULL ,
        id_bug         Int NOT NULL ,
	    PRIMARY KEY (id_commentaire)
)ENGINE=InnoDB;

ALTER TABLE bugs
    add constraint fk_bug_utilisateurs FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur);
ALTER TABLE bugs
	add constraint fk_bug_jeux FOREIGN KEY (id_jeu) REFERENCES jeux(id_jeu);

ALTER TABLE commentaires
    add constraint fk_commentaire_bugs FOREIGN KEY (id_bug) REFERENCES bugs(id_bug);
ALTER TABLE commentaires
	add constraint fk_commentaire_utilisateurs FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur);