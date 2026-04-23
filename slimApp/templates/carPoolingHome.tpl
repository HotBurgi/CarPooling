<?php $this->layout('carPoolingLayout', ['title' => 'CarPooling - Home']) ?>

<h2>Query richieste</h2>
<p>Ogni pagina implementa una query dell'esame usando il database CarPoolingDB.</p>

<div class="columns">
    <div class="column col-4 col-md-12">
        <div class="card">
            <div class="card-header"><div class="card-title h5">Query 1</div></div>
            <div class="card-body">Ricerca autisti per tratta e data con prenotazioni aperte.</div>
            <div class="card-footer"><a class="btn btn-primary" href="<?=$base_path?>/carpooling/autisti">Apri pagina</a></div>
        </div>
    </div>
    <div class="column col-4 col-md-12">
        <div class="card">
            <div class="card-header"><div class="card-title h5">Query 2</div></div>
            <div class="card-body">Dati promemoria email per prenotazione accettata.</div>
            <div class="card-footer"><a class="btn btn-primary" href="<?=$base_path?>/carpooling/promemoria">Apri pagina</a></div>
        </div>
    </div>
    <div class="column col-4 col-md-12">
        <div class="card">
            <div class="card-header"><div class="card-title h5">Query 3</div></div>
            <div class="card-body">Elenco passeggeri di un viaggio con voto medio minimo.</div>
            <div class="card-footer"><a class="btn btn-primary" href="<?=$base_path?>/carpooling/passeggeri">Apri pagina</a></div>
        </div>
    </div>
</div>
