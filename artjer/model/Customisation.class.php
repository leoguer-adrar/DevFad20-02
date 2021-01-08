<?php
require "../Lib/Bdd.php";

class Customisation
{ 
    use bdd;
    private $id;
    private $nom;
    private $num;

   // fonction getId (retourne l'id)
   public function getId():int
   {
       return $this->id;
   }
     //  getNom 
     public function getNom():string
     {
         return $this->nom;
     }
     // setNom 
    public function setNom(string $nom):void
    {
        $this->nom=$nom;
    }
     //  getNum 
     public function getNum():int
     {
         return $this->num;
     }
     // setNum 
    public function setNum(int $num):void
    {
        $this->num=$num;
    }



}