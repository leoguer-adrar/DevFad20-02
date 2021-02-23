<head>
    <title>Demande de devis</title>
</head>


<?php
require('inc/head.php');
require('inc/header.php');
debug($_SESSION);
unset($_SESSION['errors']);
?>
<form action="/quotes/create/add" method="POST" enctype="multipart/form-data">

    <div class="form-group">
        <label for="title">Titre</label>
        <input type="text" class="form-control" id="title" name="title">
    </div>
    <div class="form-group">
        <label for="exampleFormControlTextarea1">Votre demande</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" name="comment"></textarea>
    </div>

    <div class="form-group">
        <h6>Vous pouvez mettre 2 photos au format jpeg, jpg ou png</h6>
        <label for="picture1Quote">Ajouter photo 1</label>
        <input type="file" class="form-control-file" id="picture1Quote" name="picture1">
    </div>
    <div class="form-group">
        <label for="picture2Quote">Ajouter photo 2</label>
        <input type="file" class="form-control-file" id="picture2Quote" name="picture2">
    </div>

    <div>
        <button type="submit" class="btn btn-primary mb-2" onclick="">Publier</button>
        <a href="/quotes" id="buttConnectionUser" class="btn btn-primary mb-2">Annuler</a>
    </div>

</form>
<?php
require('inc/footer.php');
?>

