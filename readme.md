# Progetto CarPooling (Esame di Stato 2017)

Applicazione web sviluppata in **PHP (Slim 4)** con pattern **MVC**, collegata al database `carpooling`.

## Struttura del Progetto (Lavoro di Gruppo)

Il progetto è stato suddiviso in tre moduli, uno per ogni membro del gruppo, corrispondenti alle tre query richieste:

1. **Autisti (`AutistaController` + `AutistaRepository`)**
   Ricerca degli autisti che propongono un viaggio per una determinata tratta e data, con prenotazioni aperte.
2. **Promemoria (`RichiestaController` + `RichiestaRepository`)**
   Estrazione dei dati necessari per inviare una mail di promemoria a un passeggero per la sua prenotazione.
3. **Passeggeri (`PasseggeroController` + `PasseggeroRepository`)**
   Elenco dei passeggeri prenotati per un viaggio specifico, filtrati in base alla loro media voti (soglia minima).

## Avvio Rapido (con Docker)

1. Apri il terminale nella cartella `carpooling`.
2. Esegui il comando:
   ```bash
   docker compose up -d
   ```
3. L'applicazione sarà visibile su: [http://localhost:8080](http://localhost:8080)
4. Il database phpMyAdmin sarà accessibile su: [http://localhost:8081](http://localhost:8081)

(Il database verrà inizializzato automaticamente con il file `carpooling.sql` al primo avvio).
