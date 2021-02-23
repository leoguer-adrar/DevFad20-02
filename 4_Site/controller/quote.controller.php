<?php

class QuoteController
{
    //Fonction récupération des lignes de la table quote par la clase Quote + cache (private) la variable pour qu'elle ne soit pas visible dans la vue
    private function quotes(): array
    {
        $quote = new Quote(1);
        return $quote->getQuotes();
    }

    //Fonction récupération des lignes de la table comment_quote
    private function commentsQuote(): array
    {
        $commentQuote = new CommentQuote();
        return $commentQuote->getCommentsQuote();
    }

    //Fonction récupération d'1 ligne de la table quote par la clase Quote
    private function quote(int $id): Quote
    {
        $quote = new Quote($id);
        $quote->setTitle('Je suis un titre modifié');
        $quote->updateQuote();
        return $quote;
    }

    //Fonction récupération 1 ligne de la table connemtQuote par la clase ConnemtQuote pour un article
    private function commentQuote(int $id): CommentQuote
    {
        $commentQuote = new CommentQuote($id);
        return $commentQuote->getCommentQuote();
    }


    //Fonction affichage quotePage.php
    public function quotePage()
    {
/*        if (!empty($_GET)) {
            $id = $_GET['id'];
            if (isset($id)) {
                $quote = $this->quote((int)$id);
                debug($quote);
            }
        }*/
        $quotes = $this->quotes();
        $comments = $this->commentsQuote();
        //debug($comments);
        require('../view/quotePage.php');
    }

    public function quoteCreatePage()
    {
        require('../view/quoteCreatePage.php');
    }

    public function quoteCreate()
    {
        $title = getValidatedInput('title');
        $comment = getValidatedInput('comment');
        if (!$title || !$comment) {
            redirect('/quotes/create');
        }
        $quote = new Quote();
        $quote->setTitle($title);
        $quote->setArticle($comment);
        $quote->setPicture1('null');
        $quote->setPicture2('null');
        if (!empty($_FILES)) {
            $picture1 = $_FILES['picture1'];
            $picture2 = $_FILES['picture2'];
            if (!empty($picture1['name'])
                && ($picture1['type'] === 'image/jpeg'
                || $picture1['type'] === 'image/jpg'
                || $picture1['type'] === 'image/png')) {
                $newName = uniqid('', true) . '-' . $picture1['name'];
                $quote->setPicture1($newName);
                move_uploaded_file($picture1['tmp_name'], ROOT . "./images/quotes/" . $newName);
            }
            if (!empty($picture2['name'])
                && ($picture2['type'] === 'image/jpeg'
                || $picture2['type'] === 'image/jpg'
                || $picture2['type'] === 'image/png')) {
                $newName2 = uniqid('', true) . '-' . $picture2['name'];
                $quote->setPicture2($newName2);
                move_uploaded_file($picture2['tmp_name'], ROOT . "./images/quotes/" . $newName2);
            }
        }
        $quote->saveQuote();
        $_SESSION['success'] = 'le devis a bien été envoyé';
        redirect('/quotes');
    }
}
