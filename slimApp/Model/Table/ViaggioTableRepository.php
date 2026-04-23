<?php

namespace Model\Table;

use Util\Connection;

class ViaggioTableRepository
{
    public static function listAll(): array
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->query(
            'SELECT ID_Viaggio, CittaPartenza, CittaDestinazione, DataOraPartenza
             FROM Viaggio
             ORDER BY DataOraPartenza DESC'
        );

        return $stmt->fetchAll();
    }
}
