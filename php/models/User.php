<?php

class User
{
    private int $id_user;
    private string $pseudo;
    private string $email_user;
    private string $password;
    private bool $is_admin;
    private bool $is_ban;

    public function __construct()
    {
        // ...
    }

    public function getID_user(): int
    {
        return $this->id_user;
    }

    public function setID(int $pID): void
    {
        $this->id_user=$pID;
    }

    public function getPseudo(): string
    {
        return $this->pseudo;
    }

    public function setPseudo(string $pPseudo): void
    {
        $this->pseudo=$pPseudo;
    }

    public function getEmail(): string
    {
        return $this->email_user;
    }

    public function setEmail(string $pEmail): void
    {
        $this-> null;
    }

    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $pPassword): void
    {
        $this->password=$pPassword;
    }
}
