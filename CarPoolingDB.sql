-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 19, 2026 at 01:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CarPoolingDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Autista`
--

CREATE TABLE `Autista` (
  `ID_Autista` int(11) NOT NULL,
  `NumeroPatente` varchar(20) NOT NULL,
  `ScadenzaPatente` date NOT NULL,
  `MarcaModelloAuto` varchar(100) NOT NULL,
  `TargaAuto` varchar(20) NOT NULL,
  `UrlFotografia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Autista`
--

INSERT INTO `Autista` (`ID_Autista`, `NumeroPatente`, `ScadenzaPatente`, `MarcaModelloAuto`, `TargaAuto`, `UrlFotografia`) VALUES
(1, 'U1234567A', '2030-05-15', 'Fiat Tipo', 'AB123CD', '/images/profiles/marco.jpg'),
(3, 'U9876543B', '2028-11-20', 'Toyota Yaris', 'EF456GH', '/images/profiles/luca.jpg'),
(5, 'U4561237C', '2032-01-10', 'Volkswagen Golf', 'IL789MN', '/images/profiles/alessandro.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Feedback`
--

CREATE TABLE `Feedback` (
  `ID_Feedback` int(11) NOT NULL,
  `ID_Prenotazione` int(11) NOT NULL,
  `Autore` enum('Autista','Passeggero') NOT NULL,
  `Voto` int(11) NOT NULL CHECK (`Voto` between 1 and 5),
  `Giudizio` text DEFAULT NULL,
  `DataInserimento` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Feedback`
--

INSERT INTO `Feedback` (`ID_Feedback`, `ID_Prenotazione`, `Autore`, `Voto`, `Giudizio`, `DataInserimento`) VALUES
(1, 1, 'Passeggero', 5, 'Viaggio perfetto, Marco è stato gentilissimo e puntuale.', '2026-02-19 13:32:46'),
(2, 1, 'Autista', 5, 'Giulia è un passeggero modello, super consigliata!', '2026-02-19 13:32:46'),
(3, 2, 'Passeggero', 4, 'Buon viaggio, ma aria condizionata un po troppo fredda.', '2026-02-19 13:32:46'),
(4, 2, 'Autista', 4, 'Sofia è tranquilla, ha dormito quasi tutto il tempo.', '2026-02-19 13:32:46'),
(5, 6, 'Passeggero', 5, 'Confermo che Marco è un ottimo autista.', '2026-02-19 13:32:46'),
(6, 6, 'Autista', 5, 'Sempre un piacere viaggiare con Giulia.', '2026-02-19 13:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `Passeggero`
--

CREATE TABLE `Passeggero` (
  `ID_Passeggero` int(11) NOT NULL,
  `TipoDocumento` varchar(50) NOT NULL,
  `NumeroDocumento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Passeggero`
--

INSERT INTO `Passeggero` (`ID_Passeggero`, `TipoDocumento`, `NumeroDocumento`) VALUES
(1, 'Carta d Identita', 'CA1122334'),
(2, 'Passaporto', 'YA9988776'),
(4, 'Carta d Identita', 'CA5566778');

-- --------------------------------------------------------

--
-- Table structure for table `Prenotazione`
--

CREATE TABLE `Prenotazione` (
  `ID_Prenotazione` int(11) NOT NULL,
  `ID_Viaggio` int(11) NOT NULL,
  `ID_Passeggero` int(11) NOT NULL,
  `Stato` enum('In attesa','Accettata','Rifiutata') DEFAULT 'In attesa',
  `DataRichiesta` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Prenotazione`
--

INSERT INTO `Prenotazione` (`ID_Prenotazione`, `ID_Viaggio`, `ID_Passeggero`, `Stato`, `DataRichiesta`) VALUES
(1, 1, 2, 'Accettata', '2023-09-25 10:00:00'),
(2, 1, 4, 'Accettata', '2023-09-28 15:30:00'),
(3, 2, 4, 'In attesa', '2026-04-01 09:15:00'),
(4, 2, 1, 'Accettata', '2026-04-02 11:20:00'),
(5, 3, 2, 'Rifiutata', '2026-05-01 16:45:00'),
(6, 4, 2, 'Accettata', '2023-11-10 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Utente`
--

CREATE TABLE `Utente` (
  `ID_Utente` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `DataRegistrazione` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Utente`
--

INSERT INTO `Utente` (`ID_Utente`, `Nome`, `Cognome`, `Email`, `Telefono`, `DataRegistrazione`) VALUES
(1, 'Marco', 'Rossi', 'marco.rossi@email.it', '+393331112233', '2026-02-19 13:32:46'),
(2, 'Giulia', 'Bianchi', 'giulia.b@email.it', '+393471234567', '2026-02-19 13:32:46'),
(3, 'Luca', 'Verdi', 'luca.verdi88@email.it', '+393389876543', '2026-02-19 13:32:46'),
(4, 'Sofia', 'Neri', 'sofia.neri@email.it', '+393923344555', '2026-02-19 13:32:46'),
(5, 'Alessandro', 'Gialli', 'alessandro.g@email.it', '+393312233444', '2026-02-19 13:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `Viaggio`
--

CREATE TABLE `Viaggio` (
  `ID_Viaggio` int(11) NOT NULL,
  `ID_Autista` int(11) NOT NULL,
  `CittaPartenza` varchar(100) NOT NULL,
  `CittaDestinazione` varchar(100) NOT NULL,
  `DataOraPartenza` datetime NOT NULL,
  `TempoStimatoMinuti` int(11) NOT NULL,
  `Contributo` decimal(5,2) NOT NULL,
  `SostePreviste` text DEFAULT NULL,
  `BagagliAmmessi` tinyint(1) DEFAULT 1,
  `AnimaliAmmessi` tinyint(1) DEFAULT 0,
  `PostiDisponibili` int(11) NOT NULL,
  `PrenotazioniChiuse` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Viaggio`
--

INSERT INTO `Viaggio` (`ID_Viaggio`, `ID_Autista`, `CittaPartenza`, `CittaDestinazione`, `DataOraPartenza`, `TempoStimatoMinuti`, `Contributo`, `SostePreviste`, `BagagliAmmessi`, `AnimaliAmmessi`, `PostiDisponibili`, `PrenotazioniChiuse`) VALUES
(1, 1, 'Roma', 'Milano', '2023-10-01 08:00:00', 360, 35.00, 'Sosta autogrill Firenze', 1, 0, 3, 1),
(2, 3, 'Napoli', 'Roma', '2026-05-20 10:30:00', 130, 15.00, 'Nessuna sosta', 0, 1, 2, 0),
(3, 5, 'Torino', 'Genova', '2026-06-15 14:00:00', 120, 12.50, 'Casello Alessandria', 1, 0, 4, 0),
(4, 1, 'Milano', 'Bologna', '2023-11-15 18:00:00', 140, 18.00, 'Sosta Piacenza', 1, 1, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Autista`
--
ALTER TABLE `Autista`
  ADD PRIMARY KEY (`ID_Autista`),
  ADD UNIQUE KEY `NumeroPatente` (`NumeroPatente`),
  ADD UNIQUE KEY `TargaAuto` (`TargaAuto`);

--
-- Indexes for table `Feedback`
--
ALTER TABLE `Feedback`
  ADD PRIMARY KEY (`ID_Feedback`),
  ADD UNIQUE KEY `ID_Prenotazione` (`ID_Prenotazione`,`Autore`);

--
-- Indexes for table `Passeggero`
--
ALTER TABLE `Passeggero`
  ADD PRIMARY KEY (`ID_Passeggero`),
  ADD UNIQUE KEY `NumeroDocumento` (`NumeroDocumento`);

--
-- Indexes for table `Prenotazione`
--
ALTER TABLE `Prenotazione`
  ADD PRIMARY KEY (`ID_Prenotazione`),
  ADD UNIQUE KEY `ID_Viaggio` (`ID_Viaggio`,`ID_Passeggero`),
  ADD KEY `ID_Passeggero` (`ID_Passeggero`);

--
-- Indexes for table `Utente`
--
ALTER TABLE `Utente`
  ADD PRIMARY KEY (`ID_Utente`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `Viaggio`
--
ALTER TABLE `Viaggio`
  ADD PRIMARY KEY (`ID_Viaggio`),
  ADD KEY `ID_Autista` (`ID_Autista`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Feedback`
--
ALTER TABLE `Feedback`
  MODIFY `ID_Feedback` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Prenotazione`
--
ALTER TABLE `Prenotazione`
  MODIFY `ID_Prenotazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Utente`
--
ALTER TABLE `Utente`
  MODIFY `ID_Utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Viaggio`
--
ALTER TABLE `Viaggio`
  MODIFY `ID_Viaggio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Autista`
--
ALTER TABLE `Autista`
  ADD CONSTRAINT `autista_ibfk_1` FOREIGN KEY (`ID_Autista`) REFERENCES `Utente` (`ID_Utente`) ON DELETE CASCADE;

--
-- Constraints for table `Feedback`
--
ALTER TABLE `Feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`ID_Prenotazione`) REFERENCES `Prenotazione` (`ID_Prenotazione`) ON DELETE CASCADE;

--
-- Constraints for table `Passeggero`
--
ALTER TABLE `Passeggero`
  ADD CONSTRAINT `passeggero_ibfk_1` FOREIGN KEY (`ID_Passeggero`) REFERENCES `Utente` (`ID_Utente`) ON DELETE CASCADE;

--
-- Constraints for table `Prenotazione`
--
ALTER TABLE `Prenotazione`
  ADD CONSTRAINT `prenotazione_ibfk_1` FOREIGN KEY (`ID_Viaggio`) REFERENCES `Viaggio` (`ID_Viaggio`) ON DELETE CASCADE,
  ADD CONSTRAINT `prenotazione_ibfk_2` FOREIGN KEY (`ID_Passeggero`) REFERENCES `Passeggero` (`ID_Passeggero`) ON DELETE CASCADE;

--
-- Constraints for table `Viaggio`
--
ALTER TABLE `Viaggio`
  ADD CONSTRAINT `viaggio_ibfk_1` FOREIGN KEY (`ID_Autista`) REFERENCES `Autista` (`ID_Autista`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
