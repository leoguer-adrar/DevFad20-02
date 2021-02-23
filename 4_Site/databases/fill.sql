-- quelques infos pour les tables


USE pfratmarchitecture;


-- truncate permet de supprimer des données enregistrées dans les tables.
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE  User;
TRUNCATE  News;
TRUNCATE  Quote;
TRUNCATE  Comment_quote;
TRUNCATE  Category;
TRUNCATE  Project;
TRUNCATE  manage;
TRUNCATE  inform;
TRUNCATE  ask;
TRUNCATE  identify;
SET FOREIGN_KEY_CHECKS = 1;




-- Ajouter des données à une table

INSERT INTO Category(name)
VALUES ("Etablissements publics"),
       ("Etablissements tertiaires"),
       ("Résidentiel");


INSERT INTO User(last_name, first_name, mail, user_name, password, phone, address_line1, address_line2, postcode, city, country, administrator)
VALUES ("Moreau", "Anne", "am@gmail.com", "archi", "azerty1/", "06-07-08-09-10", "16 rue du Pic du Midi", "", "65000", "Tarbes", "France", true),
       ("Layerle", "Patricia", "pl@gmail.com", "admin", "azerty1/", "06-07-08-09-10", "65 rue du Pic du Midi", "", "65310", "Horgues", "France", true);
/*entrer données avec le paramètre par défaut admin = faux = 0*/
INSERT INTO User(last_name, first_name, mail, user_name, password, phone, address_line1, address_line2, postcode, city, country)
VALUES ("Didou", "Elisa", "ed@gmail.com","el", "azerty1/", "06-07-08-09-10", "20 rue du Pic du Midi", "Villa Soleuil", "65310", "Laloubere", "France"),
       ("Dada", "Jérôme", "jd@gmail.com", "je", "azerty1/", "06-07-08-09-10", "30 rue du Pic du Midi", "", "65310", "Odos", "France"),
       ("Sorbet", "Khang", "ks@gmail.com","kh", "azerty1/", "06-07-08-09-10", "16 rue du Pic du Midi", "Appartement 51", "65360", "Momères", "France"),
       ("Dalier", "Alexis", "ad@gmail.com", "al", "azerty1/", "06-07-08-09-10", "59 rue du Pic du Midi", "", "65360", "Saint-Martin", "France"),
       ("Alric", "Alex", "aa@gmail.com","alex", "azerty1/", "06-07-08-09-10", "78 rue du Pic du Midi", "Maison Bueno", "65360", "Arcizac", "France"),
       ("Pipereau", "Romain", "rp@gmail.com","ro", "azerty1/", "06-07-08-09-10", "16 rue du Pic du Midi", "", "65200", "Bagnères de Bigorre", "France"),
       ("Marcos", "Hugo", "hm@gmail.com", "hu", "azerty1/", "06-07-08-09-10", "40 rue du Pic du Midi", "Maison Nina", "65420", "Ibos", "France"),
       ("Humber", "Corine", "ch@gmail.com", "coco", "azerty1/", "06-07-08-09-10", "26 rue du Pic du Midi", "", "65700", "Juillan", "France"),
       ("Marty", "Rémi", "rm@gmail.com", "réré", "azerty1/", "06-07-08-09-10", "75 rue du Pic du Midi", "", "65200", "Pouzac", "France"),
       ("Dallas", "Florian", "fd@gmail.com", "flo", "azerty1/", "06-07-08-09-10", "60 rue du Pic du Midi", "", "65300", "Lourdes", "France");


-- pour tester la page demande devis
INSERT INTO quote(date, title, article, picture1, picture2)
VALUES (NOW(), "article du jour", "Hep !!! Bonjour", "Photo 1", "Photo 2"),
       (NOW(), "article 2", "Article !!! Bonjour", "", ""),
       (NOW(), "article 3", "Arttttttttttt !!! Bonjour", "Hello", "Hola"),
       (NOW(), "article 4", "Joyeux Noêl !!! ", "Père Noël", ""),
       (NOW(), "article 5", "Bonne année !!! ", "Houx", "Galette des rois"),
       (NOW(), "article 6", "Meilleurs voeux !!! 2021", "Bonheur", "Santé");



