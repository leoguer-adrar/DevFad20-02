USE hexadices;

INSERT INTO `character` (
    `firstName`,
	`lastName`,
	`nickName`,
	`lore`,

	`statut`,
	`inventory`,
	`data`
) VALUES (
    'Alexis',
    'Balthazard',
    'Dr Ternaire',
    'Alexis est un developpeur adorant utiliser les ternaires, rendant impossible a lire son code a autruit.',

    NULL,
    '{"actives": [{"id": 2, "name": "Pc portable"}, {"id": 3, "name": "Bâton en bois"}]}',
    '{"class": "Developper"}'
);