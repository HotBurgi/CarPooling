<?php

use DI\Container as Container;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;


require __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../conf/config.php';
use League\Plates\Engine;

$container = new Container();

// Da inserire prima della create di AppFactory
AppFactory::setContainer($container);

$app = AppFactory::create();

//Questa parte deve contenere il percorso della
//sottocartella dove si trova l'applicazione in questo caso inserito nella
//variabile di configurazione BASE_PATH
$app->setBasePath(BASE_PATH);

$container->set('template', function () {
    $engine = new Engine(__DIR__ . '/../templates', 'tpl');
    $engine->addData(['base_path' => BASE_PATH]);
    return $engine;
});

$container->set('images', IMAGES);

// Define Custom Error Handler
$customErrorHandler = function (Request $request, Throwable $exception, bool $displayErrorDetails, bool $logErrors, bool $logErrorDetails) use ($app) {
    $payload = ['error' => $exception->getMessage()];

    $response = $app->getResponseFactory()->createResponse();
    $engine = $app->getContainer()->get('template');

    if ($exception instanceof \Slim\Exception\HttpNotFoundException) {
        $response->getBody()->write(
            $engine->render('404', $payload)
        );
    } else {
        $response->getBody()->write(
            "Errore nella pagina"
        );
    }
    return $response;
};

$errorMiddleware = $app->addErrorMiddleware(true, true, true);
if (MY_ERROR_HANDLER)
    $errorMiddleware->setDefaultErrorHandler($customErrorHandler);

$registerHomeRoutes = require __DIR__ . '/../routes/homeRoutes.php';
$registerQueryAutistiRoutes = require __DIR__ . '/../routes/queryAutistiRoutes.php';
$registerQueryPromemoriaRoutes = require __DIR__ . '/../routes/queryPromemoriaRoutes.php';
$registerQueryPasseggeriRoutes = require __DIR__ . '/../routes/queryPasseggeriRoutes.php';

$registerHomeRoutes($app);
$registerQueryAutistiRoutes($app);
$registerQueryPromemoriaRoutes($app);
$registerQueryPasseggeriRoutes($app);

$app->run();
