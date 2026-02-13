-- data una città di partenza, una di arrivo e una data, elencare gli autisti che propongono un viaggio corrispondente con prenotazioni non ancora chiuse, in ordine crescente di orario, riportando i dati dell’auto e il contributo economico richiesto
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