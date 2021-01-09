<!-- a revoir entierement -->

<?php
require('bdd.php');

class Index
{
    private $logo;

$logo = "../inc/LOGO_APM.jpg";




    public function getLogo(): string
    {
        return $this->logo;
    }

    public function setLogo(string $pLogo): void
    {
        $this->logo = $pLogo;
    }

