<?php $this->layout('layout') ?>

<h2>Promemoria Prenotazione (Query 2)</h2>
<form method="get" action="/mostra_promemoria">
    <p>
        <label>Seleziona Prenotazione:</label>
        <select name="id_prenotazione" required>
            <option value="">Seleziona</option>
            <?php foreach ($prenotazioniAccettate as $p): ?>
                <option value="<?=$this->e($p['ID_Prenotazione'])?>" <?=$idPrenotazione === (int)$p['ID_Prenotazione'] ? 'selected' : ''?>>
                    Prenotazione #<?=$this->e($p['ID_Prenotazione'])?> - <?=$this->e($p['Nome'])?> <?=$this->e($p['Cognome'])?> (Viaggio #<?=$this->e($p['ID_Viaggio'])?>)
                </option>
            <?php endforeach; ?>
        </select>
    </p>
    <button type="submit">Genera Promemoria Email</button>
</form>

<?php if ($submitted): ?>
    <hr>
    <h3>Dati Email da Inviare</h3>
    <?php if ($promemoria === null): ?>
        <p>Nessuna prenotazione accettata trovata con questo ID.</p>
    <?php else: ?>
        <blockquote>
            <p><strong>A:</strong> <?=$this->e($promemoria['NomePasseggero'])?> <?=$this->e($promemoria['CognomePasseggero'])?> (<?=$this->e($promemoria['EmailPasseggero'])?>)</p>
            <hr>
            <p><strong>Oggetto:</strong> Promemoria del tuo viaggio in CarPooling</p>
            <p><strong>Tratta:</strong> <?=$this->e($promemoria['cittaPartenza'])?> &rarr; <?=$this->e($promemoria['cittaDestinazione'])?></p>
            <p><strong>Data e Ora:</strong> <?=$this->e($promemoria['DataOraPartenza'])?></p>
            <p><strong>Autista assegnato:</strong> <?=$this->e($promemoria['NomeAutista'])?> <?=$this->e($promemoria['CognomeAutista'])?> (Cell. <?=$this->e($promemoria['TelefonoAutista'])?>)</p>
            <p><strong>Auto:</strong> <?=$this->e($promemoria['modello'])?> - Targa: <?=$this->e($promemoria['targa'])?></p>
        </blockquote>
    <?php endif; ?>
<?php endif; ?>
