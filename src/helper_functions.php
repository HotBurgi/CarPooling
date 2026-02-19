<?php

// funzione per creare e visualizzare le tabelle, dati in input i risultati della query
function display_table(array $results = [], string $title = 'Risultati della Query', bool $echo = true): void
{
    if (empty($results)) {
        echo "<p>Nessun dato da mostrare.</p>";
        return;
    }

    // titolo tabella
    echo "<h1>" . htmlspecialchars($title) . "</h1>";
    echo '<table border="1">';
    echo '<tr>';

    // intestazioni
    foreach (array_keys($results[0]) as $column) {
        echo '<th>' . htmlspecialchars($column) . '</th>';
    }
    echo '</tr>';

    // righe
    foreach ($results as $row) {
        echo '<tr>';
        foreach ($row as $value) {
            echo '<td>' . htmlspecialchars((string) $value) . '</td>';
        }
        echo '</tr>';
    }
    echo '</table>';
}

// funzione per creare pdo
function create_pdo(): PDO
{
    $host = 'localhost';
    $db = 'CarPoolingDB';
    $user = 'CarPoolingDB';
    $pass = 'CarPoolingDB';
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $pdo;

}