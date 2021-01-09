<?php
require '../models/User.php';
require '../models/Bdd.php';
class HomeController
{
    public function index()
    {
        $user= new User;
        $users= $user->all();
        var_dump($users);
        require '../views/index.php';
    }

    public function addUser()
    {
        $user = new User();
        $user->setPseudo('Mimi');
        $user->setEmail('email@laposte.net');
        $user->setPassword('monmotdepasse');
        $user->setIs_admin(1);
        $user->setIs_ban(0);

        $user->save();
        echo var_dump($user);
        return;
    }
}

$controller = new HomeController();
$controller->index();