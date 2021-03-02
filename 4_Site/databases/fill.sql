-- quelques infos pour les tables


USE pfratmarchitecture;


# truncate permet de supprimer des données enregistrées dans les tables.
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE User;
TRUNCATE News;
TRUNCATE Quote;
TRUNCATE Comment_quote;
TRUNCATE Category;
TRUNCATE Project;
TRUNCATE Document;
TRUNCATE manage;
SET FOREIGN_KEY_CHECKS = 1;


# Ajouter des données à une table

INSERT INTO Category(name)
VALUES ("Etablissements publics"),
       ("Etablissements tertiaires"),
       ("Résidentiel");


INSERT INTO User(last_name, first_name, mail, user_name, password, phone, address_line1, address_line2, postcode, city,
                 country, administrator)
VALUES ("Moreau", "Anne", "am@gmail.com", "archi", "azerty1/", "06-07-08-09-10", "16 rue du Pic du Midi", "", "65000",
        "Tarbes", "France", true),
       ("Layerle", "Patricia", "pl@gmail.com", "admin", "azerty1/", "06-07-08-09-10", "65 rue du Pic du Midi", "",
        "65310", "Horgues", "France", true);
# entrer données avec le paramètre par défaut admin = faux = 0
INSERT INTO User(last_name, first_name, mail, user_name, password, phone, address_line1, address_line2, postcode, city,
                 country)
VALUES ("Didou", "Elisa", "ed@gmail.com", "el", "azerty1/", "06-07-08-09-10", "20 rue du Pic du Midi", "Villa Soleuil",
        "65310", "Laloubere", "France"),
       ("Dada", "Jérôme", "jd@gmail.com", "je", "azerty1/", "06-07-08-09-10", "30 rue du Pic du Midi", "", "65310",
        "Odos", "France"),
       ("Sorbet", "Khang", "ks@gmail.com", "kh", "azerty1/", "06-07-08-09-10", "16 rue du Pic du Midi",
        "Appartement 51", "65360", "Momères", "France"),
       ("Dalier", "Alexis", "ad@gmail.com", "al", "azerty1/", "06-07-08-09-10", "59 rue du Pic du Midi", "", "65360",
        "Saint-Martin", "France"),
       ("Alric", "Alex", "aa@gmail.com", "alex", "azerty1/", "06-07-08-09-10", "78 rue du Pic du Midi", "Maison Bueno",
        "65360", "Arcizac", "France"),
       ("Pipereau", "Romain", "rp@gmail.com", "ro", "azerty1/", "06-07-08-09-10", "16 rue du Pic du Midi", "", "65200",
        "Bagnères de Bigorre", "France"),
       ("Marcos", "Hugo", "hm@gmail.com", "hu", "azerty1/", "06-07-08-09-10", "40 rue du Pic du Midi", "Maison Nina",
        "65420", "Ibos", "France"),
       ("Humber", "Corine", "ch@gmail.com", "coco", "azerty1/", "06-07-08-09-10", "26 rue du Pic du Midi", "", "65700",
        "Juillan", "France"),
       ("Marty", "Rémi", "rm@gmail.com", "réré", "azerty1/", "06-07-08-09-10", "75 rue du Pic du Midi", "", "65200",
        "Pouzac", "France"),
       ("Dallas", "Florian", "fd@gmail.com", "flo", "azerty1/", "06-07-08-09-10", "60 rue du Pic du Midi", "", "65300",
        "Lourdes", "France");


# pour tester la page demande devis
INSERT INTO quote(date, title, article, picture1, picture2, id__User)
VALUES (NOW(), "Construction maison",
        "Bonjour, j'ai un projet de construction sur un terrain de 1000 m². Je souhaite une maison avec 2 chambres, 1 salle d'eau et un séjour/cuisine ouverte",
        "terrain1.jpg", "", "3"),
       (NOW(), "Maison d'architecte",
        "Bonjour, j'ai un projet de construction sur un terrain de 2000 m². Je souhaite une maison d'architecte",
        "terrain2.jpg",
        "", "4"),
       (NOW(), "Rénovation",
        "Bonjour, j'ai acheté une maison que je souhaite rénover, je souhaiterais avoir votre avis.",
        "reno.jpg", "", "5"),
       (NOW(), "Maison de rêve",
        "Bonjour, cette maison avec piscine me fait rêver, pouvez vous me chiffrer un tel projet ? je dispose du terrain en photo Merci",
        "projet.jpg", "terrain3.jpg", "6"),
       (NOW(), "Maison médicale",
        "Bonjour, avec mon associé nous souhaitons construire un cabinet médical, pouvez-vous nous contacter.", "", "",
        "7"),
       (NOW(), "Rénovation grange",
        "Bonjour, j'ai acheté une grange que je souhaite rénover en maison, je souhaiterais avoir votre avis.",
        "reno2.jpg", "", "8");



