use projet;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE  user;
TRUNCATE  game;
TRUNCATE  bug;
TRUNCATE  contact;
TRUNCATE  comment;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO game(id_bug, name_game) 
Values (1, "Zelda Ocarina of time"),
(2, "Zelda Majora's Mask");

INSERT INTO user(pseudo, email, password)
Values ("AB", "CD", "EF"),
("AB", "CD", "EF"),
("AB", "CD", "EF");

INSERT INTO bug(title_bug, description_bug, video_bug, id_user, id_game, date_bug) 
Values ("Wrong Warp", "teleportation...", "htpp...", 2, 1, now());

UPDATE game 
set name_game ="Zelda ocarina of Time 64"
WHERE id_game=1;

UPDATE game 
set name_game ="Zelda Majora's Mask 64"
WHERE id_game=2;

UPDATE user
SET pseudo="Mimi"
WHERE id_user=1;

DELETE FROM user
WHERE id_user=3;

SELECT game.name_game,bug.title_bug, bug.description_bug, bug.video_bug -- Je cherche dans la table bugs les attributs du SELECT, 
FROM bug --de bugs
inner JOIN game --dans table jeux
ON bug.id_game = game.id_game	-- je lui dis que l'id id_jeu de la table bugs correspond à l'id id_jeu de la table jeux