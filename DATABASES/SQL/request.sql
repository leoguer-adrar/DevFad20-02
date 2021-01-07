use ju_petillant;

-- truncate permet de supprimer des données enregistrées dans les tables.
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE  `user`;
TRUNCATE article;
TRUNCATE  form;
TRUNCATE  `comment`;
TRUNCATE  picture;
TRUNCATE  category;
TRUNCATE  associate;
TRUNCATE  manage;
SET FOREIGN_KEY_CHECKS = 1;

-- Ajouter des données à une table
INSERT INTO category (`name`)
VALUES ("Creations"),
("Voyages"),
("Recettes"),
("Recettes");

INSERT INTO article (title, content, creationDate, modificationDate, slug, id_category, id_user )
VALUES ("Comment je créée mes bijoux", "Introduction.......", now(), now(), "blog/bijoux", 1, 1),
("1ère recette de brownie", "Introduction.......", now(), now(), "blog/recette", 3, 1),
("2ère recette de crêpes", "Introduction.......", now(), now(), "blog/recette", 3, 1),
("Liste des produits", "paire de boucles d'oreilles", now(), now(), "blog/bijoux", 1, 1);

-- modifier des données sur une table
UPDATE category
SET `name`= "Tricots"
WHERE id=2;

-- Supprimer des données sur une table
DELETE FROM category
WHERE id=4;

-- INNER JOIN explications
-- Je cherche dans les tables article et categorie les attributs mentionnés dans le SELECT, 
-- j'associe la table article à la table categorie
-- je lui dit que l'id 'id_categorie' de la table articles correspond à l'id 'id' de la table categorie
SELECT category.name, article.title, article.content, article.creationDate, article.slug
FROM article
INNER JOIN category
ON article.id_category=category.id