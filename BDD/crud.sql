-- -- #######################################################
-- -- #########--      INSERTION
-- -- #####################################################

-- DROP DATABASE restaurant;
USE restaurant;

INSERT INTO Administrateurs(`name`,surname,email,`password`,date_creation) VALUES 
    ("Anakin","Anakin","Anakin","Anakin","2018-12-05"),
    ("DarkVador","DarkVador","DarkVador","DarkVador","2018-12-05"),
    ("ObiWan","ObiWan","ObiWan","ObiWan","2018-12-05"),
    ("Yoda","Yoda","Yoda","Yoda","2018-12-05");

INSERT INTO Messages(sender_name,sender_surname,sender_email,sender_phone,content,`state`) VALUES 
    ("Yoda","Yoda","Yoda","000000","deeeeeededeed",1),
    ("Darkvador","Darkvador","Darkvador","0000","ddddddddddd",1),
    ("Obiwan","Obiwan","Obiwan","0000","ddddddddddd",1),
    ("Anakin","Anakin","Anakin","0000","ddddddddddd",1);

INSERT INTO Reservations(`name`,surname,email,phone,size,date_reservation,date_creation) VALUES 
    ("Yoda","Yoda","Yoda","0000000",6,"2020-03-12","2020-03-12"),
    ("Anakin","Anakin","Anakin","0000000",6,"2020-09-12","2020-01-12"),
    ("Obiwan","Obiwan","Obiwan","0000000",6,"2020-08-12","2020-01-12"),
    ("Darkvador","Darkvador","Darkvador","0000000",6,"2020-05-12","2020-01-12");

INSERT INTO Menus(`name`,date_creation) VALUES
    ("Janvier","2020-01-12"),
    ("Fevrier","2020-01-12"),
    ("Mars","2020_12_04");

INSERT INTO Types(`name`) VALUES
    ("Entree"),
    ("Viande"),
    ("Dessert");

INSERT INTO Dishes(`name`,date_creation,id_type) VALUES
    ("Cassoulet","2020-01-12",2),
    ("Lasagne","2020-01-12",2),
    ("Tarte","2020-01-12",3),
    ("Oeufs mayo","2020-01-12",1);



INSERT INTO Contenir(id_dish,id_menu) VALUES 
    ((SELECT id FROM Dishes WHERE `name` = "Cassoulet" LIMIT 1),(SELECT id FROM Menus WHERE `name` = "Janvier" LIMIT 1)),
    ((SELECT id FROM Dishes WHERE `name` = "Lasagne" LIMIT 1),(SELECT id FROM Menus WHERE `name` = "Fevrier" LIMIT 1));


-- #######################################################
-- #########--      SELECTION
-- #####################################################

(SELECT `name` FROM Administrateurs) UNION ALL (SELECT `sender_name` FROM Messages);

-- #######################################################
-- #########--      MODIFICATION
-- #####################################################

UPDATE Administrateurs SET `password` = "monsuperpassword" WHERE `surname` = "Anakin" LIMIT 1;

-- -- #######################################################
-- -- #########--      SUPPRESSION
-- -- #####################################################

DELETE FROM Reservations WHERE email = "Yoda" AND date_reservation = "2020-03-12" LIMIT 1;


-- -- #######################################################
-- -- #########--      INNERJION
-- -- #####################################################

SELECT Menus.name AS Menu_name, 
    Menus.date_creation AS Menus_date_creation, 
    Dishes.name AS Dish_name 
    FROM Menus 
        INNER JOIN Contenir ON id = Contenir.id_menu 
        INNER JOIN Dishes ON Dishes.id = Contenir.id_dish;




