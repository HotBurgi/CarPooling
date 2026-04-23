<?php
/** @var $idPrenotazione
 * @var $prenotazioniAccettate
 * @var $submitted
 * @var $promemoria
 */
?>
<?php $this->layout('carPoolingLayout', ['title' => 'CarPooling - Query 2']) ?>

<h2>Query 2 - Promemoria prenotazione accettata</h2>
<p>Dato il codice di una prenotazione accettata, estrai i dati per l'email di promemoria al passeggero.</p>

<form method="get" action="<?=$base_path?>/carpooling/promemoria" class="form-horizontal">
    <div class="form-group">
        <div class="col-3 col-sm-12"><label class="form-label" for="id_prenotazione">ID Prenotazione</label></div>
        <div class="col-9 col-sm-12">
            <select id="id_prenotazione" name="id_prenotazione" class="form-select" required>
                <option value="">Seleziona prenotazione</option>
                <?php foreach ($prenotazioniAccettate as $p): ?>
                    <option value="<?=$p['ID_Prenotazione']?>" <?=$idPrenotazione === (int)$p['ID_Prenotazione'] ? 'selected' : ''?>>
                        #<?=$p['ID_Prenotazione']?> - <?=$this->e($p['Nome'])?> <?=$this->e($p['Cognome'])?> (Viaggio <?=$p['ID_Viaggio']?>)
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <button class="btn btn-primary" type="submit">Esegui query</button>
</form>

<?php if ($submitted): ?>
    <h4 class="mt-2">Dati promemoria</h4>
    <?php if ($promemoria === null): ?>
        <p>Nessuna prenotazione accettata trovata con questo ID.</p>
    <?php else: ?>
        <div class="tile">
            <div class="tile-content">
                <p><strong>Destinatario:</strong> <?=$this->e($promemoria['NomePasseggero'])?> <?=$this->e($promemoria['CognomePasseggero'])?> (<?=$this->e($promemoria['EmailPasseggero'])?>)</p>
                <p><strong>Viaggio:</strong> <?=$this->e($promemoria['CittaPartenza'])?> → <?=$this->e($promemoria['CittaDestinazione'])?>, partenza <?=$this->e($promemoria['DataOraPartenza'])?></p>
                <p><strong>Autista:</strong> <?=$this->e($promemoria['NomeAutista'])?> <?=$this->e($promemoria['CognomeAutista'])?> - Tel. <?=$this->e($promemoria['TelefonoAutista'])?></p>
                <p><strong>Auto:</strong> <?=$this->e($promemoria['MarcaModelloAuto'])?> (<?=$this->e($promemoria['TargaAuto'])?>)</p>
            </div>
        </div>
    <?php endif; ?>
<?php endif; ?>
