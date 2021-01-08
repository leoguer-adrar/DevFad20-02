<?php


class Utilisateur
{
  use Bdd;
  private $id;
  private $login;
  private $mdp;

  // fonction getId (retourne l'id)
  public function getId(): int
  {
    return $this->id;
  }
  //  getLogin 
  public function getLogin(): string
  {
    return $this->login;
  }
  // setLogin 
  public function setLogin(string $login): void
  {
    $this->login = $login;
  }
  //  getMdp 
  public function getMdp(): string
  {
    return $this->login;
  }
  // setMdp 
  public function setMdp(string $mdp): void
  {
    $this->mdp = $mdp;
  }
  // fonction se connecter
  public function seConnecter()
  {
    //?????
  }
}
