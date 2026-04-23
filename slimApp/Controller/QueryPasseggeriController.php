<?php

namespace Controller;

use Model\Query\PasseggeriConMediaMinimaQueryRepository;
use Model\Table\ViaggioTableRepository;
use Psr\Container\ContainerInterface;
use Slim\Psr7\Request;
use Slim\Psr7\Response;

class QueryPasseggeriController
{
    private ContainerInterface $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function index(Request $request, Response $response, array $args): Response
    {
        $params = $request->getQueryParams();
        $idViaggio = isset($params['id_viaggio']) ? (int) $params['id_viaggio'] : 0;
        $soglia = isset($params['soglia']) ? (float) $params['soglia'] : 0.0;

        $risultati = [];
        $submitted = $idViaggio > 0;

        if ($submitted) {
            $risultati = PasseggeriConMediaMinimaQueryRepository::execute($idViaggio, $soglia);
        }

        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('carPoolingQueryPasseggeri', [
            'idViaggio' => $idViaggio,
            'soglia' => $soglia,
            'viaggi' => ViaggioTableRepository::listAll(),
            'submitted' => $submitted,
            'risultati' => $risultati,
        ]));

        return $response;
    }
}
