<?php
// import funzioni (create_pdo() e display_table(dati, titolo_tabella))
require_once 'helper_functions.php';

$name = $_POST['name'] ?? '';

try {
    $query = "  SELECT 
                    -- Dati del destinatario (Passeggero)
                    u_pass.Email AS EmailPasseggero,
                    u_pass.Nome AS NomePasseggero,
                    
                    -- Dettagli del Viaggio
                    v.CittaPartenza,
                    v.CittaDestinazione,
                    v.DataOraPartenza,
                    
                    -- Dati dell'Autista e della sua Auto
                    u_aut.Nome AS NomeAutista,
                    u_aut.Cognome AS CognomeAutista,
                    u_aut.Telefono AS TelefonoAutista,
                    a.MarcaModelloAuto,
                    a.TargaAuto
                    
                FROM Prenotazione p
                -- Join per i dati del viaggio
                JOIN Viaggio v ON p.ID_Viaggio = v.ID_Viaggio
                -- Join per i dati dell'autista (collegando Viaggio -> Autista -> Utente)
                JOIN Autista a ON v.ID_Autista = a.ID_Autista
                JOIN Utente u_aut ON a.ID_Autista = u_aut.ID_Utente
                -- Join per i dati del passeggero (collegando Prenotazione -> Utente)
                JOIN Utente u_pass ON p.ID_Passeggero = u_pass.ID_Utente

                WHERE p.ID_Prenotazione = :id_prenotazione -- Sostituisci con il codice specifico
                AND p.Stato = 'Accettata';";

    $pdo = create_pdo();
    $stmt = $pdo->prepare($query);
    $stmt->execute();

    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
    exit;
}

display_table($results, "Dati per email");

echo "<p><a href='index.php'><- Home</a></p>";
?>