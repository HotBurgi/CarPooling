<?php
/** @var $base_path
 * @var $error
 */
?>
<?php $this->layout('carPoolingLayout', ['title' => 'CarPooling']) ?>

    <h2>Pagina non trovata</h2>
    <p>La rotta richiesta non esiste.</p>

    <div class="columns">
        <div class="col-4 col-mx-auto"><img src="<?=$base_path?>/assets/404.png" class="img-responsive" alt="404 not found">
        </div>
    </div>
<!--<div class="code">Errore: <?=$error?></div>-->

