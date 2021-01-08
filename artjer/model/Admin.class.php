<?php
// lier le fichier
require "Utilisateur.class.php";
require "../Lib/Bdd.php";
require "Gallerie.class.php";


// Création de la classe Administrateur
class Administrateur extends Utilisateur
{   
    use Bdd;
    private $galleries=[];
    private $maquettes=[];
    private $contrats=[];
    
    // fonction d'affichage de la Gallerie
    public function affichGall():array
     {
        return $this->galleries;
     }
     // fonction d'affichage d'un seul élément de la Gallerie
     public function elementGall(int $id):Gallerie
     {
         return $this->galleries[$id];
     }
     // fonction ajouter un élément à la Gallerie
     public function ajoutGall(Gallerie $gallerie):void
     {
         $this->galleries[] = $gallerie;
     }
     // fonction supprimer un élément à la Gallerie
     public function suppGall(int $id):void
     {
         array_splice ($this->galleries, $id);
     }
     // fonction modifier un élément à la Gallerie
     public function modifGall(int $id, Gallerie $gallerie):void
     {
         $this->galleries[$id]= $gallerie;
     }
     //fonction affichage des maquettes
     public function affichMaq():array
     {
        return $this->maquettes;
     }
    // fonction ajouter une maquette 
    public function ajoutMaq(Maquette $maquette):void
     {
        $this->maquettes[] = $maquette;
     }
     // fonction supprimer une maquette
     public function suppMaq(int $id):void
     {
         array_splice ($this->maquettes, $id);
     }
      // fonction modifier une maquette
      public function modifMaq(int $id, Maquette $maquette):void
      {
          $this->maquettes[$id]= $maquette;
      }
      // fonction d'affichage des contrats
    public function affichContrat():array
    {
       return $this->contrats;
    }
     // fonction ajouter un contrat
     public function ajoutContrat(Contrat $contrat):void
     {
         $this->contrats[] = $contrat;
     }
     // fonction supprimer un contrat
     public function suppContrat(int $id):void
     {
         array_splice ($this->contrats, $id);
     }
     // fonction modifier un contrat
     public function modifContrat(int $id, Contrat $contrat):void
     {
         $this->contrats[$id]= $contrat;
     }
     // fonction get Galleries (retourne les galleries sous forme de tableau)
     public function getGalleries():array
     {
         return $this->galleries;
     }
     // fonction set Galleries ( écrire et modifier la gallerie ) 
     public function setGalleries(array $galleries):void
    {
        $this->galleries=$galleries;
    }
     // fonction get Maquettes (retourne les maquettes sous forme de tableau)
     public function getMaquettes():array
     {
         return $this->maquettes;
     }
     // fonction set Maquettes ( écrire et modifier la gallerie ) 
     public function setMaquettes(array $maquettes):void
    {
        $this->maquettes=$maquettes;
    }
    // fonction get Contrats (retourne les contrats sous forme de tableau)
    public function getContrats():array
    {
        return $this->contrats;
    }
    // fonction set Contrats ( écrire et modifier les contrats ) 
    public function setContrats(array $contrats):void
   {
       $this->contrats=$contrats;
   }
}
$admin=new Administrateur();
$admin->affichGall();