INSERT INTO comment_quote(comment, id_Quote, id__User)
VALUES ("RE-bonjour", "1","4"),
       ("Sapin de Noël !!","4","3"),
       ("Formation développeuse validée !!!", "6","7"),
       ("Félicitations !!!!!!!", "6","6");


INSERT INTO ask(id, id__User)
VALUES("1","1"),
      ("2","1"),
      ("3","1"),
      ("4","1"),
      ("5","1"),
      ("6","1");
























-- INSERT INTO Project(name, service, master_builder, amount_HT, surface, status, end_date, doc1, doc2, doc3, doc4, doc5,id_Category)
--  VALUES ("villa titi", "Esquisse à Permis de construire", "Pascale, 65000 Tarbes", 100000, "150 m²", "Réalisé", "2018","doc 1 villa titi","","","","",3);
-- INSERT INTO Project(name, service, master_builder, amount_HT, surface, status, end_date, doc1, doc2, doc3, doc4, doc5,id_Category)
--  VALUES ("villa toto", "Mission de base", "Paul, 65000 Tarbes", 300000, "150 m²", "Réalisé", "2018","doc 1 villa toto","doc 2 villa toto","doc 3 villa toto","doc 4 villa toto","doc 5 villa toto",3),
--          ("villa tata", "Mission de base Esquisse à Réception chantier", "Privé", 180000, "site : 6 400 m² bâtiments : 780 m²", "Réalisé", "2019","doc 1 villa tata","doc 2 villa tata","doc 3 villa tata","","",3),
--          ("villa mimi", "Esquisse à Permis de construire", "Pierre, 65000 Tarbes", 60000, "150 m²", "Réalisé", "2019","doc 1 villa mimi","","","","",3),
--          ("MecaMont", "Esquisse à Permis de construire", "Dépantement, 65000 Tarbes", 210000, "300 m²", "Réalisé", "2019","doc 1 villa momo","","","","",2),
--          ("Mairie", "Mission de base", "Pascale, 65000 Tarbes", 120000, "150 m²", "Réalisé", "2019","doc 1 villa mama", "doc 2 villa mama","","","",1);






-- /*Saisie données - date au format américain pour quelle soit acceptée*/
-- INSERT INTO news(date, title, article, picture1, picture2, picture3, picture4, picture5)
-- VALUES ("2020/12/03", "EPAD Horgues", "Le chantier avance bien après 11 mois de travaux et 1 confinement", "Photo1", "Photo2", "", "", ""),
--        ("2020/11/27", "Mairie", "Le chantier est fini !!", "Photo mairie sud", "Photo mairie nord", "", "", ""),
--        ("2020/11/15", "Eglise", "Réahibilitation toujours en cours", "Eglise ouest", "", "", "", ""),
--        ("2020/11/04", "Maison Soleil", "Jaune soleil", "soleil 1", "Soleil 2", "", "", ""),
--        ("2020/10/21", "Villa des Montagnes", "Mais ù est la neige", "neige", "montagne", "", "", ""),
--        ("2020/10/09", "Maison 65", "Bon anniversaire Patriicia !!!", "Chocolatine", "Gâteau", "Cadeau 1", "Cadeau 2", "Cadeau 3");





-- INSERT INTO manage(id, id__User)
-- VALUES("1","1"),
--         ("1","2"),
--         ("1","3"),
--         ("1","4"),
--         ("1","5"),
--         ("1","6");



-- INSERT INTO inform(id, id__User)
-- VALUES("1","1"),
--         ("2","1"),
--         ("3","1"),
--         ("4","1"),
--         ("5","1"),
--         ("6","1");


