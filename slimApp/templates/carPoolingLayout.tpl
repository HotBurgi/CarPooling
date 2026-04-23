<?php
/** @var $title
 * @var $base_path
 */ ?>
<!doctype html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-exp.min.css">
    <title><?=$this->e($title)?></title>
    <style>
        body {
            background: #f4f7fb;
        }
        .app-shell {
            margin-top: 24px;
            margin-bottom: 24px;
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 8px 24px rgba(12, 44, 79, 0.08);
        }
        .query-nav a {
            margin-right: 8px;
            margin-bottom: 8px;
        }
    </style>
</head>
<body>
<div class="container grid-lg app-shell">
    <header>
        <h1>CarPooling Dashboard</h1>
        <p class="text-gray">Applicazione Slim MVC collegata al database CarPoolingDB.</p>
        <div class="query-nav">
            <a class="btn" href="<?=$base_path?>/">Home</a>
            <a class="btn" href="<?=$base_path?>/carpooling/autisti">Autisti</a>
            <a class="btn" href="<?=$base_path?>/carpooling/promemoria">Promemoria</a>
            <a class="btn" href="<?=$base_path?>/carpooling/passeggeri">Passeggeri</a>
        </div>
        <hr>
    </header>
    <?=$this->section('content')?>
</div>
</body>
</html>