INSERT INTO comment_quote(comment, id_Quote, id__User)
VALUES ("bonne construction !!!", "1", "4"),
       ("bon projet !!!", "1", "4"),
       ("bonne aventure !!!", "1", "4"),
       ("Trop belle maison !!", "4", "3"),
       ("quel beau projet", "4", "3"),
       ("Sur quel village avez-vous ce projet ?", "5", "7"),
       ("Nous avons besoin de docteurs sur la commune d'Ibos", "5", "7"),
       ("Quel beau projet", "3", "6");


# Saisie données - date au format américain pour quelle soit acceptée
# now() pour date en automatique
INSERT INTO news(date, title, article, picture1, picture2, picture3, picture4, picture5, id__User)
VALUES (NOW(), "EPAD Horgues", "Le chantier avance bien après 11 mois de travaux et 1 confinement", "hepadHorgues.jpg",
        "hepadHorgues2.jpg", "", "", "", "1"),
       (NOW(), "Mairie", "Le chantier est fini !!", "mairie.jpg", "mairie.jpg", "mairie.jpg", "mairie.jpg",
        "mairie.jpg", "1"),
       (NOW(), "Eglise", "Réahibilitation toujours en cours", "eglise.jpg", "", "", "", "", "1"),
       (NOW(), "Maison Soleil", "Jaune soleil", "maisonSoleil.jpg", "", "", "", "", "1"),
       (NOW(), "Villa des Montagnes", "Ce très beau projet arrive à la fin", "villaMaontagne.jpg", "", "", "", "", "1"),
       (NOW(), "Zone Arsenal", "Je vais participer à la réabilitation de la zone Arsenal", "arsenal.jpg", "arsenal.jpg",
        "", "", "", "1");



INSERT INTO Project(name, project_city, service, master_builder, master_builder_adress, master_builder_CP,
                    master_builder_city,
                    amount_HT, surface, surface_site, surface_building, status, end_date, id_Category)
