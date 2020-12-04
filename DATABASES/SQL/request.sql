use ju_petillant;

-- truncate permet de supprimer des données enregistrées dans les tables.
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE  utilisateurs;
TRUNCATE articles;
TRUNCATE  formulaires_contact;
TRUNCATE  commentaires;
TRUNCATE  photos;
TRUNCATE  categories;
TRUNCATE  associer;
TRUNCATE  gerer;
SET FOREIGN_KEY_CHECKS = 1;

-- Ajouter des données à une table
INSERT INTO categories (nom_categorie)
VALUES ("Creations"),
("Voyages"),
("Recettes"),
("Recettes");

INSERT INTO articles (titre_article, contenu_article, datecreation_article, datemodification_article, slug_article, id_categorie, id_utilisateur )
VALUES ("Comment je créée mes bijoux", "Introduction.......", now(), now(), "blog/bijoux", 1, 1);

-- modifier des données sur une table
UPDATE categories
SET nom_categorie= "Tricots"
WHERE id=2;

-- Supprimer des données sur une table
DELETE FROM categories
WHERE id=3;
