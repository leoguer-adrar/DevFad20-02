<?php
require('inc/head.php');
require('inc/header.php');
require('inc/footer.php');
?>

<!-- <?php
        //pour vérif
        var_dump($quotes);
        ?> -->


<div class="container-fluid bg-secondary">

<div class="row justify-content-center py-2">
    <h1>Blog Demande de Devis</h1>
</div>

<?php
foreach ($quotes as $quote) :
?>
    <div class="container-fluid py-2 bg-secondary">
        <div class="card">
            <div class="card bg-info " style="">
                <div class="card-body">
                    <h5 class="card-title"><?= $quote['title'] . " - " . $quote['date'] ?></h5>
                    <p class="card-text"><?= $quote['article'] ?></p>
                    <p class="card-text"><?= $quote['picture2'] ?></p>
                    <p class="card-text"><?= $quote['picture2'] ?></p>
                    <!-- <img class="card-img-top" src="../View/inc/logo_julia.jpg" alt="Card image cap">
                    <img class="card-img-top" src="../View/inc/logo_julia.jpg" alt="Card image cap"> -->

                    <!-- <a href="#" class="btn btn-primary" method="get">Lire l'Article</a> -->
                </div>
            </div>
        </div>
    </div>
<?php
endforeach;
?>
</div>
