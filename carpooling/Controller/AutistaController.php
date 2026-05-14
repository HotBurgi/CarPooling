<?php

namespace Controller;

use Psr\Container\ContainerInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Model\AutistaRepository;

class AutistaController
{
    private ContainerInterface $container;

    // Slim inietta automaticamente il Container qui
    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function cercaAutisti(Request $request, Response $response, array $args): Response
    {
        $params = $request->getQueryParams();
        $partenza = trim((string) ($params['partenza'] ?? ''));
        $destinazione = trim((string) ($params['destinazione'] ?? ''));
        $data = trim((string) ($params['data'] ?? ''));

        $risultati = [];
        $submitted = $partenza !== '' || $destinazione !== '' || $data !== '';

        if ($partenza !== '' && $destinazione !== '' && $data !== '') {
            $risultati = AutistaRepository::getAutistiPerTratta($partenza, $destinazione, $data);
        }

        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('cerca_autisti', [
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
