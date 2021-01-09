<?php
trait Bdd
{
    private function getConfig()
    {
        return [
            'database' => [
                'port' => 3306,
                'name' => 'projet',
                'login' => 'root',
                'password' => '',
            ],
        ];
    }

    private function initPdo()
    {
        var_dump('toto');
        die;
        $config = $this->getConfig();
            $pdo = new PDO("mysql:host=localhost:" . $config['database']['port'] . ";dbname=" . $config['database']['name'], $config['database']['login'], $config['database']['password']);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_ERROR);
            return $pdo;
        // try {
        //     $config = $this->getConfig();
        //     $pdo = new PDO("mysql:host=localhost:" . $config['database']['port'] . ";dbname=" . $config['database']['name'], $config['database']['login'], $config['database']['password']);
        //     $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_ERROR);
        //     var_dump($pdo);
        //     return $pdo;
        // } catch (PDOException $exception) {
        //     http_response_code(500);
        // }
    }

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