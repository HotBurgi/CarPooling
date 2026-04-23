# CarPooling Slim MVC

Applicazione Slim 4 (MVC + Plates) collegata al database `CarPoolingDB`.

## Funzionalita implementate

- `Query 1`: autisti disponibili per tratta+data con prenotazioni aperte.
- `Query 2`: dati promemoria email per prenotazione accettata.
- `Query 3`: passeggeri di un viaggio con media feedback sopra soglia.

Ogni query ha la sua pagina dedicata:

- `/carpooling/autisti`
- `/carpooling/promemoria`
- `/carpooling/passeggeri`

---

## Avvio con un unico comando Docker (consigliato)

Prerequisito: Docker Desktop installato.

Dalla cartella `slimApp` esegui:

```bash
docker compose up --build
```

Poi apri:

- App: http://localhost:8080
- DB MySQL: `localhost:3307`
- Dashboard MySQL (phpMyAdmin): http://localhost:8081

Credenziali DB usate in Docker:

- Database: `CarPoolingDB`
- User: `carpool`
- Password: `carpool`
- Root password: `root`

Nota: il dump `../CarPoolingDB.sql` viene importato automaticamente al primo avvio del container DB.

Per fermare:

```bash
docker compose down
```

Per azzerare anche i dati DB persistiti:

```bash
docker compose down -v
```

---

## Avvio locale senza Docker

Prerequisiti:

- PHP 8.1+
- Apache/Nginx con URL rewriting verso `public/index.php`
- MariaDB/MySQL con database creato da `CarPoolingDB.sql`

Configura `conf/config.php` (oppure variabili ambiente) con i parametri DB locali.

Se necessario installa dipendenze:

```bash
composer install
```

Servi la cartella `slimApp` con il web server e apri la root applicativa.

---

## Struttura principale

- `public/index.php`: bootstrap app e registrazione route modulari
- `routes/`: file route separati per home e query
- `Controller/HomeController.php`: home dashboard
- `Controller/QueryAutistiController.php`: pagina query autisti
- `Controller/QueryPromemoriaController.php`: pagina query promemoria
- `Controller/QueryPasseggeriController.php`: pagina query passeggeri
- `Model/Query/`: query SQL in file separati (uno per query)
- `Model/Table/`: accesso tabellare in file separati (uno per tabella)
- `templates/carPoolingLayout.tpl`: layout principale
- `templates/carPoolingHome.tpl`: dashboard home
- `templates/carPoolingQueryAutisti.tpl`, `templates/carPoolingQueryPromemoria.tpl`, `templates/carPoolingQueryPasseggeri.tpl`: viste query
- `docker-compose.yml` + `Dockerfile`: esecuzione containerizzata
