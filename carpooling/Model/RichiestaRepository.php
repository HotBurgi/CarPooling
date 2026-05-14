<?php
namespace Model;
use PDO;

class RichiestaRepository {
    public static function getPrenotazioniAccettate() {
        $pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset='.DB_CHAR, DB_USER, DB_PASSWORD);
        $sql = "SELECT r.idRichiesta AS ID_Prenotazione, p.nome AS Nome, p.cognome AS Cognome, v.idViaggio AS ID_Viaggio 
                FROM richiesta r 
                JOIN passeggero p ON r.idPasseggero = p.idPasseggero 
                JOIN viaggio v ON r.idViaggio = v.idViaggio 
                WHERE r.accettata = 1";
        return $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getDatiPromemoria($idRichiesta) {
        $pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset='.DB_CHAR, DB_USER, DB_PASSWORD);
        $sql = "SELECT p.nome AS NomePasseggero, p.cognome AS CognomePasseggero, p.email AS EmailPasseggero, 
                v.cittaPartenza, v.cittaDestinazione, v.data AS DataOraPartenza, v.ora, 
                a.nome AS NomeAutista, a.cognome AS CognomeAutista, a.targa, a.modello, a.nTelefono AS TelefonoAutista 
                FROM richiesta r 
                JOIN passeggero p ON r.idPasseggero = p.idPasseggero 
                JOIN viaggio v ON r.idViaggio = v.idViaggio 
                JOIN autista a ON v.idAutista = a.idAutista 
                WHERE r.idRichiesta = :idRichiesta";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['idRichiesta' => $idRichiesta]);
        $promemoria = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($promemoria) {
            $promemoria['DataOraPartenza'] = $promemoria['DataOraPartenza'] . ' ' . $promemoria['ora'];
        }
        
        return $promemoria;
    }
}
