<!-- a revoir entierement -->

<?php

class Index
{
    private $logo;




    public function getLogo(): string
    {
        $logo = "../inc/LOGO_APM.jpg";
        return $this->logo;
    }

    public function setLogo(string $pLogo): void
    {
        $this->logo = $pLogo;
    }

}