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
VALUES ("Comment je créée mes bijoux", "Introduction.......", now(), now(), "blog/bijoux", 1, 1),
("1ère recette de brownie", "Introduction.......", now(), now(), "blog/recette", 3, 1),
("2ère recette de crêpes", "Introduction.......", now(), now(), "blog/recette", 3, 1),
("Liste des produits", "paire de boucles d'oreilles", now(), now(), "blog/bijoux", 1, 1);

-- modifier des données sur une table
UPDATE categories
SET nom_categorie= "Tricots"
WHERE id=2;

-- Supprimer des données sur une table
DELETE FROM categories
WHERE id=4;

-- INNER JOIN explications
-- Je cherche dans la table articles les attributs mentionnés dans le SELECT, 
-- j'associe la table articles à la table categories 
-- je lui dit que l'id 'id_categorie' de la table articles correspond à l'id 'id' de la table categories
SELECT categories.nom_categorie, articles.titre_article, articles.contenu_article, articles.datecreation_article, articles.slug_article
FROM articles
INNER JOIN categories
ON articles.id_categorie=categories.id