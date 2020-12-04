use projet;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE  utilisateurs;
TRUNCATE  jeux;
TRUNCATE  bugs;
TRUNCATE  contacts;
TRUNCATE  commentaires;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO jeux(id_bug, nom_jeu) 
Values (1, "Zelda Ocarina of time"),
(2, "Zelda Majora's Mask");

INSERT INTO utilisateurs(pseudo, email, motdepasse)
Values ("AB", "CD", "EF"),
("AB", "CD", "EF"),
("AB", "CD", "EF");

INSERT INTO bugs(titre_bug, description_bug, video_bug, id_utilisateur, id_jeu, datebug) 
Values ("Wrong Wrap", "teleportation...", "htpp...", 2, 1, now());

UPDATE jeux 
set nom_jeu ="Zelda ocarina of Time 64"
WHERE id_jeu=1;

UPDATE jeux 
set nom_jeu ="Zelda Majora's Mask 64"
WHERE id_jeu=2;

UPDATE utilisateurs
SET pseudo="Mimi"
WHERE id_utilisateur=1;

DELETE FROM utilisateurs
WHERE id_utilisateur=3;

SELECT jeux.nom_jeu,bugs.titre_bug, bugs.description_bug, bugs.video_bug -- Je cherche dans la table bugs les attributs du SELECT, 
FROM bugs --de bugs
inner JOIN jeux --dans table jeux
ON bugs.id_jeu = jeux.id_jeu	-- je lui dis que l'id id_jeu de la table bugs correspond à l'id id_jeu de la table jeux