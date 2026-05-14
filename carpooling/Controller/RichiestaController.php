<?php

namespace Controller;

use Psr\Container\ContainerInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Model\RichiestaRepository;

class RichiestaController
{
    private ContainerInterface $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function mostraPromemoria(Request $request, Response $response, array $args): Response
    {
        $params = $request->getQueryParams();
        $idPrenotazione = isset($params['id_prenotazione']) ? (int) $params['id_prenotazione'] : 0;

        $promemoria = null;
        $submitted = $idPrenotazione > 0;

        if ($submitted) {
            $promemoria = RichiestaRepository::getDatiPromemoria($idPrenotazione);
        }

        $prenotazioniAccettate = RichiestaRepository::getPrenotazioniAccettate();

        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('mostra_promemoria', [
            'idPrenotazione' => $idPrenotazione,
            'prenotazioniAccettate' => $prenotazioniAccettate,
            'submitted' => $submitted,
            'promemoria' => $promemoria,
        ]));

        return $response;
    }
}
