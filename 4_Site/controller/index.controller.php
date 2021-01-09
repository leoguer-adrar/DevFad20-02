<!-- a revoir entièremment -->

<?php
require('../model/index.class.php');



class IndexController
{
    // //Fonction récupération des articles + cache la variable article pour qu'elle ne soit pas visible dans la vue. 
    // private function quotes(): array
    // {
    //     $quote = new Quote;
    //     return $quote->getQuotes();
    // }

    //Fonction affichage index.php = accueil
    public function indexPage()
    {
        $quotes = $this->quotes();
        require ('../view/indexPage.php');
    }

}

