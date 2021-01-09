<?php
require('bdd.php');

class Quote
{
    use Bdd;
    private $date;
    private $title;
    private $article;
    private $picture1;
    private $picture2;
    // private string $commentQuote;
    // private string $idUser;



    public function getDate(): DateTime
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


    public function addQuote(): void
    {
        // cette instance fait un insert donc il prend 3 arguments, la requêtes, les valeurs dans un tableau et si ce n'est pas un select il faut mettre le 3eme arguement a false pour éviter le fetchAll
        $this->prepare('insert into quote (date, title, article, picture1, picture2) values (:date, :title, :article, :picture1, :picture2)', [
            ':date' => $this->getDate('je suis un titre'),
            ':title' => $this->getTitle('je suis un content'),
            ':article' => $this->getArticle('je suis un titre'),
            ':picture1' => $this->getPicture1('je suis un content'),
            ':picture2' => $this->getPicture2('je suis un titre'),
        ], false);
    }


    public function modifyQuote(int $pId): void
    {
        $this->prepare('update quote where id = :id set (date = :date, title = :title, article = :article, picture1 = :picture1, picture2 = :picture2)', [
            ':id' => $pId,
            ':date' => $this->getDate('je suis un titre'),
            ':title' => $this->getTitle('je suis un content'),
            ':article' => $this->getArticle('je suis un titre'),
            ':picture1' => $this->getPicture1('je suis un content'),
            ':picture2' => $this->getPicture2('je suis un titre'),
        ], false);
    }

    public function suppQuote(Quote $pId): void
    {
    }


    // Fonction récuperer les articles
    public function getQuotes(): array
    {
        // cette instance est juste un select donc il n'a pas besoin des deux autres arguments car ils ont déjà des valeurs par défaut.
        return $this->prepare('select * from quote ');
    }
}
