<?php

class Quote
{
    use Bdd;
    private int $id;
    private string $date;
    private string $title;
    private string $article;
    private string $picture1;
    private string $picture2;

    public function __construct(int $id = null)
    {
        if ($id) {
            $this->id = $id;
            $this->getQuote();
        }
    }


    public function getId(): int
    {
        return $this->id;
    }

    public function setId(int $pId): void
    {
        $this->id = $pId;
    }

    public function getDate(): string
    {
        return $this->date;
    }

    public function setDate(string $pDate): void
    {
        $this->date = $pDate;
    }

    public function getTitle(): string
    {
        return $this->title;
    }

    public function setTitle(string $pTitle): void
    {
        $this->title = $pTitle;
    }

    public function getArticle(): string
    {
        return $this->article;
    }

    public function setArticle(string $pArticle): void
    {
        $this->article = $pArticle;
    }

    public function getPicture1(): string
    {
        return $this->picture1;
    }

    public function setPicture1(string $pPicture1): void
    {
        $this->picture1 = $pPicture1;
    }

    public function getPicture2(): string
    {
        return $this->picture2;
    }

    public function setPicture2(string $pPicture2): void
    {
        $this->picture2 = $pPicture2;
    }


    //ajouter 1 ligne à la table quote : page blog demande devis
    public function saveQuote(): void
    {
        // cette instance fait un insert donc il prend 3 arguments, la requêtes, les valeurs dans un tableau et si ce n'est pas un select il faut mettre le 3eme arguement a false pour éviter le fetchAll
        $this->prepare('insert into quote (title, article, picture1, picture2) values (:title, :article, :picture1, :picture2)', [
            //pas 'date' car elle est en création automatique
            ':title' => $this->getTitle(),
            ':article' => $this->getArticle(),
            ':picture1' => $this->getPicture1(),
            ':picture2' => $this->getPicture2(),
            ], false);
    }




    //mofifier table quote : page blog demande devis
    public function updateQuote(): void
    {
        $this->prepare('update quote set title = :title, article = :article, picture1 = :picture1, picture2 = :picture2 where id = :id', [
            ':id' => $this->getId(),
            ':title' => $this->getTitle(),
            ':article' => $this->getArticle(),
            ':picture1' => $this->getPicture1(),
            ':picture2' => $this->getPicture2(),
        ], false);
    }


    //supprimer 1 ligne à la table quote : page blog demande devis
    public function removeQuote(Quote $pId): void
    {
        $this->prepare('delete from quote where id = :id', [
            ':id' => $pId
        ], false);
//        TODO quand je supprime un quote je supprimes les commentQuote qui vont avec
    }


    //afficher la table quote : page blog demande devis
    public function getQuotes(): array
    {
        // cette instance est juste un select donc il n'a pas besoin des deux autres arguments car ils ont déjà des valeurs par défaut.
        return $this->prepare('select * from quote order by quote.date desc');
    }

    //afficher 1 quote
    public function getQuote()
    {
        $data = $this->prepare('select * from quote where id = :id', [
            ':id' => $this->getId()
        ]);
        $this->setDate($data[0]['date']);
        $this->setTitle($data[0]['title']);
        $this->setArticle($data[0]['article']);
        $this->setPicture1($data[0]['picture1']);
        $this->setPicture2($data[0]['picture2']);
        return $this;
    }
}


