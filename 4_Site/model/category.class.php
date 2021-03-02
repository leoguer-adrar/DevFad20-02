<?php

class Category
{
    // private string  $id;
    private string $name;

    public function getId(): string
    {
        return $this->id;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function setName(string $pName): void
    {
        $this->name = $pName;
    }

    public function addCategory(): void
    {
        DAO::getInstance()->execute('insert into category (name) values (:name)', [
            ':name' => $this->getName(),
        ]);
    }

    public function modifyCategory(int $pId): void
    {
        DAO::getInstance()->execute('update category set name = :name where id = :id', [
            ':id' => $pId,
            ':name' => $this->getName(),
        ]);
    }

    public function suppCategory(Category $pId): void
    {
        DAO::getInstance()->execute('delete from category where id = :id', []);
    }


// Fonction pour récuperer les catégories
//toutes les catégories
    public function getCategories(): array
    {
        return DAO::getInstance()
            ->execute('select * from category')
            ->fetchAll();
    }

    //1 catégorie en fonction de son ID
    public function getCategory(int $id): array
    {
        return DAO::getInstance()
            ->execute('select * from category where id = :id', [':id' => $id])
            ->fetch();
    }
}
