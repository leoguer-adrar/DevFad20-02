<?php
trait BDD
{
    private function getConfig(): array
    {
    return [
        'database' => [
            'port' => 3306,
            'name' => 'projet',
            'login' => 'root',
            'password' => '',
        ]
    ];
    }
}