<?php
require('bdd.php');
require('User.class.php');
require('Article.class.php');

class Admin extends User
{
    use Bdd;
    private array $articles = [];
    private array $comments = [];
    private array $forms = [];
    private array $pictures = [];
    private array $categories = [];

    // Fonction modifier un article 
    public function modifyArticle($pId, $pArticle): void
    {
        $this->articles[$pId] = $pArticle;
    }

    // Fonction supprimer un élément de la class Article (remplace la variable par une valeur NULL.)
    public function removeArticle(int $pId): void
    {
        array_splice($this->articles, $pId);
    }
}

$admin = new Admin();

$admin->addArticle($pArticle);