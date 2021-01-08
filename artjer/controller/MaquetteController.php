<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require '../model/Maquette.class.php';
require '../lib/functions.php';

class MaquetteController
{
    public function afficherMaquettes()
    {
        $maquettes = $this->maquettes();
        require '../view/index.php';
    }
    private function maquettes()
    {
        $maquette = new Maquette();
        return $maquette->getMaquettes();
        
    }
}

$maquetteController = new MaquetteController();
$maquetteController->afficherMaquettes();