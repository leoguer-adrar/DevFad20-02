<?php

class User
{
    use Bdd;
    private int $id_user;
    private string $pseudo;
    private string $email_user;
    private string $password;
    private int $is_admin = 0;
    private int $is_ban = 0;

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

    public function getIs_admin(): int
    {
        return $this->is_admin;
    }

    public function setIs_admin(int $pIs_admin): void
    {
        $this->is_admin = (int) $pIs_admin;
    }

    public function getIs_ban(): int
    {
        return $this->is_ban;
    }

    public function setIs_ban(int $pIs_ban): void
    {
        $this->is_ban = (int) $pIs_ban;
    }

    public function getbyID(int $id_user): ?array
    {
        $user = $this->prepare('select * from user where id = :id', [
            ':id' => $id_user
        ]);
        return $user;
    }

    public function all(): array
    {
        return $this->prepare('select * from user');
    }

    public function save(): void
    {
        $this->prepare('insert into user (pseudo, email_user, password, is_admin, is_ban) value (:pseudo, :email_user, :password, :is_admin, :is_ban)',
            [
                ':pseudo' => $this->getPseudo(),
                ':email_user' => $this->getEmail(),
                ':password' => $this->getPassword(),
                ':is_admin' => $this->getIs_admin(),
                ':is_ban' => $this->getIs_ban()
            ],
            false
        );
    }

    public function showUser(): array
    {
        return $this->prepare('select * from user');
    }
}