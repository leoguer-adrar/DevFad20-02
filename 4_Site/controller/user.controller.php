<?php
require('../model/user.class.php');



class UserController
{
    //Fonction récupération des utilisateurs + cache la variable article pour qu'elle ne soit pas visible dans la vue. 
    private function users(): array
    {
        $user = new User;
        return $user->getUsers();
    }

    //Fonction affichage homepage.php
    public function userPage()
    {
        $users = $this->users();
        require ('../view/userPage.php');
    }

}

$userController = new UserController();
$userController->userPage();






