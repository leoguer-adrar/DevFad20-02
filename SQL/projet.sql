use projet;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE if EXISTS User;
DROP TABLE if EXISTS Game;
DROP TABLE if EXISTS Bug;
DROP TABLE if EXISTS Contact;
DROP TABLE if EXISTS Comment;
SET FOREIGN_KEY_CHECKS = 1;

create table if not exists User
(
        id_user       Int  Auto_increment PRIMARY KEY  NOT NULL ,
        pseudo        Varchar (255) NOT NULL ,
        email         Varchar (255) NOT NULL ,
        password      Varchar (255) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE if not exists Game
(
        id_game  Int  Auto_increment  NOT NULL ,
        id_bug  Int NOT NULL,
        name_game Varchar (255) NOT NULL,

        PRIMARY KEY (id_game)
)ENGINE=InnoDB;

CREATE TABLE Bug(

        id_bug          Int  Auto_increment  NOT NULL ,
        title_bug       Varchar (255) NOT NULL ,
        description_bug Varchar (255) NOT NULL ,
        video_bug       Varchar (255) NOT NULL ,
        date_bug        Datetime NOT NULL ,
        id_user         Int ,
        id_game         INT ,
			PRIMARY KEY (id_bug)

)ENGINE=InnoDB;


CREATE TABLE Contact(
        id_contact Int  Auto_increment  NOT NULL ,
        pseudo     Varchar (255) NOT NULL ,
        email      Varchar (255) NOT NULL ,
        text       Longtext NOT NULL ,
	PRIMARY KEY (id_contact)
)ENGINE=InnoDB;

CREATE TABLE if not exists Comment
(
        id_comment     Int  Auto_increment  NOT NULL ,
        id_user        Int NOT NULL ,
        answer         Int NOT NULL ,
        position       Int NOT NULL ,
        id_bug         Int NOT NULL ,
	    PRIMARY KEY (id_comment)
)ENGINE=InnoDB;

ALTER TABLE Bug
    add constraint fk_bug_user FOREIGN KEY (id_user) REFERENCES user(id_user);
ALTER TABLE Bug
	add constraint fk_bug_game FOREIGN KEY (id_game) REFERENCES game(id_game);

ALTER TABLE Comment
    add constraint fk_comment_bug FOREIGN KEY (id_bug) REFERENCES bug(id_bug);
ALTER TABLE Comment
	add constraint fk_comment_user FOREIGN KEY (id_user) REFERENCES user(id_user);

-- SELECT jeux.nom_jeu,bugs.titre_bug, bugs.description_bug, bugs.video_bug -- Je cherche dans la table bugs les attributs du SELECT, 
-- FROM bugs --de bugs
-- inner JOIN jeux --dans table jeux
-- ON bugs.id_jeu = jeux.id_jeu	-- je lui dis que l'id id_jeu de la table bugs correspond à l'id id_jeu de la table jeux