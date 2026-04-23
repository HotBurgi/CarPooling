<?php

use Controller\HomeController;
use Slim\App;

return static function (App $app): void {
    $app->get('/', HomeController::class . ':index');
};
