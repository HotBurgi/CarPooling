<?php $this->layout('layout') ?>

<h2>Cerca Autisti (Query 1)</h2>
<form method="get" action="/cerca_autisti">
    <p>
        <label>Città di Partenza:</label>
        <input type="text" name="partenza" required value="<?=$this->e($filtri['partenza'])?>">
    </p>
    <p>
        <label>Città di Destinazione:</label>
        <input type="text" name="destinazione" required value="<?=$this->e($filtri['destinazione'])?>">
    </p>
    <p>
        <label>Data del Viaggio:</label>
        <input type="date" name="data" required value="<?=$this->e($filtri['data'])?>">
    </p>
    <button type="submit">Cerca Autisti</button>
</form>

<?php if ($submitted): ?>
    <hr>
    <h3>Risultati della Ricerca</h3>
    <?php if (empty($risultati)): ?>
        <p>Nessun autista trovato per questa tratta e data.</p>
    <?php else: ?>
        <table>
            <tr>
                <th>Nome Autista</th>
                <th>Auto</th>
                <th>Targa</th>
                <th>Contributo</th>
                <th>Ora Partenza</th>
            </tr>
            <?php foreach ($risultati as $r): ?>
            <tr>
                <td><?=$this->e($r['nome'])?> <?=$this->e($r['cognome'])?></td>
                <td><?=$this->e($r['modello'])?></td>
                <td><?=$this->e($r['targa'])?></td>
                <td>€ <?=$this->e($r['contributoEconomico'])?></td>
                <td><?=$this->e($r['ora'])?></td>
            </tr>
            <?php endforeach; ?>
        </table>
    <?php endif; ?>
<?php endif; ?>
