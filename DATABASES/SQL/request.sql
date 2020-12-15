use ju_petillant;

-- truncate permet de supprimer des données enregistrées dans les tables.
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE  utilisateur;
TRUNCATE article;
TRUNCATE  formulaire_contact;
TRUNCATE  commentaire;
TRUNCATE  photo;
TRUNCATE  categorie;
TRUNCATE  associer;
TRUNCATE  gerer;
SET FOREIGN_KEY_CHECKS = 1;

-- Ajouter des données à une table
INSERT INTO categorie (nom_categorie)
VALUES ("Creations"),
("Voyages"),
("Recettes"),
("Recettes");

INSERT INTO article (titre_article, contenu_article, datecreation_article, datemodification_article, slug_article, id_categorie, id_utilisateur )
VALUES ("Comment je créée mes bijoux", "Introduction.......", now(), now(), "blog/bijoux", 1, 1),
("1ère recette de brownie", "Introduction.......", now(), now(), "blog/recette", 3, 1),
("2ère recette de crêpes", "Introduction.......", now(), now(), "blog/recette", 3, 1),
("Liste des produits", "paire de boucles d'oreilles", now(), now(), "blog/bijoux", 1, 1);

-- modifier des données sur une table
UPDATE categorie
SET nom_categorie= "Tricots"
WHERE id=2;

-- Supprimer des données sur une table
DELETE FROM categorie
WHERE id=4;

-- INNER JOIN explications
-- Je cherche dans les tables article et categorie les attributs mentionnés dans le SELECT, 
-- j'associe la table article à la table categorie
-- je lui dit que l'id 'id_categorie' de la table articles correspond à l'id 'id' de la table categorie
SELECT categorie.nom_categorie, article.titre_article, article.contenu_article, article.datecreation_article, article.slug_article
FROM article
INNER JOIN categorie
ON article.id_categorie=categorie.id