<?php
require('bdd.php');

class Article
{
    use Bdd;
    private string $title;
    private string $content;
    private datetime $creationDate;
    private datetime $modificationDate;
    private string $slug;
    private array $pictures;
    private array $categories;
    private array $comments;

    public function getTitle(): string
    {
        return $this->title;
    }

    public function setTitle(string $pTitle): void
    {
        $this->title = $pTitle;
    }


    public function getContent(): string
    {
        return $this->content;
    }

    public function setContent(string $pContent): void
    {
        $this->content = $pContent;
    }

    public function getCreationDate(): DateTime
    {
        return $this->creationDate;
    }

    public function setCreationDate(string $pCreationDate): void
    {
        $this->creationDate = $pCreationDate;
    }

    public function getModifyDate(): DateTime
    {
        return $this->modificationDate;
    }

    public function setModifyDate(string $pModificationDate): void
    {
        $this->modificationDate = $pModificationDate;
    }

    public function getSlug(): string
    {
        return $this->slug;
    }

    public function setSlug(string $pSlug): void
    {
        $this->slug = $pSlug;
    }

    public function getPictures(): array
    {
        return $this->pictures;
    }

    public function setPictures(string $pPicture): void
    {
        $this->pictures = $pPicture;
    }

    public function getCategories(): array
    {
        return $this->categories;
    }

    public function setCategories(string $pCategories): void
    {
        $this->categories = $pCategories;
    }

    public function getComments(): array
    {
        return $this->comments;
    }

    public function setComments(string $pComments): void
    {
        $this->comments = $pComments;
    }


    // Fonction récuperer les articles avec la requête SELECT 
    public function getArticles(): array
    {
        return $this->prepare('select * from article ');
    }

    // Fonction récupération des articles par catégories avec la requête INNER JOIN
    public function getArticlesbyCategory(): array
    {
        return $this->prepare('select category.name, article.title, article.content FROM article INNER JOIN category ON article.id_category=category.id');
    }

    //Fonction création d'un artlicle avec la requête INSERT INTO
    public function createArticle(): void
    {
        // cette instance fait un insert donc il prend 3 arguments, la requête, les valeurs dans un tableau et si ce n'est pas un select il faut mettre le 3eme arguement a false pour éviter le fetchAll
        $this->prepare('insert into article (title, content, creationDate, modificationDate, slug, pictures, categories, comments) values (:title, :content, :creationDate, :modificationDate, :slug, :categories, :pictures, :comments)', [
            ':title' => $this->getTitle('je suis un titre'),
            ':content' => $this->getContent('je suis un content'),
            ':creationDate' => $this->getCreationDate('je suis une date de création'),
            ':modificationDate' => $this->getModifyDate('je suis une date de modification'),
            ':categories' => $this->getCategories('je suis une categorie'),
            ':pictures' => $this->getPictures('je suis une photo'),
            ':comments' => $this->getComments('je suis un commentaire'),
        ], false);
    }

    //Fonction modification d'un article avec la requête UPDATE
    public function updateArticle(int $pId): void
    {
        $this->prepare('update article where id = :id set (title = :title, content = :content, creationDate = :creationDate, modificationDate = :modificationDate, slug = :slug)', [
            ':id' => $pId,
            ':title' => $this->getTitle('je suis un titre'),
            ':content' => $this->getContent('je suis un content'),
            ':creationDate' => $this->getCreationDate('je suis un titre'),
            ':modificationDate' => $this->getModifyDate('je suis un content'),
            ':slug' => $this->getSlug('je suis un titre'),
        ], false);
    }

    //Fonction suppression d'un article avec la requête 
    public function removeArticle(Article $pId): void
    {
    }
}
