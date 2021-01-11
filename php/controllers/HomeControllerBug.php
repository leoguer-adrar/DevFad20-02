<?php
require ('../models/Bdd.php');
require ('../models/User.php');
require ('../models/Bug.php');

class HomeController
{
    public function bugs(): array
    {
        $bug= new Bug;
        return $bug->showBug();
    }

    public function recupBug()
    {
        $bugs = $this->bugs();

        require ('../views/homepagebug.php');
    }

    public function addBug()
    {
        $bug = new Bug();
        $bug->setTitlebug('Superslide');
        $bug->setDescriptionbug('on va vite');
        $bug->setVideobug('http');
        $bug->setDatebug(21);
        $bug->saveBug();
        return;
    }

}

$controller = new HomeController();
$controller->addBug();
$controller->recupBug();