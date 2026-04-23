<?php
/** @var $filtri
 * @var $submitted
 * @var $risultati
 */
?>
<?php $this->layout('carPoolingLayout', ['title' => 'CarPooling - Query 1']) ?>

<h2>Query 1 - Autisti per tratta e data</h2>
<p>Data una citta di partenza, una di arrivo e una data, mostra gli autisti con prenotazioni non chiuse.</p>

<form method="get" action="<?=$base_path?>/carpooling/autisti" class="form-horizontal">
    <div class="form-group">
        <div class="col-3 col-sm-12"><label class="form-label" for="partenza">Partenza</label></div>
        <div class="col-9 col-sm-12"><input class="form-input" id="partenza" name="partenza" required value="<?=$this->e($filtri['partenza'])?>"></div>
    </div>
    <div class="form-group">
        <div class="col-3 col-sm-12"><label class="form-label" for="destinazione">Destinazione</label></div>
        <div class="col-9 col-sm-12"><input class="form-input" id="destinazione" name="destinazione" required value="<?=$this->e($filtri['destinazione'])?>"></div>
    </div>
    <div class="form-group">
        <div class="col-3 col-sm-12"><label class="form-label" for="data">Data</label></div>
        <div class="col-9 col-sm-12"><input class="form-input" type="date" id="data" name="data" required value="<?=$this->e($filtri['data'])?>"></div>
    </div>
    <button class="btn btn-primary" type="submit">Esegui query</button>
</form>

<?php if ($submitted): ?>
    <h4 class="mt-2">Risultati</h4>
    <?php if (empty($risultati)): ?>
        <p>Nessun viaggio trovato con i parametri inseriti.</p>
    <?php else: ?>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Autista</th>
                <th>Auto</th>
                <th>Targa</th>
                <th>Contributo</th>
                <th>Partenza</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($risultati as $r): ?>
                <tr>
                    <td><?=$this->e($r['Nome'])?> <?=$this->e($r['Cognome'])?></td>
                    <td><?=$this->e($r['MarcaModelloAuto'])?></td>
                    <td><?=$this->e($r['TargaAuto'])?></td>
                    <td>€ <?=$this->e($r['Contributo'])?></td>
                    <td><?=$this->e($r['DataOraPartenza'])?></td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?>
<?php endif; ?>
