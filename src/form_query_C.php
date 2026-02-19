<form method="POST">
    <label for="id_viaggio">Id viaggio:</label>
    <input type="text" id="id_viaggio" name="id_viaggio" required>

    <label for="min_voto">Voto minimo:</label>
    <input type="number" id="min_voto" name="min_voto" required>
    <button type="submit">Search</button>
</form>

<?php
// import funzioni (create_pdo() e display_table(dati, titolo_tabella))
require_once 'helper_functions.php';

$name = $_POST['name'] ?? '';

try {
    $query = "  SELECT 
                    u.Nome, 
                    u.Cognome, 
                    u.Telefono,
                    p_det.TipoDocumento,
                    ROUND(AVG(f.Voto), 1) AS MediaFeedbackPasseggero,
                    COUNT(f.ID_Feedback) AS NumeroRecensioni
                FROM Prenotazione pr
                -- Colleghiamo la prenotazione ai dati anagrafici del passeggero
                JOIN Utente u ON pr.ID_Passeggero = u.ID_Utente
                JOIN Passeggero p_det ON u.ID_Utente = p_det.ID_Passeggero
                -- Colleghiamo i feedback ricevuti da questo passeggero in ALTRE prenotazioni
                LEFT JOIN Prenotazione pr_storiche ON pr.ID_Passeggero = pr_storiche.ID_Passeggero
                LEFT JOIN Feedback f ON pr_storiche.ID_Prenotazione = f.ID_Prenotazione 
                    AND f.Autore = 'Autista' -- Consideriamo solo i voti dati dagli autisti ai passeggeri
                WHERE pr.ID_Viaggio = ?
                GROUP BY u.ID_Utente, u.Nome, u.Cognome, u.Telefono, p_det.TipoDocumento
                HAVING MediaFeedbackPasseggero >= ? 
                    OR MediaFeedbackPasseggero IS NULL; -- Utile se vuoi mostrare anche i nuovi utenti senza voto";

    $pdo = create_pdo();
    $stmt = $pdo->prepare($query);
    $stmt->execute([$id_viaggio, $min_voto]);

    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
    exit;
}

display_table($results, "IDK IDk");

echo "<p><a href='index.php'><- Home</a></p>";
?>