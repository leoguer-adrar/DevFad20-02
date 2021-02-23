<?php

trait User
{
    use Bdd;
    private int $id;
    private string $lastName;
    private string $firstName;
    private string $mail;
    private string $userName;
    private string $password;
    private string $phone;
    private string $addressLine1;
    private string $addressLine2;
    private string $postcode;
    private string $city;
    private string $country;
    private bool $administrator;



    public function getid(): int
    {
        return $this->id;
    }

    public function getLastName(): string
    {
        return $this->lastName;
    }

    public function setLastName(string $pLastName): void
    {
        $this->lastName = $pLastName;
    }

    public function getFirstName(): string
    {
        return $this->firstName;
    }

    public function setFirstName(string $pFirstName): void
    {
        $this->firstName = $pFirstName;
    }

    public function getMail(): string
    {
        return $this->mail;
    }

    public function setMail(string $pMail): void
    {
        $this->mail = $pMail;
    }

    public function getUserName(): string
    {
        return $this->userName;
    }

    public function setUserName(string $pUserName): void
    {
        $this->userName = $pUserName;
    }

    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $pPassword): void
    {
        $this->password = $pPassword;
    }

    public function getPhone(): string
    {
        return $this->phone;
    }

    public function setPhone(string $pPhone): void
    {
        $this->phone = $pPhone;
    }

    public function getAddressLine11(): string
    {
        return $this->addressLine1;
    }

    public function setAddressLine1(string $pAddressLine1): void
    {
        $this->addressLine1 = $pAddressLine1;
    }

    public function getAddressLine2(): string
    {
        return $this->addressLine2;
    }

    public function setAddressLine2(string $pAddressLine2): void
    {
        $this->addressLine2 = $pAddressLine2;
    }

    public function getPostcode(): string
    {
        return $this->postcode;
    }

    public function setPostcode(string $pPostcode): void
    {
        $this->postcode = $pPostcode;
    }

    public function getCity(): string
    {
        return $this->city;
    }

    public function setCity(string $pCity): void
    {
        $this->city = $pCity;
    }

    public function getCountry(): string
    {
        return $this->country;
    }

    public function setCountry(string $pCountry): void
    {
        $this->country = $pCountry;
    }

    public function getAdministrator(): string
    {
        return $this->administrator;
    }

    public function setAdministrator(bool $pAdministrator): void
    {
        $this->administrator = $pAdministrator;
    }




    //création d'1 user
    public function addUser(): void
    {
        // cette instance fait un insert donc il prend 3 arguments, la requêtes, les valeurs dans un tableau et si ce n'est pas un select il faut mettre le 3eme arguement a false pour éviter le fetchAll
        $this->prepare('insert into user (lastName, firstName, mail, userName, password, phone, addressLine1, addressLine2, postcode, city, country) values (:last_name, :first_name, :mail, :user_name, :password, :phone, :address_line1, :address_line2, :postcode, :city, :country)', [
            ':last_name' => $this->getLastName('je suis un titre'),
            ':first_name' => $this->getFirstName('je suis un content'),
            ':mail' => $this->getMail('je suis un titre'),
            ':user_name' => $this->getUserName('je suis un content'),
            ':password' => $this->getPassword('je suis un content'),
            ':phone' => $this->getPhone('je suis un titre'),
            ':address_line1' => $this->getAddressLine1('je suis un titre'),
            ':address_line2' => $this->getAddressLine2('je suis un titre'),
            ':postcode' => $this->postcode('je suis un titre'),
            ':city' => $this->getCity('je suis un titre'),
            ':country' => $this->getCountry('je suis un titre'),
            //pas administrator car par défaut il est en faulse            
        ], false);
    }



    //mise à jour d'1 utilisateur
    public function updateUser(int $pId): void
    {
        $this->prepare('update user where id = :id set (lastName = :last_name, firstName = :first_name, mail = :mail, userName = :user_name, password = :password, phone = :phone, addressLine1 = :address_line1, addressLine2 = :address_line2, postcode = :postcode, city = :city, country = :country, administrator = :administrator)', [
            ':id' => $pId,
            ':last_name' => $this->getLastName('je suis un titre'),
            ':first_name' => $this->getFirstName('je suis un content'),
            ':mail' => $this->getMail('je suis un titre'),
            ':user_name' => $this->getUserName('je suis un content'),
            ':password' => $this->getPassword('je suis un content'),
            ':phone' => $this->getPhone('je suis un titre'),
            ':address_line1' => $this->getAddressLine1('je suis un titre'),
            ':address_line2' => $this->getAddressLine2('je suis un titre'),
            ':postcode' => $this->postcode('je suis un titre'),
            ':city' => $this->getCity('je suis un titre'),
            ':country' => $this->getCountry('je suis un titre'),
            ':administrator' => $this->getAdministrator('je suis un titre'),
        ], false);
    }



    //suppression d'1 user
    public function removeUser(Quote $pId): void
    {
        $this->prepare('deleted from user where id = :id set (lastName = :last_name, firstName = :first_name, mail = :mail, userName = :user_name, password = :password, phone = :phone, addressLine1 = :address_line1, addressLine2 = :address_line2, postcode = :postcode, city = :city, country = :country, administrator = :administrator)', [
            ':id' => $pId,
            ':last_name' => $this->getLastName('je suis un titre'),
            ':first_name' => $this->getFirstName('je suis un content'),
            ':mail' => $this->getMail('je suis un titre'),
            ':user_name' => $this->getUserName('je suis un content'),
            ':password' => $this->getPassword('je suis un content'),
            ':phone' => $this->getPhone('je suis un titre'),
            ':address_line1' => $this->getAddressLine1('je suis un titre'),
            ':address_line2' => $this->getAddressLine2('je suis un titre'),
            ':postcode' => $this->postcode('je suis un titre'),
            ':city' => $this->getCity('je suis un titre'),
            ':country' => $this->getCountry('je suis un titre'),
            ':administrator' => $this->getAdministrator('je suis un titre'),
        ], false);
    }


    // Fonction récuperer tous les utilisateurs
    public function getUsers(): array
    {
        // cette instance est juste un select donc il n'a pas besoin des deux autres arguments car ils ont déjà des valeurs par défaut.
        return $this->prepare('select * from user ');
   }

}

