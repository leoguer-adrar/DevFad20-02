<?php

class DAO
{
    private array $config;
    private static ?DAO $dao = null;
    private PDO $pdo;
    private PDOStatement $statement;

    private function __construct()
    {
        $this->config = require '../config.php';
        $this->initPdo();
    }

    public static function getInstance(): DAO
    {
        if (self::$dao === null) {
            self::$dao = new DAO();
        }
        return self::$dao;
    }

    public function initPdo(): PDO
    {
        try {
            $this->pdo = new PDO("mysql:host=localhost:"
                . $this->config['database']['port']
                . ";dbname="
                . $this->config['database']['name']
                . ";charset=UTF8",
                $this->config['database']['login'],
                $this->config['database']['password']
            );
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
            return $this->pdo;
        } catch (PDOException $exception) {
            http_response_code(500);
            debug($exception);
        }
    }

    public function execute(string $query, array $values = null): DAO
    {
        $this->statement = $this->pdo->prepare($query);
        $this->statement->execute($values);
        return $this;
    }

    public function fetchAll(): array
    {
        return $this->statement->fetchAll(PDO::FETCH_ASSOC);
    }

    public function fetch(): array
    {
        return $this->statement->fetch(PDO::FETCH_ASSOC);
    }
}