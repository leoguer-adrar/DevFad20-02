<?php

require('inc/head.php');
require('inc/header.php');
require('inc/footer.php');


?>

<!-- <?php
//pour vérif
var_dump($quotes);
?> -->




<?php
foreach ($quotes as $quote) :
?>
    <div class="container-fluid bg-warning">
        <div class="row">
            <div class="col-sm-4">
                <div class="card bg-info " style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title"><?= $quote['title'] ?></h5>
                        <h5 class="card-title"><?= $quote['date'] ?></h5>
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
    </div>
<?php
endforeach;
?>
