<form method="POST">
    <label for="partenza">Partenza:</label>
    <input type="text" id="partenza" name="partenza" required>

    <label for="destinazione">Destinazione:</label>
    <input type="text" id="destinazione" name="destinazione" required>

    <label for="data">Data (yyyy-mm-dd):</label>
    <input type="text" id="data" name="data" required>
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
                    a.MarcaModelloAuto,
                    a.TargaAuto,
                    v.Contributo,
                    v.DataOraPartenza
                FROM
                    Utente u
                    JOIN Autista a ON u.ID_Utente = a.ID_Autista
                    JOIN Viaggio v ON a.ID_Autista = v.ID_Autista
                WHERE
                    v.CittaPartenza = ?
                    AND v.CittaDestinazione = ?
                    AND DATE (v.DataOraPartenza) = ?
                    AND v.PrenotazioniChiuse = FALSE
                ORDER BY
                    v.DataOraPartenza ASC;";

    $pdo = create_pdo();
    $stmt = $pdo->prepare($query);
    $stmt->execute([$partenza, $destinazione, $data]);

    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
    exit;
}

display_table($results, "Autisti che propongono viaggio");

echo "<p><a href='index.php'><- Home</a></p>";
?>