<?php

class CommentQuote
{
    use Bdd;
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
        $this->prepare('insert into comment_quote (comment) values (:comment)', [
            ':comment' => $this->getComment('je suis un comment'),
        ], false);
    }


    //mofifier table comment_quote : page blog demande devis
    public function updateCommentQuote(int $pId, int $pIdQuote, int $pIdUser): void
    {
        $this->prepare('update comment_quote set comment = :Comment, idQuote = :id_quote, idUser = :id_use where id = :id', [
            ':id' => $pId,
            ':comment' => $this->getDate(),
            ':id_quote' => $pIdQuote,
            ':id__user' => $pIdUser,
        ], false);
    }


    //supprimer 1 ligne à la table comment_quote : page blog demande devis
    public function removeCommentQuote(int $pId, int $pIdQuote, int $pIdUser): void
    {
        $this->prepare('delete from comment_quote where id = :id', [
            ':id' => $pId,
        ], false);
    }


    //afficher la table commentQuote pour un quote
    public function getCommentsQuote(): array
    {
        // cette instance est juste un select donc il n'a pas besoin des deux autres arguments car ils ont déjà des valeurs par défaut.
        return $this->prepare('select * from comment_quote inner join quote where quote.id = comment_quote.id_Quote');
    }

    //afficher 1 commentQuote
    public function getCommentQuote()
    {
        $data = $this->prepare('select * from quote where id = :id', [
            ':id' => $this->getId()
        ]);
        $this->setCommentQuote($data[0]['comment']);
        $this->setIdQuote($data[0]['idQuote']);
        $this->setIdUser($data[0]['idUser']);
        return $this;
    }



}