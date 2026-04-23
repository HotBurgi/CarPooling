<?php

namespace Controller;

use Model\Query\PromemoriaPrenotazioneQueryRepository;
use Model\Table\PrenotazioneTableRepository;
use Psr\Container\ContainerInterface;
use Slim\Psr7\Request;
use Slim\Psr7\Response;

class QueryPromemoriaController
{
    private ContainerInterface $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function index(Request $request, Response $response, array $args): Response
    {
        $params = $request->getQueryParams();
        $idPrenotazione = isset($params['id_prenotazione']) ? (int) $params['id_prenotazione'] : 0;

        $promemoria = null;
        $submitted = $idPrenotazione > 0;

        if ($submitted) {
            $promemoria = PromemoriaPrenotazioneQueryRepository::execute($idPrenotazione);
        }

        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('carPoolingQueryPromemoria', [
            'idPrenotazione' => $idPrenotazione,
            'prenotazioniAccettate' => PrenotazioneTableRepository::listAccettate(),
            'submitted' => $submitted,
            'promemoria' => $promemoria,
        ]));

        return $response;
    }
}
