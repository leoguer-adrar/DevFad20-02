<head>
    <title>DemandeDevis</title>
</head>

<?php
require('inc/head.php');
require('inc/header.php');
debug($_SESSION);
unset($_SESSION['success']);
?>

<?php
////pour vérif
//var_dump($quotes);
//
?>


<div class="container-fluid">

    <div class="row justify-content-center py-2">
        <h1>Demande de Devis</h1>
    </div>

    <div class="d-flex justify-content-center py-3">
        <a href="" id="buttConnectionUser" class="btn btn-secondary btn-lg mx-2">Connexion à son compte</a>
        <a href="" id="buttCreateUser" class="btn btn-secondary btn-lg mx-2">Création compte</a>
        <a href="/quotes/create" id="buttCreateQuote" class="btn btn-secondary btn-lg mx-2">Ecrire une demande</a>
    </div>

    <div class="row justify-content-center py-3">
        <h5>Pour écrire dans cette page vous devez vous connecter à vontre compte ou créer un compte ! Merci</h5>
    </div>

    <div>
        <?php
        foreach ($quotes

            as $quote) :
        ?>
            <div class="card">
                <div class="card bg-cardColorQuote" style="">
                    <div class="card-body">
                        <h5 class="card-title"><?= date("d F Y", strtotime($quote['date'])) . " - " . $quote['title'] ?></h5>
                        <p class="card-text"><?= $quote['article'] ?></p>
                        <div class="container-fluid row text-left">
                            <?php if ($quote['picture1'] !== 'null') : ?>
                                <p class="card-text pe-2">
                                    <img src="/images/quotes/<?= $quote['picture1'] ?>" alt="" width="200">
                                </p>
                            <?php
                            endif;
                            if ($quote['picture2'] !== 'null') : ?>
                                <p class="card-text">
                                    <img src="/images/quotes/<?= $quote['picture2'] ?>" alt="" width="200">
                                </p>
                            <?php endif; ?>
                        </div>
                        <div class="d-flex py-2">
                            <a href="" id="buttComment" class="btn btn-secondary btn-sm">Commenter</a>
                        </div>



                        <!--                        fonctionne pour toutes les cards sauf la 1ère-->
                        <?php
                        if ($comment['id_Quote'] === $quote['id']) : ?>
                            <p>Commentaires :</p>
                        <?php endif;
                        ?>





                        <div class="container-fluid">
                            <p>Commentaires :</p>
                            <?php
                            foreach ($comments as $comment) :
                                if ($comment['id_Quote'] === $quote['id']) : ?>
                                    <p class="card-text"><?= $comment['comment'] ?></p>
                            <?php endif;
                            endforeach;
                            ?>
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
