USE hexadices;

DROP TABLE IF EXISTS `session`;
DROP TABLE IF EXISTS `setting`;
DROP TABLE IF EXISTS `character`;

/*	Database Creation
	column			type			Nullable	options
*/

CREATE TABLE `session` (
	`id`			INT UNSIGNED		NOT NULL	AUTO_INCREMENT PRIMARY KEY,
	
	`name`			CHAR(128)			NOT NULL,
	`inviteCode`	CHAR(6)				NOT NULL,	/* Code d'invitation généré lors de la creation de la séance */

	`ownerId`		CHAR(64)			NOT NULL,
	`settingId`		INT UNSIGNED		NOT NULL,

	`updatedAt`		DATETIME			NOT NULL	 DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`createdAt` 	DATETIME			NOT NULL	 DEFAULT CURRENT_TIMESTAMP,

	`deleted`		TINYINT(1) UNSIGNED	DEFAULT 0,

	CONSTRAINT UK_INVITE UNIQUE (`inviteCode`)
);

CREATE TABLE `setting` (
	`id`			INT UNSIGNED	NOT NULL	AUTO_INCREMENT PRIMARY KEY,

	`name`			CHAR(128)		NOT NULL,

	`generic`		JSON				DEFAULT NULL,/* Options génériques (Onglets, Valeurs affichés, Configurations des dès) */
	`theming`		JSON				DEFAULT NULL,/* Options de theme (Couleurs, Polices d'affichage, Icônes, changements conditionnels) */
	`addons`		JSON				DEFAULT NULL,/* Options utilisé par les Addons mappé par nom de l'addon */

	`updatedAt`		DATETIME			NOT NULL	 DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`createdAt` 	DATETIME			NOT NULL	 DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE `character` (
	`id`			INT UNSIGNED	NOT NULL	AUTO_INCREMENT PRIMARY KEY,

	`firstName`		CHAR(128)			DEFAULT NULL,
	`lastName`		CHAR(128)			DEFAULT NULL,
	`nickName`		CHAR(128)			DEFAULT NULL,
	`lore`			TEXT				DEFAULT NULL,/* Description / Histoire du personnage */

	`statut`		JSON				DEFAULT NULL,/* Statut du personnage (États, Statuts, Conditions, Équipement actuel) */
	`inventory`		JSON				DEFAULT NULL,/* inventaire de la fiche personnage (Objet, Arme, Équipement, Argent) */
	`data`			JSON				DEFAULT NULL,/* Données de la fiche personnage () */
	`addons`		JSON				DEFAULT NULL,/* Options utilisé par les Addons mappé par nom de l'addon */

	`updatedAt`		DATETIME			NOT NULL	 DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`createdAt` 	DATETIME			NOT NULL	 DEFAULT CURRENT_TIMESTAMP,

	`deleted`		TINYINT(1) UNSIGNED	DEFAULT 0
);
