<?php
require('bdd.php');

class Quote
{
    private $logo;

$logo = src="./inc/LOGO_APM.jpg" alt="[ATM Architecture]".




    public function getLogo(): string
    {
        return $this->logo;
    }

    public function setLogo(string $pLogo): void
    {
        $this->logo = $pLogo;
    }

