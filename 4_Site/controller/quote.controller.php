<?php
require('../model/quote.class.php');



class QuoteController
{
    //Fonction récupération des articles + cache la variable article pour qu'elle ne soit pas visible dans la vue. 
    private function quotes(): array
    {
        $quote = new Quote;
        return $quote->getQuotes();
    }

    //Fonction affichage homepage.php
    public function quotePage()
    {
        $quotes = $this->quotes();
        require ('../view/quotePage.php');
    }

}

//pour instancier la classe, sans ces 2 lignes la classe ne sert à rien
$quoteController = new QuoteController();
$quoteController->quotePage();






