<?php
require "../Lib/Bdd.php";

class Type
{
    use Bdd;
    private $id;
    private $nom;

    // fonction getId (retourne l'id)
    public function getId(): int
    {
        return $this->id;
    }
    //  getNom 
    public function getNom(): string
    {
        return $this->nom;
    }
    // setNom 
    public function setNom(string $nom): void
    {
        $this->nom = $nom;
    }
}
