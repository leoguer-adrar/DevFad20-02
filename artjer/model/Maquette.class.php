<?php
require "../Lib/Bdd.php";
require "Client.class.php";

class Maquette
{   
    use Bdd;
    private $id;
    private $nom;
    private $num;
    private $description;
    private $clients = [];

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
    //  getNum 
    public function getNum(): int
    {
        return $this->num;
    }
    // setNum
    public function setNum(int $num): void
    {
        $this->num = $num;
    }
    // getDescription
    public function getDescription(): string
    {
        return $this->description;
    }
    // setDescription
    public function setDescription(string $description): void
    {
        $this->description = $description;
    }
    // fonction d'affichage des Clients
    public function destiClient(int $id): Client
    {
        return $this->clients[$id];
    }
    // fonction getClients (retourne les clients sous forme de tableau)
    public function getClients(): array
    {
        return $this->clients;
    }
    // fonction setClients ( écrire et modifier les clients ) 
    public function setClients(array $clients): void
    {
        $this->clients = $clients;
    }
    // getMaquettes
    public function getMaquettes()
    {
        return $this->prepare("select * from maquette");
    }
}

