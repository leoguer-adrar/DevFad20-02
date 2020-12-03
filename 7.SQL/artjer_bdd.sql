




CREATE TABLE ADMINISTRATEUR(
    id_administrateur Int Auto_increment PRIMARY KEY NOT NULL,
    login_admin Varchar (50) NOT NULL,
    mot_passe_admin Varchar (50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE CLIENT(
    id_client Int Auto_increment PRIMARY KEY NOT NULL,
    login_client Varchar (50) NOT NULL,
    mot_passe_client Varchar (50) NOT NULL,
    nom_client Varchar (50) ,
    prenom_client Varchar (50),
    mail_client Varchar (50),
    tel_client Int (50),
    nom_rue_client Varchar (50),
    num_rue_client Int (50),
    cp_client Int (50),
    pays_client Varchar (50)
)ENGINE=InnoDB;

CREATE TABLE CUSTOMISATION(
    id_customisation Int Auto_increment PRIMARY KEY NOT NULL,
    nom_customisation Varchar (50) NOT NULL,
    num_customisation Int (50)
   
)ENGINE=InnoDB;

CREATE TABLE MAQUETTE(
    id_maquette Int Auto_increment PRIMARY KEY NOT NULL,
    nom_maquette Varchar (50) NOT NULL,
    num_maquette Int (50)
)ENGINE=InnoDB;

CREATE TABLE CONTRAT(
    id_contrat Int Auto_increment PRIMARY KEY NOT NULL,
    nom_contrat Varchar (50) NOT NULL,
    num_contrat Int (50)
)ENGINE=InnoDB;

CREATE TABLE TYPES(
    id_type Int Auto_increment PRIMARY KEY NOT NULL,
    nom_type Varchar (50) NOT NULL
    
)ENGINE=InnoDB;

CREATE TABLE GALLERIE(
    id_gallerie Int Auto_increment PRIMARY KEY NOT NULL,
    nom_gallerie Varchar (50) NOT NULL,
    nom_image Int (50)
)ENGINE=InnoDB;

CREATE TABLE REALISER(
    id_administrateur Int,
    id_maquette Int,
    PRIMARY KEY (id_administrateur,id_maquette)
    
)ENGINE=InnoDB;

CREATE TABLE MODIFIER(
    id_administrateur Int,
    id_gallerie Int,
    PRIMARY KEY (id_administrateur,id_gallerie)
    
)ENGINE=InnoDB;

CREATE TABLE OBTENIR(
    id_contrat Int,
    id_client Int,
    
    PRIMARY KEY (id_contrat,id_client)
    
)ENGINE=InnoDB;

CREATE TABLE VISUALISER(
    id_gallerie Int,
    id_client Int,
    PRIMARY KEY (id_gallerie,id_client)
    
)ENGINE=InnoDB;


CREATE TABLE ENVOYER(
    id_contrat Int,
    id_administrateur Int,
    PRIMARY KEY (id_contrat,id_administrateur)
    
)ENGINE=InnoDB;







ALTER TABLE maquette
ADD CONSTRAINT fk_client_maquette
FOREIGN KEY (id_client)
REFERENCES client (id_client);


ALTER TABLE customisation
ADD CONSTRAINT fk_customisation_client
FOREIGN KEY (id_client)
REFERENCES client (id_client);

ALTER TABLE client
ADD CONSTRAINT fk_customisation_client
FOREIGN KEY (id_customisation)
REFERENCES customisation (id_customisation);

ALTER TABLE client
ADD CONSTRAINT fk_maquette_client
FOREIGN KEY (id_maquette)
REFERENCES maquette (id_maquette);

ALTER TABLE contrat
ADD CONSTRAINT fk_contrat_types
FOREIGN KEY (id_type)
REFERENCES types (id_type);





























