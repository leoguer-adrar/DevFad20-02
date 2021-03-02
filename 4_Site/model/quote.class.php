<?php

class Quote
{
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
            $this->getQuote($id);
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


    //création d'1 ligne de la table quote : page blog demande devis
    public function saveQuote(): void
    {
        DAO::getInstance()->execute('insert into quote (title, article, picture1, picture2) values (:title, :article, :picture1, :picture2)', [
            //pas 'date' car elle est en création automatique
            ':title' => $this->getTitle(),
            ':article' => $this->getArticle(),
            ':picture1' => $this->getPicture1(),
            ':picture2' => $this->getPicture2(),
        ]);
    }




    //mofifier table quote : page blog demande devis
    public function updateQuote(): void
    {
        DAO::getInstance()->execute('update quote set title = :title, article = :article, picture1 = :picture1, picture2 = :picture2 where id = :id', [
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
        DAO::getInstance()->execute('delete from quote where id = :id', []);

// TODO: quand je supprime un quote je supprimes les commentQuote qui vont avec
        //voir si ça marche
        DAO::getInstance()->execute('delete from commentQuote where id_Quote = :id', []);

    }


 // Fonction pour récuperer les quotes (= article "demande devis")
//tous les quotes
    public function getQuotes(): array
    {
        return DAO::getInstance()
            ->execute('select * from quote order by quote.date desc')
            ->fetchAll();
    }

    //1 quotes en fonction de son ID
    public function getQuote($id): array
    {
        return DAO::getInstance()
            ->execute('select * from quote where id = :id', [':id' => $id])
            ->fetch();
    }



}


