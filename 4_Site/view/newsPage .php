//TODO: page entièrement à faire

<?php
require('inc/head.php');
require('inc/header.php');
debug($_SESSION);
unset($_SESSION['success']);
?>

<head>
    <title>Actualités</title>
</head>

<?php
////pour vérif
//var_dump($quotes);
//
?>


<div class="container-fluid">

    <div class="row justify-content-center py-2">
        <h1>Mon actu</h1>
    </div>

    <div class="d-flex justify-content-center py-3">
        <a href="" id="buttConnectionUser" class="btn btn-secondary btn-lg mx-2">Connexion à son compte</a>
        <a href="" id="buttCreateUser" class="btn btn-secondary btn-lg mx-2">Création compte</a>
        <a href="/quotes/create" id="buttCreateQuote" class="btn btn-secondary btn-lg mx-2">Ecrire une demande</a>
    </div>


    <div class="row justify-content-center py-3">
        <h5>Pour faire une demande de devis ou faire un commentaire vous devez vous connecter à vontre compte ou créer un compte ! Merci</h5>
    </div>


    <div class="row">
        <?php
        foreach ($quotes
                 as $quote) :
            ?>
        <div class="col-sm-6">
        <div class="card bg-cardColorQuote p-2" style="">
                    <div class="card-body">
                        <h5 class="card-title"><?= date("d F Y", strtotime($quote['date'])) . " - " . $quote['title'] ?></h5>
                        <p class="card-text"><?= $quote['article'] ?></p>
                        <div class="container-fluid row text-left">
                            <?php if ($quote['picture1'] !== 'null') : ?>
                                <p class="card-text">
                                    <img src="/images/quotes/<?= $quote['picture1'] ?>" alt="" width="200" wheight="auto">
                                </p>
                            <?php
                            endif;
                            if ($quote['picture2'] !== 'null') : ?>
                                <p class="card-text px-2">
                                    <img src="/images/quotes/<?= $quote['picture2'] ?>" alt="" width="200" wheight="auto">
                                </p>
                            <?php endif; ?>
                        </div>
                        <div class="d-flex py-2">
                            <a href="" id="buttComment" class="btn btn-secondary btn-sm">Commenter</a>
                        </div>

                        <div>
                            <?php $count = 0 ?>
                            <?php foreach ($comments as $key => $comment) : ?>
                                <?php if ($comment['id_Quote'] === $quote['id']) : ?>
                                    <?php $count += 1 ?>
                                    <?php if($count === 1) : ?>
                                        <p>Commentaires :</p>
                                    <?php endif; ?>
                                    <p class="card-text"><?= $comment['comment'] ?></p>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        </div>


                    </div>
                </div>
        </div>
        <?php endforeach; ?>
    </div>

</div>
<?php
require 'inc/footer.php';
debug($comments);
