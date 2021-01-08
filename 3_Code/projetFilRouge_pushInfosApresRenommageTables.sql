-- queiques infos pour les tables


USE ProjetFilRouge;



INSERT INTO Project(name, service, master_builder, amount_HT, surface, status, end_date, doc1, doc2, doc3, doc4, doc5)
 VALUES ("villa titi", "Esquisse à Permis de construire", "Pascale, 65000 Tarbes", 100000, "150 m²", "Réalisé", "2018","doc 1 villa titi","","","","");
INSERT INTO Project(name, service, master_builder, amount_HT, surface, status, end_date, doc1, doc2, doc3, doc4, doc5)
 VALUES ("villa toto", "Mission de base", "Paul, 65000 Tarbes", 300000, "150 m²", "Réalisé", "2018","doc 1 villa toto","doc 2 villa toto","doc 3 villa toto","doc 4 villa toto","doc 5 villa toto"),
         ("villa tata", "Mission de base Esquisse à Réception chantier", "Privé", 180000, "site : 6 400 m² bâtiments : 780 m²", "Réalisé", "2019","doc 1 villa tata","doc 2 villa tata","doc 3 villa tata","",""),
         ("villa mimi", "Esquisse à Permis de construire", "Pierre, 65000 Tarbes", 60000, "150 m²", "Réalisé", "2019","doc 1 villa mimi","","","",""),
         ("villa momo", "Esquisse à Permis de construire", "Dépantement, 65000 Tarbes", 210 000, "300 m²", "Réalisé", "2019","doc 1 villa momo","","","",""),
         ("villa mama", "Mission de base", "Pascale, 65000 Tarbes", 120000, "150 m²", "Réalisé", "2019","doc 1 villa mama", "doc 2 villa mama","","","");



INSERT INTO User(last_name, first_name, mail, password, phone, address_line1, address_line2, postcode, city, country, administrator)
VALUES ("Moreau", "Anne", "am@gmail.com", "azerty1/", "06-07-08-09-10", "16 rue du Pic du Midi", "", "65000", "Tarbes", "France", true);
INSERT INTO User(last_name, first_name, mail, password, phone, address_line1, address_line2, postcode, city, country, administrator)
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
       
/*entrer données avec le paramètre par défaut admin = faux = 0*/
INSERT INTO User(last_name, first_name, mail, password, phone, address_line1, address_line2, postcode, city, country)
VALUES ("Test", "default", "dt@gmail.com", "azerty1/", "06-07-08-09-10", "rue test", "", "65310", "Horgues", "France");



/*Saisie données - date au format américain pour quelle soit acceptée*/
INSERT INTO new(date, titel, article, picture1, picture2, picture3, picture4, picture5)
VALUES ("2020/12/03", "EPAD Horgues", "Le chantier avance bien après 11 mois de travaux et 1 confinement", "Photo1", "Photo2", "", "", ""),
       ("2020/11/27", "Mairie", "Le chantier est fini !!", "Photo mairie sud", "Photo mairie nord", "", "", ""),
       ("2020/11/15", "Eglise", "Réahibilitation toujours en cours", "Eglise ouest", "", "", "", ""),
       ("2020/11/04", "Maison Soleil", "Jaune soleil", "soleil 1", "Soleil 2", "", "", ""),
       ("2020/10/21", "Villa des Montagnes", "Mais ù est la neige", "neige", "montagne", "", "", ""),
       ("2020/10/09", "Maison 65", "Bon anniversaire Patriicia !!!", "Chocolatine", "Gâteau", "Cadeau 1", "Cadeau 2", "Cadeau 3");



INSERT INTO quote(date, titel, article, picture1, picture2)
VALUES ("2020/12/03", "article du jour", "Hep !!! Bonjour", "Photo 1", "Photo 2"),
        ("2020/12/03", "article 2", "Article !!! Bonjour", "", ""),
        ("2020/12/03", "article 3", "Arttttttttttt !!! Bonjour", "Hello", "Hola"),
        ("2020/12/03", "article 4", "Joyeux Noêl !!! ", "Père Noël", ""),
        ("2020/12/03", "article 5", "Bonne année !!! ", "Houx", "Galette des rois"),
        ("2020/12/03", "article 6", "Meilleurs voeux !!! 2021", "Bonheur", "Santé");



INSERT INTO comment_quote(comment, id_Quote)
VALUES ("RE-bonjour", "1"),
        ("Sapin de Noël !!","4"),
        ("Formation développeuse validée !!!", "6"),
        ("Félicitations !!!!!!!", "6");



INSERT INTO manage(id, id__User)
VALUES("1","1"),
        ("1","2"),
        ("1","3"),
        ("1","4"),
        ("1","5"),
        ("1","6");



INSERT INTO inform(id, id__User)
VALUES("1","1"),
        ("2","1"),
        ("3","1"),
        ("4","1"),
        ("5","1"),
        ("6","1");


INSERT INTO ask(id, id__User)
VALUES("1","1"),
        ("2","1"),
        ("3","1"),
        ("4","1"),
        ("5","1"),
        ("6","1");


