USE hexadices;

UPDATE `setting` SET `name` = `Mes nouveaux paramètres`, `generic` = '{"dices": [2, 6, 8, 20, 100]}' WHERE `id` = ?;