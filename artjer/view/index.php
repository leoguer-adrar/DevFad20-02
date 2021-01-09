<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../style/style.css">
    <title>Artjer Custom Sneakers</title>
</head>

<body>
    <header>
        <h2>Artjer Custom Sneakers</h2>
        <div class="header">
        <img src="../image/logo-etiquette-blanc.png"  width="80px;">
        <ul class="menu">
        <li><a href="#">Accueil</a></li>
        <li><a href="#">Notre Histoire</a></li>
        <li><a href="#">Personnalise tes Sneakers</a></li>
        <li><a href="#">Gallerie</a></li>
        <li><a href="#">Contact</a></li>
        </ul>
        </div>
    </header>
   <div class="maq">
       <ul>
        <?php
        foreach ($maquettes as $maquette) : ?>
            <li><?= $maquette['nom'] ?>
        <?= $maquette['description']?></li>
        <?php endforeach; ?>
    </ul>
    <img src="../image/image1.png" >
    </div>
   
    

</body>

</html>