use projet_pizza;

CREATE TABLE UTILISATEUR(
    id_utilisateur Int Auto_increment PRIMARY KEY NOT NULL,
    login_utilisateur Varchar(50) NOT NULL,
    nom_utilisateur Varchar(50) NOT NULL,
    prenom_utilisateur Varchar(50) NOT NULL,
    mail_utilisateur Varchar(50) NOT NULL,
    tel_utilisateur Varchar(50) NOT NULL,
    gerant Tinyint unsigned default 0
);

CREATE TABLE FORMULAIRECONTACT(
    id_form_contact Int Auto_increment PRIMARY KEY NOT NULL,
    contenu_form_contact Varchar(255) NOT NULL,
    id_utilisateur Int
);

CREATE TABLE COMMANDE(
    id_commande Int Auto_increment PRIMARY KEY NOT NULL,
    date_commande Date NOT NULL,
    contenu_commande Varchar(255) NOT NULL,
    id_utilisateur Int
);

CREATE TABLE PRODUITBRUT(
    id_pb Int Auto_increment PRIMARY KEY NOT NULL,
    nom_pb Varchar(50) NOT NULL,
    stock_pb Float
);

CREATE TABLE TYPEPF(
    id_type_pf Int Auto_increment PRIMARY KEY NOT NULL,
    nom_type_pf Varchar(50) NOT NULL
);

CREATE TABLE PRODUITFINIS(
    id_pf Int Auto_increment PRIMARY KEY NOT NULL,
    nom_pf Varchar(50) NOT NULL,
    prix_vente_pf Float,
    stock_pf Int,
    id_type_pf Int
);

CREATE TABLE COMPOSER(
    id_commande Int,
    id_pf Int,
    PRIMARY KEY (id_commande,id_pf)
);

CREATE TABLE FABRIQUER(
    id_pb Int,
    id_pf Int,
    PRIMARY KEY (id_pb,id_pf)
);


-- Contraintes :

use projet_pizza;

ALTER TABLE FORMULAIRECONTACT
ADD CONSTRAINT fk_form_util
FOREIGN KEY (id_utilisateur)
REFERENCES UTILISATEUR (id_utilisateur);

ALTER TABLE COMMANDE
ADD CONSTRAINT fk_commande_util
FOREIGN KEY (id_utilisateur)
REFERENCES UTILISATEUR (id_utilisateur);

ALTER TABLE PRODUITFINIS
ADD CONSTRAINT fk_pf_typepf
FOREIGN KEY (id_type_pf)
REFERENCES TYPEPF (id_type_pf);

ALTER TABLE COMPOSER
ADD CONSTRAINT fk_commande_composer
FOREIGN KEY (id_commande)
REFERENCES COMMANDE (id_commande);

ALTER TABLE COMPOSER
ADD CONSTRAINT fk_pf_composer
FOREIGN KEY (id_pf)
REFERENCES PRODUITFINIS (id_pf);

ALTER TABLE FABRIQUER
ADD CONSTRAINT fk_pb_fabriquer
FOREIGN KEY (id_pb)
REFERENCES PRODUITBRUT (id_pb);

ALTER TABLE FABRIQUER
ADD CONSTRAINT fk_pf_fabriquer
FOREIGN KEY (id_pf)
REFERENCES PRODUITFINIS (id_pf);