VALUES ("Rénovation d'une maison individuelle en Office Notarial", "TARBES (65)", "Esquisse à Permis de Construire",
        "Pascale TEULÉ", "28 Rue Carnot", "65000", "TARBES", 100000, 150, 0, 0, "Réalisé", 2018, 2),
       ("Embellissement des façades, Création d'un circuit de visite et mise en conformité des bâtiments", " ",
        "Esquisse à Permis de Construire", "SAS ABEILLES SANTÉ", "23b Avenue du Mamelon Vert", "65110", "CAUTERETS",
        150000, 0, 6600, 2030, "Travaux en cours", 2018, 2),
       ("Création de bureaux dans un ancien entrepôt", "BILLERE (64)", "Esquisse à Permis de Construire", "BEC", "6 rue de l'Abbé
Grégoire", "64140", "BILLERE", 150000, 434, 0, 0, "Réalisé", 2018, 2),
       ("Construction d'un Rucher", "MOLLEGES (13)", "Esquisse à Permis de Construire", "SAS ABEILLES SANTÉ",
        "23b Avenue du Mamelon Vert", "65110", "CAUTERETS", 500000, 500, 0, 0, "Mission
terminée", 2018, 2),
       ("Construction d'un Abattoir", "Sassis (65)", "Mission de base", "CCPVG", "1 Rue Saint Orens", "65400", "ARGELES
GAZOST", 1856000, 0, 6400, 780, "Mission terminée", 2019, 2),
       ("Rénovation du collège Blanche Odin", "BAGNERES (65)", "Mission de base",
        "Département des Hautes Pyrénées (65)",
        "", "", "", 95000, 300, 0, 0, "Réalisé", 2019, 1),
       ("Accessibilité du collège Gaston Febus", "LANNEMEZAN (65)", "Mission de base Esquisse à Réception chantier", "Département des
Hautes Pyrénées (65)", "", "", "", 163000, 0, 0, 0, "Réalisé", 2019, 1),
       ("Construction d'une Maison Individuelle", "GER (64)", "Mission de base Esquisse à Réception chantier", "Privé",
        "", "", "", 210000, 150, 0, 0, "Réalisé", 2019, 3),
       ("Projet de rénovation de locaux sociaux", "ARGELES GASOST (65)", "Etude préliminaire", "CCPVG 65", "", "", "",
        60000, 0, 0, 0, "Terminé", 2019, 1),
       ("Réhabilitation d'un Bâtiment pour services médicaux", "TARBES (65)", "Concours", "Ministère des Armées",
        "223 rue de Bègles", "33068", "Bordeaux", 3165000, 1068, 0, 0, "Terminé", 2019, 1),
       ("Construction d'une Maison Individuelle ", "VISKER (65)", "Mission de base Esquisse à Réception chantier",
        "Privé", "", "", "", 370000, 0, 0, 0, "", 2020, 3),
       ("Rénovation Foyer Oustal", "SEMEAC (65)", "Esquisse à Permis de Construire", "Fonds Dotation Jean
Baptiste Le Bideau", "48 Rue de la Charité", "16000", "ANGOULEME", 950000, 0, 0, 0, "Travaux en cours", 2021, 1),
       ("Rénovation Foyer Pyrénées ", "LANNEMEZAN (65)", "Esquisse à Permis de Construire", "Fonds Dotation Jean
Baptiste Le Bideau", "48 Rue de la Charité", "16000", "ANGOULEME", 850000, 0, 0, 0, "Travaux en cours", 2021, 1),
       ("Construction d'une Maison Individuelle", "LOURDES (65)", "Privé", "", "", "", "", 280000, 160, 0, 0,
        "Travaux en cours", 2020, 3),
       ("Exetension d'une Maison Individuelle ", "AUREILHAN (65)", "Esquisse à PC", "Privé", "", "", "", 100000, 50, 0,
        0, "Travaux en cours", 2020, 3),
       ("Construction d'une Maison Individuelle", "GER (64)", "Mission de base Esquisse à Réception chantier", "Privé",
        "", "", "", 300000, 250, 0,
        0, "Travaux en cours", 2020, 3),
       ("Construction d'un Cabinet Médical", "LESTELLE BETHARRAM (64)", "Mission de base Esquisse à Réception chantier",
        "SCI DIM ISARCE", "22 Place Saint Jean", "64800", " BRUGES CAPBIS MIFAGET", 400000, 150, 0, 0,
        "Travaux en cours", 2020, 2),
       ("Rénovation thermique du collège Gaston Febus", "LANNEMEZAN (65)", "Membre groupement Energeco Mission de base", "Département des
Hautes Pyrénées (65)", "", "", "", 927000, 0, 0, 0, "APD", 2021, 1);



INSERT INTO manage(id_Project, id__User)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (5, 1),
       (6, 1),
       (7, 1),
       (8, 1),
       (9, 1),
       (10, 1),
       (11, 1),
       (12, 1),
       (13, 1),
       (14, 1),
       (15, 1),
       (16, 1),
       (17, 1),
       (18, 1);



INSERT INTO Document(name, id_Project)
VALUES ("CaptureLestelleMaisonMed.jpg", 17),
       ("CaptureLestelleMaisonMed2.jpg", 17),
       ("CaptureCOLLEGE_LANNEMEZAN_03.jpg", 18),
       ("CaptureCOLLEGE_LANNEMEZAN_07.jpg", 18),
       ("CaptureCOLLEGE_LANNEMEZAN_11.jpg", 18),
       ("capture06 PC5 FACADES EST _ OUEST PROJET.jpg", 1),
       ("2fdbe0d7-3be9-40c8-be97-ddd27dd33491.JPG", 1),
       ("84b690e1-5f38-4225-b81c-7bfa996434b1.JPG", 1),
       ("5744cffc-fd88-4914-91ec-d089fb4bdc1f.JPG", 1),
       ("cac2ed20-3c0e-4fa3-9039-01a9cd7c9211.JPG", 1),
       ("ea30db86-7c12-4385-bc92-7f2cd70d5f1b.JPG", 1),
       ("CaptureRucherMollege.jpg", 4),
       ("CaptureRucherMollege2.jpg", 4),
       ("CaptureABATTOIR_SASSIS.jpg", 5),
       ("CaptureABATTOIR_SASSIS_2.jpg", 5),
       ("CaptureABATTOIR_SASSIS_5.jpg", 5),
       ("CaptureABATTOIR_SASSIS_6.jpg", 5),
       ("CaptureVillaGer2019.jpg", 8),
       ("CaptureExtensionAUREILHAN.jpg", 15),
       ("CaptureExtensionAUREILHAN_7.jpg", 15),
       ("CaptureVillaGer2021_.jpg", 16),
       ("CaptureVillaGer2021_1.jpg", 16),
       ("CaptureVillaGer2021_3.jpg", 16),
       ("CapturePavillonAbeilless_08.jpg", 2),
       ("CaptureAbeilles_.jpg", 2),
       ("CaptureAbeilles_2.jpg", 2),
       ("CaptureAbeilles_3.jpg", 2),
       ("CaptureAbeilles_4.jpg", 2);


