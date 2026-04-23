<?php
/** @var $idViaggio
 * @var $soglia
 * @var $viaggi
 * @var $submitted
 * @var $risultati
 */
?>
<?php $this->layout('carPoolingLayout', ['title' => 'CarPooling - Query 3']) ?>

<h2>Query 3 - Passeggeri con voto medio minimo</h2>
<p>Per un viaggio selezionato, mostra i passeggeri prenotati con media feedback da autista sopra soglia.</p>

<form method="get" action="<?=$base_path?>/carpooling/passeggeri" class="form-horizontal">
    <div class="form-group">
        <div class="col-3 col-sm-12"><label class="form-label" for="id_viaggio">Viaggio</label></div>
        <div class="col-9 col-sm-12">
            <select id="id_viaggio" name="id_viaggio" class="form-select" required>
                <option value="">Seleziona viaggio</option>
                <?php foreach ($viaggi as $v): ?>
                    <option value="<?=$v['ID_Viaggio']?>" <?=$idViaggio === (int)$v['ID_Viaggio'] ? 'selected' : ''?>>
                        #<?=$v['ID_Viaggio']?> - <?=$this->e($v['CittaPartenza'])?> → <?=$this->e($v['CittaDestinazione'])?> (<?=$this->e($v['DataOraPartenza'])?>)
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-3 col-sm-12"><label class="form-label" for="soglia">Soglia voto minimo</label></div>
        <div class="col-9 col-sm-12"><input class="form-input" type="number" min="0" max="5" step="0.1" id="soglia" name="soglia" value="<?=$this->e((string)$soglia)?>" required></div>
    </div>
    <button class="btn btn-primary" type="submit">Esegui query</button>
</form>

<?php if ($submitted): ?>
    <h4 class="mt-2">Risultati</h4>
    <?php if (empty($risultati)): ?>
        <p>Nessun passeggero trovato con la soglia indicata.</p>
    <?php else: ?>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Passeggero</th>
                <th>Telefono</th>
                <th>Documento</th>
                <th>Media feedback</th>
                <th>N. recensioni</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($risultati as $r): ?>
                <tr>
                    <td><?=$this->e($r['Nome'])?> <?=$this->e($r['Cognome'])?></td>
                    <td><?=$this->e($r['Telefono'])?></td>
                    <td><?=$this->e($r['TipoDocumento'])?> <?=$this->e($r['NumeroDocumento'])?></td>
                    <td><?=($r['MediaFeedbackPasseggero'] === null) ? 'Nessun voto' : $this->e((string)$r['MediaFeedbackPasseggero'])?></td>
                    <td><?=$this->e((string)$r['NumeroRecensioni'])?></td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?>
<?php endif; ?>
