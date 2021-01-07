<?php

declare(strict_types=1);


class User
{
    private int $id_user;
    private string $pseudo;
    private string $email;
    private string $password;
    private bool $is_admin;
    private bool $is_ban;

    public function __construct()
    {
        // ...
    }

    public function getID_user(): int
    {
        return 0;
    }

    public function setID(int $pID): void
    {
        $this->id_user=$pID;
    }

    public function getPseudo(): string
    {
        return "";
    }

    public function setPseudo(string $pPseudo): void
    {
        $this->pseudo=$pPseudo;
    }

    public function getEmail(): string
    {
        return "bnvn";
    }

    public function setEmail(string $pEmail): void
    {
        return null;
    }

    public function getPassword(): string
    {
        return "";
    }

    public function setPassword(string $pPassword): void
    {
        return null;
    }

    public function getEmail(): string
    {
        return "";
    }

}
