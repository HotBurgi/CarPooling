<?php
namespace Model;
use PDO;

class AutistaRepository {
    public static function getAutistiPerTratta($partenza, $destinazione, $data) {
        $pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset='.DB_CHAR, DB_USER, DB_PASSWORD);
        $sql = "SELECT a.nome, a.cognome, a.targa, a.modello, v.ora, v.contributoEconomico 
                FROM autista a 
                JOIN viaggio v ON a.idAutista = v.idAutista 
                WHERE v.cittaPartenza = :partenza 
                AND v.cittaDestinazione = :destinazione 
                AND v.data = :data 
                AND v.prenotazioniAperte = 1 
                ORDER BY v.ora ASC";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'partenza' => $partenza,
            'destinazione' => $destinazione,
            'data' => $data
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
