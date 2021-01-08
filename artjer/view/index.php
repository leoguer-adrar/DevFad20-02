<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Artjer Custom Sneakers</title>
</head>
<body>
<h2>Artjer Custom Sneakers</h2>
<ul>

    <?php
   
    foreach ($maquettes as $maquette): ?>
    
        <li><?= $maquette['nom'] ?></li>
    <?php endforeach; ?>
</ul>
</body>
</html>