<?php
require "Utilisateur.class.php";
require "Contrat.class.php";


class Client extends Utilisateur
{
    use Bdd;
    private $nom;
    private $prenom;
    private $mail;
    private $tel;
    private $nomRue;
    private $numRue;
    private $cp;
    private $pays;
    private $galleries=[];
    private $customisations=[];
    private $contrats ;
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
    // getPrenom 
    public function getPrenom():string
    {
        return $this->prenom;
    }
    //setPrenom
    public function setPrenom(string $prenom):void
    {
        $this->nom=$prenom;
    }
    // getMail 
    public function getMail():string
    {
        return $this->mail;
    }
    // setMail 
    public function setMail(string $mail):void
    {
        $this->nom=$mail;
    }
    // getTel
    public function getTel():string
    {
        return $this->tel;
    }
    // setTel
    public function setTel(string $tel):void
    {
        $this->tel=$tel;
    }
    // getNomRue
    public function getNomRue():string
    {
        return $this->nomRue;
    }
    // setNomRue
    public function setNomRue(string $nomRue):void
    {
        $this->nomRue=$nomRue;
    }
    // getNumRue
    public function getNumRue():int
    {
        return $this->numRue;
    }
    // setNumRue
    public function setNumRue(int $numRue):void
    {
        $this->numRue=$numRue;
    }
     // getCp
     public function getCp():string
     {
         return $this->cp;
     }
     // setCp
     public function setCp(string $cp):void
     {
         $this->cp=$cp;
     }
     // getPays
     public function getPays():string
     {
         return $this->pays;
     }
     // setPays
     public function setPays(string $pays):void
     {
         $this->pays=$pays;
     }
     // fonction affiche la Gallerie
     public function affichGall():array
     {
        return $this->galleries;
     }
     // ???? fonction obtenir un Contrat
    public function obtenirContrat(int $id):Contrat
    {
        return $this->contrats[$id];
    }
    // ??????fonction demande de customisation
    //
    // getGalleries
    public function getGalleries():array
    {
        return $this->galleries;
    }
     // setGalleries
     public function setGalleries(array $galleries):void
    {
        $this->galleries=$galleries;
    }
     // getContrats
     public function getContrats():array
     {
         return $this->contrats;
     }
      // setContrats
      public function setContrats(array $contrats):void
     {
         $this->contrats=$contrats;
     }
     // getCustomisations
     public function getCustomisations():array
     {
         return $this->customisations;
     }
      // setCustomisations
      public function setCustomisations(array $customisations):void
     {
         $this->customisations=$customisations;
     }





}