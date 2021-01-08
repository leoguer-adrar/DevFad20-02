<?php


class Contrat
{
    use Bdd;
    private $id;
    private $nom;
    private $num;
    private $types=[];
    
    // fonction getId (retourne l'id)
    public function getId():int
    {
        return $this->id;
    }
    // fonction getNom (retourne le nom)
    public function getNom():string
    {
        return $this->nom;
    }
    // fonction setNom ( écrire et modifier le nom ) 
    public function setNom(string $nom):void
    {
        $this->nom=$nom;
    }
    //  getNum 
    public function getNum():int
    {
        return $this->num;
    }
    //  setNum 
    public function setNum(int $num):void
    {
        $this->num=$num;
    }
    //fonction attributTitre
    public function attributTitre(int $id):Type
    {
        return $this->types[$id];
    }
    // getTypes
    public function getTypes():array
    {
        return $this->types;
    }
     // setTypes
     public function setContrats(array $types):void
    {
        $this->types=$types;
    }

}
