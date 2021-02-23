<?php

class Category
{
    use Bdd;
    // private string  $id;
    private  string $name;

     public function  getId(): string
     {
         return $this->id;
     }

    public function  getName(): string 
    {
        return $this->name;
    }

    public function  setName(string $pName): void
    {
        $this->name = $pName;
    }

    public function addCategory(): void
    {
        // cette instance fait un insert donc il prend 3 arguments, la requêtes, les valeurs dans un tableau et si ce n'est pas un select il faut mettre le 3eme arguement a false pour éviter le fetchAll
        $this->prepare('insert into category (name) values (:name)', [
            ':name' => $this->getName('je suis une catégorie'),
        ], false);
    }

    public function modifyCategory(int $pId): void
    {
        $this->prepare('update category where id = :id set (name = :name)', [
            ':id' => $pId,           
            ':name' => $this->getName('je suis une catégorie'),
        ], false);
    }

    public function suppCategory(Category $pId): void
    {
    }


// Fonction récuperer les articles
    public function getCategories(): array
    {
        // cette instance est juste un select donc il n'a pas besoin des deux autres arguments car ils ont déjà des valeurs par défaut.
        return $this->prepare('select * from category');
    }
}
