<?php
require "../Lib/Bdd.php";

class Gallerie
{
    use Bdd;
    private $id;
    private $nom;
    private $nomImage;

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

    //  getNomImage 
    public function getNomImage(): string
    {
        return $this->nomImage;
    }
    // setNomImage 
    public function setNomImage(string $nomImage): void
    {
        $this->nomImage = $nomImage;
    }
}
