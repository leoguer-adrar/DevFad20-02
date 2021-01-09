<?php
require('bdd.php');

class Category
{
    use Bdd;
    private Int $id;
    private String $name;


    public function getId(): int
    {
        return $this->id;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function setFirstName($pName): void
    {
        $this->name = $pName;
    }

    // Fonction récupération des catégories avec la requête SELECT FROM
    public function getCategories(): array
    {
        return $this->prepare('select * from category ');
    }
}
