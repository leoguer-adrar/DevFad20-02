<?php
trait Bdd
{
 // informations pour la connection à la base de données
    private function getConfig()
    {
        return [
            'database' => [
                'port' => 3306,
                'name' => 'ProjetFilRouge',
                'login' => 'root',
                'password' => '',
            ],
        ];
    }

    //connection à la base de données //charset=UTF8 : permet de gérér les accents
    private function initPdo()
    {
        try {
            $config = $this->getConfig();
            $pdo = new PDO("mysql:host=localhost:" . $config['database']['port'] . ";dbname=" . $config['database']['name'] . ";charset=UTF8", $config['database']['login'], $config['database']['password']);            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
            return $pdo;
        } catch (PDOException $exception) {
            http_response_code(500);
        }
    }

    //formatage du retour de la base // fetchAll : Retourne un tableau contenant toutes les lignes du jeu d'enregistrements
    public function prepare(string $query, array $values = null, $fetchAll = true)
    {
        $statement = $this->initPdo()->prepare($query);
        $statement->execute($values);
        if ($fetchAll) {
            return $statement->fetchAll(PDO::FETCH_ASSOC);
        }
        return $statement;
    }
}
