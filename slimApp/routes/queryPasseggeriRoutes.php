<?php

use Controller\QueryPasseggeriController;
use Slim\App;

return static function (App $app): void {
    $app->get('/carpooling/passeggeri', QueryPasseggeriController::class . ':index');
};
