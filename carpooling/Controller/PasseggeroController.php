<?php

namespace Controller;

use Psr\Container\ContainerInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Model\PasseggeroRepository;

class PasseggeroController
{
    private ContainerInterface $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function filtraPasseggeri(Request $request, Response $response, array $args): Response
    {
        $params = $request->getQueryParams();
        $idViaggio = isset($params['id_viaggio']) ? (int) $params['id_viaggio'] : 0;
        $soglia = isset($params['soglia']) ? (float) $params['soglia'] : 0.0;

        $risultati = [];
        $submitted = $idViaggio > 0;

        if ($submitted) {
            $risultati = PasseggeroRepository::getPasseggeriSopraSoglia($idViaggio, $soglia);
        }

        $viaggi = PasseggeroRepository::getTuttiViaggi();

        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('filtra_passeggeri', [
            'idViaggio' => $idViaggio,
            'soglia' => $soglia,
            'viaggi' => $viaggi,
            'submitted' => $submitted,
            'risultati' => $risultati,
        ]));

        return $response;
    }
}
