<?php
require('inc/head.php');
require('inc/header.php');
require('inc/footer.php');
?>

<!-- <?php
        //pour vérif
        var_dump($users);
        ?> -->

<div class="container-fluid bg-secondary">


    <div class="row justify-content-center py-4">
        <h1>Utilisateurs</h1>
    </div>

    <div class=" row justify-content-center">
        <div class="row row-cols-1 row-cols-md-3">
            <?php
            foreach ($users as $user) :
            ?>
                <div class="container-fluid">
                    <div class="row ">
                        <div class="col-sm py-2 ">
                            <div class="card bg-success px-2">
                                <h5 class="card-header"><?= $user['id'] . " - " . $user['first_name'] . " " . $user['last_name'] ?></h5>
                                <li class="card-text">Email : <?= $user['mail'] ?></li>
                                <li class="card-text">Nom utilisateur : <?= $user['user_name'] ?></li>
                                <li class="card-text">Mot de passe : <?= $user['password'] ?></li>
                                <li class="card-text">Téléphone : <?= $user['phone'] ?></li>
                                <li class="card-text">Adresse : <?= $user['address_line1'] ?></li>
                                <li class="card-text">complement : <?= $user['address_line2'] ?></li>
                                <li class="card-text">Ville : <?= $user['postcode'] . " " . $user['city'] ?></li>
                                <li class="card-text">Pays : <?= $user['country'] ?></li>
                                <li class="card-text">Administrateur : <?= $user['administrator'] ?></li>
                            </div>
                        </div>
                    </div>
                </div>
            <?php
            endforeach;
            ?>

        </div>
    </div>
</div>