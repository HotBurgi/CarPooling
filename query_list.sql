-- data una città di partenza, una di arrivo e una data, elencare gli autisti che propongono un viaggio corrispondente con prenotazioni non ancora chiuse, in ordine crescente di orario, riportando i dati dell’auto e il contributo economico richiesto;
SELECT
    u.Nome,
    u.Cognome,
    a.MarcaModelloAuto,
    a.TargaAuto,
    v.Contributo,
    v.DataOraPartenza
FROM
    Utente u
    JOIN Autista a ON u.ID_Utente = a.ID_Autista
    JOIN Viaggio v ON a.ID_Autista = v.ID_Autista
WHERE
    v.CittaPartenza = 'Roma' -- Sostituire con parametro :partenza
    AND v.CittaDestinazione = 'Milano' -- Sostituire con parametro :destinazione
    AND DATE (v.DataOraPartenza) = '2026-05-20' -- Sostituire con parametro :data
    AND v.PrenotazioniChiuse = FALSE
ORDER BY
    v.DataOraPartenza ASC;

-- dato il codice di una prenotazione accettata, estrarre i dati necessari per predisporre l’email di promemoria da inviare all’utente passeggero; 

SELECT 
    -- Dati del destinatario (Passeggero)
    u_pass.Email AS EmailPasseggero,
    u_pass.Nome AS NomePasseggero,
    
    -- Dettagli del Viaggio
    v.CittaPartenza,
    v.CittaDestinazione,
    v.DataOraPartenza,
    
    -- Dati dell'Autista e della sua Auto
    u_aut.Nome AS NomeAutista,
    u_aut.Cognome AS CognomeAutista,
    u_aut.Telefono AS TelefonoAutista,
    a.MarcaModelloAuto,
    a.TargaAuto
    
FROM Prenotazione p
-- Join per i dati del viaggio
JOIN Viaggio v ON p.ID_Viaggio = v.ID_Viaggio
-- Join per i dati dell'autista (collegando Viaggio -> Autista -> Utente)
JOIN Autista a ON v.ID_Autista = a.ID_Autista
JOIN Utente u_aut ON a.ID_Autista = u_aut.ID_Utente
-- Join per i dati del passeggero (collegando Prenotazione -> Utente)
JOIN Utente u_pass ON p.ID_Passeggero = u_pass.ID_Utente

WHERE p.ID_Prenotazione = :id_prenotazione -- Sostituisci con il codice specifico
  AND p.Stato = 'Accettata';

-- dato un certo viaggio, consentire all’autista di valutare le caratteristiche dei passeggeri visualizzando l’elenco di coloro che lo hanno prenotato, con il voto medio dei feedback ricevuti da ciascun passeggero, presentando solo i passeggeri che hanno voto medio superiore ad un valore indicato dall’autista;

SELECT 
    u.Nome, 
    u.Cognome, 
    u.Telefono,
    p_det.TipoDocumento,
    ROUND(AVG(f.Voto), 1) AS MediaFeedbackPasseggero,
    COUNT(f.ID_Feedback) AS NumeroRecensioni
FROM Prenotazione pr
-- Colleghiamo la prenotazione ai dati anagrafici del passeggero
JOIN Utente u ON pr.ID_Passeggero = u.ID_Utente
JOIN Passeggero p_det ON u.ID_Utente = p_det.ID_Passeggero
-- Colleghiamo i feedback ricevuti da questo passeggero in ALTRE prenotazioni
LEFT JOIN Prenotazione pr_storiche ON pr.ID_Passeggero = pr_storiche.ID_Passeggero
LEFT JOIN Feedback f ON pr_storiche.ID_Prenotazione = f.ID_Prenotazione 
    AND f.Autore = 'Autista' -- Consideriamo solo i voti dati dagli autisti ai passeggeri
WHERE pr.ID_Viaggio = :id_viaggio_selezionato -- Il viaggio specifico dell'autista
GROUP BY u.ID_Utente, u.Nome, u.Cognome, u.Telefono, p_det.TipoDocumento
HAVING MediaFeedbackPasseggero >= :soglia_minima_voto 
    OR MediaFeedbackPasseggero IS NULL; -- Utile se vuoi mostrare anche i nuovi utenti senza voto