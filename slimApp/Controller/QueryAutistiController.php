<?php

namespace Controller;

use Model\Query\AutistiByTrattaQueryRepository;
use Psr\Container\ContainerInterface;
use Slim\Psr7\Request;
use Slim\Psr7\Response;

class QueryAutistiController
{
    private ContainerInterface $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function index(Request $request, Response $response, array $args): Response
    {
        $params = $request->getQueryParams();
        $partenza = trim((string) ($params['partenza'] ?? ''));
        $destinazione = trim((string) ($params['destinazione'] ?? ''));
        $data = trim((string) ($params['data'] ?? ''));

        $risultati = [];
        $submitted = $partenza !== '' || $destinazione !== '' || $data !== '';

        if ($partenza !== '' && $destinazione !== '' && $data !== '') {
            $risultati = AutistiByTrattaQueryRepository::execute($partenza, $destinazione, $data);
        }

        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('carPoolingQueryAutisti', [
            'filtri' => [
                'partenza' => $partenza,
                'destinazione' => $destinazione,
                'data' => $data,
            ],
            'submitted' => $submitted,
            'risultati' => $risultati,
        ]));

        return $response;
    }
}
