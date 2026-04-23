<?php

use Controller\QueryAutistiController;
use Slim\App;

return static function (App $app): void {
    $app->get('/carpooling/autisti', QueryAutistiController::class . ':index');
};
