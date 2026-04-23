<?php

use Controller\QueryPromemoriaController;
use Slim\App;

return static function (App $app): void {
    $app->get('/carpooling/promemoria', QueryPromemoriaController::class . ':index');
};
