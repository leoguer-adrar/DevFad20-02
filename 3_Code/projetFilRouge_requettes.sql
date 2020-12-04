/*3.	Requêtes CRUD :
 Rédiger les requêtes CRUD suivantes :
 -Insertion de données dans vos tables,
 -Modification de données dans vos tables,
 -Suppression de données dans vos tables,
 -Sélection de données dans vos tables avec des jointures,
 */


INSERT INTO Projet(nom_projet, prestation_projet, maitre_ouvrage_projet, montant_operation_ht_projet, surface_projet, etat_projet, date_fin_projet, doc1_projet, doc2_projet, doc3_projet, doc4_projet, doc5_projet)
 VALUES ("villa titi", "Esquisse à Permis de construire", "Pascale, 65000 Tarbes", "100 000 €", "150 m²", "Réalisé", "2018","doc 1 villa titi","","","","");
INSERT INTO Projet(nom_projet, prestation_projet, maitre_ouvrage_projet, montant_operation_ht_projet, surface_projet, etat_projet, date_fin_projet, doc1_projet, doc2_projet, doc3_projet, doc4_projet, doc5_projet)
 VALUES ("villa toto", "Mission de base", "Paul, 65000 Tarbes", "300 000 €", "150 m²", "Réalisé", "2018","doc 1 villa toto","doc 2 villa toto","doc 3 villa toto","doc 4 villa toto","doc 5 villa toto"),
         ("villa tata", "Mission de base Esquisse à Réception chantier", "Privé", "180 000 €", "site : 6 400 m² bâtiments : 780 m²", "Réalisé", "2019","doc 1 villa tata","doc 2 villa tata","doc 3 villa tata","",""),
         ("villa mimi", "Esquisse à Permis de construire", "Pierre, 65000 Tarbes", "60 000 €", "150 m²", "Réalisé", "2019","doc 1 villa mimi","","","",""),
         ("villa momo", "Esquisse à Permis de construire", "Dépantement, 65000 Tarbes", "210 000 €", "300 m²", "Réalisé", "2019","doc 1 villa momo","","","",""),
         ("villa mama", "Mission de base", "Pascale, 65000 Tarbes", "120 000 €", "150 m²", "Réalisé", "2019","doc 1 villa mama", "doc 2 villa mama","","","");



INSERT INTO Utilisateur(nom_utilisateur, prenom_utilisateur, mail_utilisateur, password_utilisateur, telephone_utilisateur, Adresse_ligne1_utilisateur, Adresse_ligne2_utilisateur, Code_postal_utilisateur, ville_utilisateur, pays_utilisateur, administrateur_utilisateur)
VALUES ("Moreau", "Anne", "am@gmail.com", "azerty1/", "06-07-08-09-10", "16 rue du Pic du Midi", "", "65000", "Tarbes", "France", true);
INSERT INTO Utilisateur(nom_utilisateur, prenom_utilisateur, mail_utilisateur, password_utilisateur, telephone_utilisateur, Adresse_ligne1_utilisateur, Adresse_ligne2_utilisateur, Code_postal_utilisateur, ville_utilisateur, pays_utilisateur, administrateur_utilisateur)
VALUES ("Layerle", "Patricia", "pl@gmail.com", "azerty1/", "06-07-08-09-10", "65 rue du Pic du Midi", "", "65310", "Horgues", "France", true),
       ("Didou", "Elisa", "ed@gmail.com", "azerty1/", "06-07-08-09-10", "20 rue du Pic du Midi", "Villa Soleuil", "65310", "Laloubere", "France", false),
       ("Dada", "Jérôme", "jd@gmail.com", "azerty1/", "06-07-08-09-10", "30 rue du Pic du Midi", "", "65310", "Odos", "France", false),
       ("Sorbet", "Khang", "ks@gmail.com", "azerty1/", "06-07-08-09-10", "16 rue du Pic du Midi", "Appartement 51", "65360", "Momères", "France", false),
       ("Dalier", "Alexis", "ad@gmail.com", "azerty1/", "06-07-08-09-10", "59 rue du Pic du Midi", "", "65360", "Saint-Martin", "France", false),
       ("Alric", "Alex", "aa@gmail.com", "azerty1/", "06-07-08-09-10", "78 rue du Pic du Midi", "Maison Bueno", "65360", "Arcizac", "France", false),
       ("Pipereau", "Romain", "rp@gmail.com", "azerty1/", "06-07-08-09-10", "16 rue du Pic du Midi", "", "65200", "Bagnères de Bigorre", "France", false),
       ("Marcos", "Hugo", "hm@gmail.com", "azerty1/", "06-07-08-09-10", "40 rue du Pic du Midi", "Maison Nina", "65420", "Ibos", "France", false),
       ("Humber", "Corine", "ch@gmail.com", "azerty1/", "06-07-08-09-10", "26 rue du Pic du Midi", "", "65700", "Juillan", "France", false),
       ("Marty", "Rémi", "rm@gmail.com", "azerty1/", "06-07-08-09-10", "75 rue du Pic du Midi", "", "65200", "Pouzac", "France", false),
       ("Dallas", "Florian", "fd@gmail.com", "azerty1/", "06-07-08-09-10", "60 rue du Pic du Midi", "", "65300", "Lourdes", "France", false);
