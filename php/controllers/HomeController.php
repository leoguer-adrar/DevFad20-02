<?php
require ('../models/Bdd.php');
require ('../models/User.php');
require ('../models/Bug.php');

class HomeController
{
    public function users(): array
    {
        $user= new User;
        return $user->showUser();
    }

    public function recupUser()
    {
        $users = $this->users();

        require ('../views/homepage.php');
    }

    public function addUser()
    {
        $user = new User();
        $user->setPseudo('Cestmoi');
        $user->setEmail('fezehfjbhze@fzjfbze');
        $user->setPassword('jesuismotdepasse');
        $user->setIs_admin(1);
        $user->setIs_ban(0);
        $user->save();
        return;
    }

}

$controller = new HomeController();
$controller->addUser();
$controller->recupUser();