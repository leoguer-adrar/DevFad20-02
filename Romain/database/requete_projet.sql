--Insertion de données dans vos tables,

use projet_pizza;

INSERT INTO produitbrut (nom_pb, stock_pb)
Values ("sauce_tomate", 10),
("mozzarella", 10),
("jambon", 20),
("ananas", 10),
("anchois", 30),
("olives", 40),
("champignons", 20);

INSERT INTO typepf (nom_type_pf)
Values ("pizza"),
("boisson");

INSERT INTO produitfinis (nom_pf, prix_vente_pf, id_type_pf)
Values ("reine", 10, 1),
("napolitaine", 11, 1),
("hawaienne", 12, 1),
("coca", 3, 2),
("oasis", 2.50, 2);

INSERT INTO fabriquer (id_pf, id_pb)
Values (1, 2),
(1, 3),
(1, 4),
(1, 8);

INSERT INTO fabriquer (id_pf, id_pb)
Values (2, 2),
(2, 3),
(2, 6),
(2, 7);

INSERT INTO fabriquer (id_pf, id_pb)
Values (3, 2),
(3, 3),
(3, 4),
(3, 5);



--Modification de données dans vos tables,

use projet_pizza;

UPDATE produitfinis
SET stock_pf=30
WHERE id_type_pf=2;





--Suppression de données dans vos tables,

use projet_pizza;

DELETE FROM produitbrut
WHERE nom_pb="lardons";





--Sélection de données dans vos tables avec des jointures,


--Sélectionne toutes les colonnes dans la table "produitbrut"
use projet_pizza;

select *
from produitbrut;


--Sélectionne les colonnes "nom_pf" et "nom_type_pf" qui ont uniquement une id_type_pf = 1 (id_type_pf 1 étant le type "pizza")
use projet_pizza;

select nom_pf, nom_type_pf
from produitfinis
INNER JOIN typepf
ON produitfinis.id_type_pf = typepf.id_type_pf
WHERE produitfinis.id_type_pf = 1;



--Sélectionne la colonnes "nom_pb" uniquement de ceux qui sont associé dans la table "fabriquer" avec une id_pf = 1 (id_pf 1 étant le produit finis "reine")
use projet_pizza;

select nom_pb
from produitbrut
INNER JOIN fabriquer
ON produitbrut.id_pb = fabriquer.id_pb
WHERE fabriquer.id_pf = 1;


