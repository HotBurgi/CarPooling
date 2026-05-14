<?php $this->layout('layout') ?>

<h2>Filtra Passeggeri (Query 3)</h2>
<form method="get" action="/filtra_passeggeri">
    <p>
        <label>Seleziona il Viaggio:</label>
        <select name="id_viaggio" required>
            <option value="">Seleziona</option>
            <?php foreach ($viaggi as $v): ?>
                <option value="<?=$this->e($v['idViaggio'])?>" <?=$idViaggio === (int)$v['idViaggio'] ? 'selected' : ''?>>
                    Viaggio #<?=$this->e($v['idViaggio'])?>: <?=$this->e($v['cittaPartenza'])?> &rarr; <?=$this->e($v['cittaDestinazione'])?>
                </option>
            <?php endforeach; ?>
        </select>
    </p>
    <p>
        <label>Soglia Voto Minimo:</label>
        <input type="number" step="0.1" name="soglia" required value="<?=$this->e((string)$soglia)?>">
    </p>
    <button type="submit">Mostra Passeggeri</button>
</form>

<?php if ($submitted): ?>
    <hr>
    <h3>Risultati Filtro</h3>
    <?php if (empty($risultati)): ?>
        <p>Nessun passeggero supera la soglia di voto per questo viaggio.</p>
    <?php else: ?>
        <table>
            <tr>
                <th>Nome e Cognome</th>
                <th>Telefono</th>
                <th>Email</th>
                <th>Media Voti</th>
            </tr>
            <?php foreach ($risultati as $r): ?>
            <tr>
                <td><?=$this->e($r['nome'])?> <?=$this->e($r['cognome'])?></td>
                <td><?=$this->e($r['nTelefono'])?></td>
                <td><?=$this->e($r['email'])?></td>
                <td><?=($r['MediaVoti'] === null) ? 'Nessun voto' : $this->e((string)$r['MediaVoti'])?></td>
            </tr>
            <?php endforeach; ?>
        </table>
    <?php endif; ?>
<?php endif; ?>
