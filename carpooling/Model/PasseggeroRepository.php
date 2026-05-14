<?php
namespace Model;
use PDO;

class PasseggeroRepository {
    public static function getTuttiViaggi() {
        $pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset='.DB_CHAR, DB_USER, DB_PASSWORD);
        $sql = "SELECT idViaggio, cittaPartenza, cittaDestinazione, data FROM viaggio ORDER BY data DESC"; 
        return $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getPasseggeriSopraSoglia($idViaggio, $soglia) {
        $pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset='.DB_CHAR, DB_USER, DB_PASSWORD);
        $sql = "SELECT p.idPasseggero, p.nome, p.cognome, p.nTelefono, p.email, AVG(f.voto) as MediaVoti 
                FROM richiesta r 
                JOIN passeggero p ON r.idPasseggero = p.idPasseggero 
                LEFT JOIN feedbackpas f ON p.idPasseggero = f.idPasseggero 
                WHERE r.idViaggio = :idViaggio 
                GROUP BY p.idPasseggero, p.nome, p.cognome, p.nTelefono, p.email 
                HAVING AVG(f.voto) > :soglia";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'idViaggio' => $idViaggio,
            'soglia' => $soglia
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
