<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>
    <link
      rel="stylesheet" href="cssprojetphpbug.css"/>
</head>
<body>
    <!-- Poster un bug -->
    <div class="container-fluid">
      <div class="containerbug">
        <h2 class="titlebug" >Poster un bug</h2>
        <!-- <hr class="w-50"> -->
            <div class="groupe">
              <label for="pseudo">Titre</label>
              <input type="text" class="form-control" id="pseudo">
            </div>
            <div class="groupe">
              <label for="description">Description</label>
              <textarea name="description" id="textarea" class="form-control" cols="25" rows="8"></textarea>
            </div>
            <div class="groupe">
              <label for="text">Vidéo</label>
              <input type="text" class="form-control" id="video">
            </div>
            <div class="groupe">
              <button type="submit" class="btn btn-primary btn-block ">Envoyer</button>
            </div>
          </form>
      </div>
    </div>
<?php
require '../controllers/HomeController.php'
?>
</body>
</html>