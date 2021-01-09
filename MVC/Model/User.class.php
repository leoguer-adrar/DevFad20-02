<?php

require('bdd.php');

class User
{
    use Bdd;
    private int $id;
    private string $firstName;
    private string $lastName;
    private string $login;
    private $password;
    private $mail;
    private $is_administrator;
    private $articles;
    private $comments;



    public function getId(): int
    {
        return $this->id;
    }

    public function getFirstName(): string
    {
        return $this->firstName;
    }

    public function setFirstName($pFirstName): void
    {
        $this->firstName = $pFirstName;
    }

    public function getLastName(): string
    {
        return $this->lastName;
    }

    public function setLastName($pLastName): void
    {
        $this->lastName = $pLastName;
    }

    public function getLogin(): string
    {
        return $this->login;
    }

    public function setLogin($pLogin): void
    {
        $this->login = $pLogin;
    }

    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword($pPassword): void
    {
        $this->password = $pPassword;
    }

    public function getMail(): string
    {
        return $this->mail;
    }

    public function setMail($pMail): void
    {
        $this->mail = $pMail;
    }

    public function getIsAdministrator(): bool
    {
        return $this->is_administrator;
    }

    public function setIsAdministrator($pIsAdministrator): void
    {
        $this->is_administrator = $pIsAdministrator;
    }

    // Fonction récuperer les utilisateurs avec la requête SELECT 
    public function getUsers(): array
    {
        return $this->prepare('select * from user ');
    }


    public function createUser(): void
    {
        $this->prepare('insert into user (firstName, lastName, login, password, mail, is_administrator) values(:firstName, :lastName, :login, :password, :mail, :is_administrator)', [
            ':firstName' => $this->getFirstName(''),
            ':lastName' => $this->getLastName(''),
            ':login' => $this->getLogin(''),
            ':password' => $this->getPassword(''),
            ':mail' => $this->getMail(''),
            ':is_administrator' => $this->getIsAdministrator(''),
        ], false);
    }
}
