CREATE DATABASE ProjetFilRouge;
USE ProjetFilRouge;
CREATE TABLE Projet(
    id_projet Int Auto_increment NOT NULL,
    nom_projet Varchar (250) NOT NULL,
    prestation_projet Varchar (100) NOT NULL,
    maitre_ouvrage_projet Varchar (150) NOT NULL,
    montant_operation_ht_projet Varchar (20) NOT NULL,
    surface_projet Varchar (100) NOT NULL,
    etat_projet Varchar (50) NOT NULL,
    date_fin_projet Varchar (4) NOT NULL,
    doc1_projet Varchar (50) NOT NULL,
    doc2_projet Varchar (50),
    doc3_projet Varchar (50),
    doc4_projet Varchar (50),
    doc5_projet Varchar (50),
    CONSTRAINT Projet_PK PRIMARY KEY (id_projet)
);
CREATE TABLE Utilisateur(
    id_utilisateur Int Auto_increment NOT NULL,
    nom_utilisateur Varchar (100) NOT NULL,
    prenom_utilisateur Varchar (100) NOT NULL,
    mail_utilisateur Varchar (50) NOT NULL,
    password_utilisateur Varchar (10) NOT NULL,
    telephone_utilisateur Varchar (15) NOT NULL,
    Adresse_ligne1_utilisateur Varchar (50) NOT NULL,
    Adresse_ligne2_utilisateur Varchar (50) NOT NULL,
    Code_postal_utilisateur Varchar (6) NOT NULL,
    ville_utilisateur Varchar (50) NOT NULL,
    pays_utilisateur Varchar (20) NOT NULL,
    administrateur_utilisateur Bool NOT NULL,
    CONSTRAINT Utilisateur_PK PRIMARY KEY (id_utilisateur)
);
CREATE TABLE Actualite(
    id_actualite Int Auto_increment NOT NULL,
    date_actualite Varchar (4) NOT NULL,
    titre_actualite Varchar (500) NOT NULL,
    article_actualite Varchar (100) NOT NULL,
    photo1_actualite Varchar (50),
    photo2_actualite Varchar (50),
    photo3_actualite Varchar (50),
    photo4_actualite Varchar (50),
    photo5_actualite Varchar (50),
    CONSTRAINT Actualite_PK PRIMARY KEY (id_actualite)
);
CREATE TABLE Demande_devis(
    id_devis Int Auto_increment NOT NULL,
    date_devis Date NOT NULL,
    titre_devis Varchar (100) NOT NULL,
    article_devis Varchar (500) NOT NULL,
    photo1_projet Varchar (50),
    photo2_projet Varchar (50),
    CONSTRAINT Demande_devis_PK PRIMARY KEY (id_devis)
);
CREATE TABLE Commentaire_devis(
    id_commentaire_devis Int Auto_increment NOT NULL,
    commentaire_devis Varchar (50) NOT NULL,
    id_devis Int,
    CONSTRAINT Commentaire_devis_PK PRIMARY KEY (id_commentaire_devis),
    CONSTRAINT Commentaire_devis_Demande_devis_FK FOREIGN KEY (id_devis) REFERENCES Demande_devis(id_devis)
);
CREATE TABLE relation0(
        id_utilisateur        Int NOT NULL ,
        id_actualite          Int NOT NULL ,
        id_projet             Int NOT NULL ,
        id_devis              Int NOT NULL ,
        id_commentaire_devis  Int NOT NULL
	,CONSTRAINT relation0_PK PRIMARY KEY (id_utilisateur,id_actualite,id_projet,id_devis,id_commentaire_devis)

	,CONSTRAINT relation0_Utilisateur_FK FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
	,CONSTRAINT relation0_Actualite0_FK FOREIGN KEY (id_actualite) REFERENCES Actualite(id_actualite)
	,CONSTRAINT relation0_Projet1_FK FOREIGN KEY (id_projet) REFERENCES Projet(id_projet)
	,CONSTRAINT relation0_Demande_devis2_FK FOREIGN KEY (id_devis) REFERENCES Demande_devis(id_devis)
	,CONSTRAINT relation0_Commentaire_devis3_FK FOREIGN KEY (id_commentaire_devis) REFERENCES Commentaire_devis(id_commentaire_devis)
);
DROP TABLE relation0;
CREATE TABLE identifier(
        id_utilisateur        Int NOT NULL ,
        id_actualite          Int NOT NULL ,
        id_projet             Int NOT NULL ,
        id_devis              Int NOT NULL ,
        id_commentaire_devis  Int NOT NULL
	,CONSTRAINT identifier_PK PRIMARY KEY (id_utilisateur,id_actualite,id_projet,id_devis,id_commentaire_devis)

	,CONSTRAINT identifier_Utilisateur_FK FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
	,CONSTRAINT identifier_Actualite0_FK FOREIGN KEY (id_actualite) REFERENCES Actualite(id_actualite)
	,CONSTRAINT identifier_Projet1_FK FOREIGN KEY (id_projet) REFERENCES Projet(id_projet)
	,CONSTRAINT identifier_Demande_devis2_FK FOREIGN KEY (id_devis) REFERENCES Demande_devis(id_devis)
	,CONSTRAINT identifier_Commentaire_devis3_FK FOREIGN KEY (id_commentaire_devis) REFERENCES Commentaire_devis(id_commentaire_devis)
);