/*Mettre par défaut la valeur false (faux = 0 (true=vrai=1)) au champs Administrateur*/
ALTER TABLE `utilisateur`
	CHANGE COLUMN `administrateur_utilisateur` `administrateur_utilisateur` TINYINT(1) NOT NULL DEFAULT '0' AFTER `pays_utilisateur`;
/*Pour changer les A en a de adresse*/
ALTER TABLE `utilisateur`
	ALTER `Adresse_ligne1_utilisateur` DROP DEFAULT,
	ALTER `Adresse_ligne2_utilisateur` DROP DEFAULT;
ALTER TABLE `utilisateur`
	CHANGE COLUMN `Adresse_ligne1_utilisateur` `adresse_ligne1_utilisateur` VARCHAR(50) NOT NULL AFTER `telephone_utilisateur`,
	CHANGE COLUMN `Adresse_ligne2_utilisateur` `adresse_ligne2_utilisateur` VARCHAR(50) NOT NULL AFTER `adresse_ligne1_utilisateur`;
/*entrer données avec le paramètre par défaut admin = faux = 0*/
INSERT INTO Utilisateur(nom_utilisateur, prenom_utilisateur, mail_utilisateur, password_utilisateur, telephone_utilisateur, Adresse_ligne1_utilisateur, Adresse_ligne2_utilisateur, Code_postal_utilisateur, ville_utilisateur, pays_utilisateur)
VALUES ("Test", "default", "dt@gmail.com", "azerty1/", "06-07-08-09-10", "rue test", "", "65310", "Horgues", "France");



/*changer le type du champs date_actualite mis en varchar par erreur*/
ALTER TABLE `actualite`
	ALTER `date_actualite` DROP DEFAULT;
ALTER TABLE `actualite`
	CHANGE COLUMN `date_actualite` `date_actualite` DATE NOT NULL AFTER `id_actualite`;
/*Saisie données - date au format américain pour quelle soit acceptée*/
INSERT INTO Actualite(date_actualite, titre_actualite, article_actualite, photo1_actualite, photo2_actualite, photo3_actualite, photo4_actualite, photo5_actualite)
VALUES ("2020/12/03", "EPAD Horgues", "Le chantier avance bien après 11 mois de travaux et 1 confinement", "Photo1", "Photo2", "", "", ""),
       ("2020/11/27", "Mairie", "Le chantier est fini !!", "Photo mairie sud", "Photo mairie nord", "", "", ""),
       ("2020/11/15", "Eglise", "Réahibilitation toujours en cours", "Eglise ouest", "", "", "", ""),
       ("2020/11/04", "Maison Soleil", "Jaune soleil", "soleil 1", "Soleil 2", "", "", ""),
       ("2020/10/21", "Villa des Montagnes", "Mais ù est la neige", "neige", "montagne", "", "", ""),
       ("2020/10/09", "Maison 65", "Bon anniversaire Patriicia !!!", "Chocolatine", "Gâteau", "Cadeau 1", "Cadeau 2", "Cadeau 3");


INSERT INTO Demande_devis(date_devis, titre_devis, article_devis, photo1_projet, photo2_projet)
VALUES ("2020/12/03", "article du jour", "Hep !!! Bonjour", "Photo 1", "Photo 2"),
        ("2020/12/03", "article 2", "Article !!! Bonjour", "", ""),
        ("2020/12/03", "article 3", "Arttttttttttt !!! Bonjour", "Hello", "Hola"),
        ("2020/12/03", "article 4", "Joyeux Noêl !!! ", "Père Noël", ""),
        ("2020/12/03", "article 5", "Bonne année !!! ", "Houx", "Galette des rois"),
        ("2020/12/03", "article 6", "Meilleurs voeux !!! 2021", "Bonheur", "Santé");



INSERT INTO Commentaire_devis(commentaire_devis, id_devis)
VALUES ("RE-bonjour", "1"),
        ("Sapin de Noël !!","4"),
        ("Formation développeuse validée !!!", "6"),
        ("Félicitations !!!!!!!", "6");



/*consultation des données*/
select nom_utilisateur, prenom_utilisateur from utilisateur;
select * from demande_devis;
select * from identifier;




