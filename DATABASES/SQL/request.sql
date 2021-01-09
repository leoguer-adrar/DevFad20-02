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
("Tricots"),
("Recettes"),
("Recettes");

INSERT INTO article (title, content, creationDate, modificationDate, slug, id_category, id_user )
VALUES ("Les bijoux Miyuki", "Maecenas vitae faucibus leo. Vestibulum consectetur libero nibh, vitae hendrerit arcu elementum id. Nullam sodales faucibus lobortis. Donec ante ante, aliquam ut auctor eu, pellentesque sit amet diam. Proin in dui sapien. Fusce pulvinar lacus nec eros ultricies, sed gravida eros aliquam.", now(), now(), "blog/bijoux", 1, 1),
("Recette brownie", "Aliquam semper odio mollis nunc eleifend, sit amet porttitor erat convallis. Curabitur rutrum sem libero. Aenean tincidunt nibh a dignissim ultrices. In tincidunt mauris nec augue rhoncus, nec consectetur orci egestas.", now(), now(), "blog/recettes", 3, 1),
("Mon voyage au Canada", "Aliquam semper odio mollis nunc eleifend, sit amet porttitor erat convallis. Curabitur rutrum sem libero. Aenean tincidunt nibh a dignissim ultrices. In tincidunt mauris nec augue rhoncus, nec consectetur orci egestas.", now(), now(), "blog/voyages", 2, 1),
("Recette Pancake", "Maecenas vitae faucibus leo. Vestibulum consectetur libero nibh, vitae hendrerit arcu elementum id. Nullam sodales faucibus lobortis. Donec ante ante, aliquam ut auctor eu, pellentesque sit amet diam. Proin in dui sapien. Fusce pulvinar lacus nec eros ultricies, sed gravida eros aliquam.", now(), now(), "blog/recettes", 3, 1),
("Voyage humanitaire en Birmanie", "Aliquam semper odio mollis nunc eleifend, sit amet porttitor erat convallis. Curabitur rutrum sem libero. Aenean tincidunt nibh a dignissim ultrices. In tincidunt mauris nec augue rhoncus, nec consectetur orci egestas.", now(), now(), "blog/voyages", 2, 1),
("Création bracelet", "Aliquam semper odio mollis nunc eleifend, sit amet porttitor erat convallis. Curabitur rutrum sem libero. Aenean tincidunt nibh a dignissim ultrices. In tincidunt mauris nec augue rhoncus, nec consectetur orci egestas.", now(), now(), "blog/bijoux", 1, 1);

-- modifier des données sur une table
UPDATE category
SET `name`= "Voyage"
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