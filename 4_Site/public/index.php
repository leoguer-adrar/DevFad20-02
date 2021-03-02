<?php 
session_start();
// TODO: désactiver en production
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

const ROOT = __DIR__;

require '../helpers/functions.php';
require '../model/DAO.php';
require '../model/bdd.php';
require '../model/quote.class.php';
require '../model/commentQuote.class.php';

require '../controller/quote.controller.php';
require '../controller/user.controller.php';

$request = $_SERVER['REQUEST_URI'];
$path = parse_url($request, PHP_URL_PATH);
$_SESSION['path'] = $path;


if ($path === '/') {
    require '../view/homePage.php';

}elseif ($path === '/agence') {
    require '../view/agencePage.php';
}elseif ($path === '/contact') {
    require '../view/contactPage.php';
}elseif ($path === '/quotes') {
    $quote = new QuoteController;
    $quote->quotePage();
}elseif ($path === '/quotes/create') {
    $quote = new QuoteController;
    $quote->quoteCreatePage();
}elseif ($path === '/quotes/create/add') {
    $quote = new QuoteController;
    $quote->quoteCreate();
}elseif ($path === '/projets') {
    $quote = new QuoteController;
    $quote->quotePage();
}
else {
    http_response_code(404);
    require '../view/404.php';
}


