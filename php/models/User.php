<?php
require 'Bdd.php';

class User
{
    use Bdd;
    private int $id_user;
    private string $pseudo;
    private string $email_user;
    private string $password;
    private bool $is_admin;
    private bool $is_ban;

    public function getID_user(): int
    {
        return $this->id_user;
    }

    public function setID(int $pID): void
    {
        $this->id_user = $pID;
    }

    public function getPseudo(): string
    {
        return $this->pseudo;
    }

    public function setPseudo(string $pPseudo): void
    {
        $this->pseudo = $pPseudo;
    }

    public function getEmail(): string
    {
        return $this->email_user;
    }

    public function setEmail(string $pEmail): void
    {
        $this->email_user = $pEmail;
    }

    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $pPassword): void
    {
        $this->password = $pPassword;
    }

    public function getIs_admin(): bool
    {
        return $this->is_admin;
    }

    public function setIs_admin(bool $pIs_admin): void
    {
        $this->is_admin = $pIs_admin;
    }

    public function getIs_ban(): bool
    {
        return $this->is_ban;
    }

    public function setIs_ban(bool $pIs_ban): void
    {
        $this->is_ban = $pIs_ban;
    }

    public function getbyID(int $id_user): ?array
    {
        $user=$this->prepare('select * from user where id = :id', [
            ':id'=> $id_user
        ]);
        return $user;
    }

    public function all(): array
    {
        return $this->prepare('select * from user');
    }

    public function save(): void
    {
        $this->prepare('insert into user (pseudo, email_user, password, is_admin, is_ban) value (:pseudo, :email_user, :password, :is_admin, :is_ban)',[
            ':pseudo' => $this->getPseudo(),
            ':email_user' => $this->getEmail(),
            ':password' => $this->getPassword(),
            ':is_admin' => $this->getIs_admin(),
            ':is_ban' => $this->getIs_ban()
        ],
    false);
    }
}