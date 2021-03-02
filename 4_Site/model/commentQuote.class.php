<?php

class CommentQuote
{
    private int $id;
    private string $comment;
    private int $idQuote;
    private int $idUser;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * @param mixed $comment
     */
    public function setComment($comment): void
    {
        $this->comment = $comment;
    }

    /**
     * @return mixed
     */
    public function getIdQuote()
    {
        return $this->idQuote;
    }

    /**
     * @param mixed $idQuote
     */
    public function setIdQuote($idQuote): void
    {
        $this->idQuote = $idQuote;
    }

    /**
     * @return mixed
     */
    public function getIdUser()
    {
        return $this->idUser;
    }

    /**
     * @param mixed $idUser
     */
    public function setIdUser($idUser): void
    {
        $this->idUser = $idUser;
    }

    //ajouter 1 ligne à la table comment_quote : page blog demande devis
    public function saveCommentQuote(): void
    {
        // cette instance fait un insert donc il prend 3 arguments, la requêtes, les valeurs dans un tableau et si ce n'est pas un select il faut mettre le 3eme arguement a false pour éviter le fetchAll
        DAO::getInstance()->execute('insert into comment_quote (comment) values (:comment)', [
            ':comment' => $this->getComment('je suis un comment'),
        ]);
    }


    //mofifier table comment_quote : page blog demande devis
    public function updateCommentQuote(int $pId): void
    {
        DAO::getInstance()->execute('update comment_quote set comment = :comment where id = :id', [
            ':id' => $pId,
            ':comment' => $this->getComment(),
        ]);
    }


    //supprimer 1 ligne à la table comment_quote : page blog demande devis
    public function removeCommentQuote(int $pId): void
    {
        DAO::getInstance()->execute('delete from comment_quote where id = :id', []);
    }



    // Fonction pour récuperer les commentaires
//tous les commentaires
    public function getCommentsQuote(): array
    {
        return DAO::getInstance()
            ->execute('select * from comment_quote')
            ->fetchAll();
    }

    //1 commentaire en fonction de son ID
    public function getCommentQuote(int $id): array
    {
        return DAO::getInstance()
            ->execute('select * from comment_quote where id = :id', [':id' => $id])
            ->fetch();
    }

    //1 commentaire en fonction de l'ID de quote
    public function getCommentQuoteForQuote(int $id): array
    {
        return DAO::getInstance()
            ->execute('select * from comment_quote inner join quote where quote.id = comment_quote.id_Quote', [':id' => $id])
            ->fetch();
    }


}

