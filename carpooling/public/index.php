<?php

use DI\Container as Container;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use League\Plates\Engine;
use Controller\AutistaController;
use Controller\PasseggeroController;
use Controller\RichiestaController;

require __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../conf/config.php';

$container = new Container();

$container->set('template', function () {
    return new Engine(__DIR__ . '/../templates', 'tpl');
});

AppFactory::setContainer($container);
$app = AppFactory::create();

$app->addErrorMiddleware(true, true, true);

$app->get('/', function (Request $request, Response $response, $args) {
    $engine = $this->get('template');
    $response->getBody()->write($engine->render('home'));
    return $response;
});

$app->get('/cerca_autisti', AutistaController::class . ':cercaAutisti');
$app->get('/filtra_passeggeri', PasseggeroController::class . ':filtraPasseggeri');
$app->get('/mostra_promemoria', RichiestaController::class . ':mostraPromemoria');

$app->run();
