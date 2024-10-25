-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 23. Jul 2023 um 12:28
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_lap_speisekarte`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_allergene`
--

CREATE TABLE `tbl_allergene` (
  `IDAllergen` int(10) UNSIGNED NOT NULL,
  `Kurzzeichen` varchar(1) NOT NULL,
  `Beschreibung` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_allergene`
--

INSERT INTO `tbl_allergene` (`IDAllergen`, `Kurzzeichen`, `Beschreibung`) VALUES
(1, 'A', 'Glutenhaltiges Getränk'),
(2, 'B', 'Krebstiere'),
(3, 'C', 'Eier'),
(4, 'D', 'Fisch'),
(5, 'E', 'Erdnuss'),
(6, 'F', 'Soja'),
(7, 'G', 'Milch'),
(8, 'H', 'Schalenfrüchte'),
(9, 'L', 'Sellerie'),
(10, 'M', 'Senf'),
(11, 'N', 'Sesam'),
(12, 'O', 'Sulfite'),
(13, 'P', 'Lupinen'),
(14, 'R', 'Weichtiere');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_einheiten`
--

CREATE TABLE `tbl_einheiten` (
  `IDEinheit` int(10) UNSIGNED NOT NULL,
  `Einheit` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_einheiten`
--

INSERT INTO `tbl_einheiten` (`IDEinheit`, `Einheit`) VALUES
(1, 'l'),
(2, 'Stk.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_kategorien`
--

CREATE TABLE `tbl_kategorien` (
  `IDKategorie` int(10) UNSIGNED NOT NULL,
  `FIDKategorie` int(10) UNSIGNED DEFAULT NULL,
  `Bezeichnung` varchar(32) NOT NULL,
  `Reihenfolge` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_kategorien`
--

INSERT INTO `tbl_kategorien` (`IDKategorie`, `FIDKategorie`, `Bezeichnung`, `Reihenfolge`) VALUES
(1, NULL, 'Menü der Woche', 0),
(2, NULL, 'Vorspeisen', 1),
(3, NULL, 'Salate', 2),
(4, NULL, 'Hauptspeisen', 3),
(5, NULL, 'Nachspeisen', 4),
(6, NULL, 'Getränke', 5),
(13, 4, 'Fleischgerichte', 0),
(14, 4, 'Fischgerichte', 1),
(15, 5, 'Spezialitäten', 0),
(16, 6, 'Warme Getränke', 0),
(17, 6, 'Alkoholfreie Getränke', 1),
(18, 6, 'Weine', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_produkte`
--

CREATE TABLE `tbl_produkte` (
  `IDProdukt` int(10) UNSIGNED NOT NULL,
  `Anzahl` float(4,3) UNSIGNED DEFAULT NULL,
  `FIDEinheit` int(10) UNSIGNED DEFAULT NULL,
  `Produkt` varchar(64) NOT NULL,
  `Zusatztext` text DEFAULT NULL,
  `Anmerkungen` text DEFAULT NULL,
  `Preis` decimal(5,2) UNSIGNED DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_produkte`
--

INSERT INTO `tbl_produkte` (`IDProdukt`, `Anzahl`, `FIDEinheit`, `Produkt`, `Zusatztext`, `Anmerkungen`, `Preis`) VALUES
(1, NULL, NULL, 'Kürbiscremesuppe', NULL, NULL, 0.00),
(2, NULL, NULL, 'Gans mit Maronifülle', NULL, NULL, 0.00),
(3, NULL, NULL, 'Tiramisu', NULL, NULL, 0.00),
(4, NULL, NULL, 'Rindsuppe mit Frittaten', NULL, NULL, 0.00),
(5, NULL, NULL, 'Gulaschsuppe mit Gebäck', NULL, NULL, 0.00),
(6, NULL, NULL, 'Gemischter Salat mit Essig- und Olivenöl-Marinade', NULL, NULL, 0.00),
(7, NULL, NULL, 'Gemischter Salat mit französischem Senfdressing', NULL, NULL, 0.00),
(8, NULL, NULL, 'Gemischter Salat mit Joghurt-Schnittlauch-Dressing', NULL, NULL, 0.00),
(9, NULL, NULL, 'Wienerschnitzel vom Schwein', 'mit Petersilienkartoffeln und grünem Salat', NULL, 0.00),
(10, NULL, NULL, 'Cordon bleu mit Pommes frites', NULL, NULL, 0.00),
(11, NULL, NULL, 'Schweinsbraten im Natursaft', 'mit Sauerkraut und Semmelknödel', NULL, 0.00),
(12, NULL, NULL, 'Gefüllte Kalbsbrust', 'mit Petersilienkartoffeln', NULL, 0.00),
(13, NULL, NULL, 'Miesmuscheln', 'in Lauch-Weißwein-Sauce mit Knoblauchbrot', NULL, 0.00),
(14, NULL, NULL, 'Pochiertes Steinbuttfilet mit Wurzelstreifen', NULL, NULL, 0.00),
(15, NULL, NULL, 'Palatschinken', 'mit Marillenmarmelade', NULL, 0.00),
(16, NULL, NULL, 'Apfelstrudel mit Schlagobers', NULL, NULL, 0.00),
(17, NULL, NULL, 'Salzburger Nockerln', NULL, NULL, 0.00),
(18, 2.000, 2, 'Marillenknödel', NULL, NULL, 0.00),
(19, 0.500, 1, 'Hausbier vom Fass', NULL, NULL, 0.00),
(20, 0.500, 1, 'Weizenbier, hell', NULL, NULL, 0.00),
(21, 0.500, 1, 'alkoholfreies Bier', NULL, NULL, 0.00),
(22, NULL, NULL, 'Großer Brauner', NULL, NULL, 0.00),
(23, NULL, NULL, 'Caffé Latte', NULL, NULL, 0.00),
(24, NULL, NULL, 'Coca Cola', NULL, NULL, 0.00),
(25, NULL, NULL, 'Coca Cola light', NULL, 'eine Phenylalaninquelle', 0.00),
(26, 0.125, 1, 'Weißwein', NULL, NULL, 0.00),
(27, 0.125, 1, 'Rotwein', NULL, NULL, 0.00);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_produkte_kategorien`
--

CREATE TABLE `tbl_produkte_kategorien` (
  `IDProduktKategorie` int(10) UNSIGNED NOT NULL,
  `FIDProdukt` int(10) UNSIGNED NOT NULL,
  `FIDKategorie` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_produkte_kategorien`
--

INSERT INTO `tbl_produkte_kategorien` (`IDProduktKategorie`, `FIDProdukt`, `FIDKategorie`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 2),
(6, 1, 2),
(7, 6, 3),
(8, 7, 3),
(9, 8, 3),
(10, 9, 13),
(11, 10, 13),
(12, 11, 13),
(13, 12, 13),
(14, 13, 14),
(15, 14, 14),
(16, 15, 5),
(17, 16, 5),
(18, 17, 5),
(19, 3, 5),
(20, 18, 15),
(21, 19, 6),
(22, 20, 6),
(23, 21, 6),
(24, 22, 16),
(25, 23, 16),
(26, 24, 17),
(27, 25, 17),
(28, 26, 18),
(29, 27, 18);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_produkt_allergene`
--

CREATE TABLE `tbl_produkt_allergene` (
  `IDProduktAllergene` int(10) UNSIGNED NOT NULL,
  `FIDProdukt` int(10) UNSIGNED NOT NULL,
  `FIDAllergen` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_produkt_allergene`
--

INSERT INTO `tbl_produkt_allergene` (`IDProduktAllergene`, `FIDProdukt`, `FIDAllergen`) VALUES
(1, 1, 1),
(2, 1, 7),
(3, 1, 9),
(4, 2, 1),
(5, 2, 3),
(6, 2, 7),
(7, 2, 9),
(8, 3, 1),
(9, 3, 3),
(10, 3, 7),
(11, 4, 1),
(12, 4, 3),
(13, 4, 7),
(14, 4, 9),
(15, 4, 10),
(16, 5, 1),
(17, 5, 9),
(18, 5, 12),
(19, 6, 12),
(20, 7, 10),
(21, 7, 12),
(22, 8, 7),
(23, 8, 10),
(24, 8, 12),
(25, 9, 1),
(26, 9, 3),
(27, 9, 10),
(28, 9, 12),
(29, 10, 1),
(30, 10, 3),
(31, 10, 7),
(32, 11, 1),
(33, 11, 3),
(34, 11, 7),
(35, 11, 9),
(36, 11, 10),
(37, 11, 12),
(38, 12, 1),
(39, 12, 3),
(40, 12, 7),
(41, 13, 1),
(42, 13, 7),
(43, 13, 12),
(44, 13, 14),
(45, 14, 4),
(46, 14, 7),
(47, 14, 9),
(48, 14, 12),
(49, 15, 1),
(50, 15, 3),
(51, 15, 7),
(52, 16, 1),
(53, 16, 3),
(54, 16, 7),
(55, 16, 12),
(56, 17, 1),
(57, 17, 3),
(58, 17, 7),
(59, 18, 1),
(60, 18, 3),
(61, 18, 7),
(62, 19, 1),
(63, 20, 1),
(64, 21, 1),
(65, 22, 7),
(66, 23, 7),
(67, 26, 12),
(68, 27, 12);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_wochenmenue`
--

CREATE TABLE `tbl_wochenmenue` (
  `IDWochenmenue` int(10) UNSIGNED NOT NULL,
  `FIDKategorie` int(10) UNSIGNED NOT NULL,
  `gueltigVon` date NOT NULL,
  `gueltigBis` date NOT NULL,
  `Preis` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_allergene`
--
ALTER TABLE `tbl_allergene`
  ADD PRIMARY KEY (`IDAllergen`),
  ADD UNIQUE KEY `Kurzzeichen` (`Kurzzeichen`),
  ADD UNIQUE KEY `Beschreibung` (`Beschreibung`);

--
-- Indizes für die Tabelle `tbl_einheiten`
--
ALTER TABLE `tbl_einheiten`
  ADD PRIMARY KEY (`IDEinheit`),
  ADD UNIQUE KEY `Einheit` (`Einheit`);

--
-- Indizes für die Tabelle `tbl_kategorien`
--
ALTER TABLE `tbl_kategorien`
  ADD PRIMARY KEY (`IDKategorie`),
  ADD KEY `FIDKategorie` (`FIDKategorie`);

--
-- Indizes für die Tabelle `tbl_produkte`
--
ALTER TABLE `tbl_produkte`
  ADD PRIMARY KEY (`IDProdukt`),
  ADD KEY `FIDEinheit` (`FIDEinheit`);

--
-- Indizes für die Tabelle `tbl_produkte_kategorien`
--
ALTER TABLE `tbl_produkte_kategorien`
  ADD PRIMARY KEY (`IDProduktKategorie`),
  ADD KEY `FIDProdukt` (`FIDProdukt`),
  ADD KEY `FIDKategorie` (`FIDKategorie`);

--
-- Indizes für die Tabelle `tbl_produkt_allergene`
--
ALTER TABLE `tbl_produkt_allergene`
  ADD PRIMARY KEY (`IDProduktAllergene`),
  ADD UNIQUE KEY `FIDProdukt_2` (`FIDProdukt`,`FIDAllergen`);

--
-- Indizes für die Tabelle `tbl_wochenmenue`
--
ALTER TABLE `tbl_wochenmenue`
  ADD PRIMARY KEY (`IDWochenmenue`),
  ADD KEY `FIDKategorie` (`FIDKategorie`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_allergene`
--
ALTER TABLE `tbl_allergene`
  MODIFY `IDAllergen` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `tbl_einheiten`
--
ALTER TABLE `tbl_einheiten`
  MODIFY `IDEinheit` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `tbl_kategorien`
--
ALTER TABLE `tbl_kategorien`
  MODIFY `IDKategorie` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `tbl_produkte`
--
ALTER TABLE `tbl_produkte`
  MODIFY `IDProdukt` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT für Tabelle `tbl_produkte_kategorien`
--
ALTER TABLE `tbl_produkte_kategorien`
  MODIFY `IDProduktKategorie` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT für Tabelle `tbl_produkt_allergene`
--
ALTER TABLE `tbl_produkt_allergene`
  MODIFY `IDProduktAllergene` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT für Tabelle `tbl_wochenmenue`
--
ALTER TABLE `tbl_wochenmenue`
  MODIFY `IDWochenmenue` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_kategorien`
--
ALTER TABLE `tbl_kategorien`
  ADD CONSTRAINT `tbl_kategorien_ibfk_1` FOREIGN KEY (`FIDKategorie`) REFERENCES `tbl_kategorien` (`IDKategorie`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_produkte`
--
ALTER TABLE `tbl_produkte`
  ADD CONSTRAINT `tbl_produkte_ibfk_1` FOREIGN KEY (`FIDEinheit`) REFERENCES `tbl_einheiten` (`IDEinheit`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_produkte_kategorien`
--
ALTER TABLE `tbl_produkte_kategorien`
  ADD CONSTRAINT `tbl_produkte_kategorien_ibfk_1` FOREIGN KEY (`FIDProdukt`) REFERENCES `tbl_produkte` (`IDProdukt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_produkte_kategorien_ibfk_2` FOREIGN KEY (`FIDKategorie`) REFERENCES `tbl_kategorien` (`IDKategorie`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_produkt_allergene`
--
ALTER TABLE `tbl_produkt_allergene`
  ADD CONSTRAINT `tbl_produkt_allergene_ibfk_1` FOREIGN KEY (`FIDProdukt`) REFERENCES `tbl_produkte` (`IDProdukt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_produkt_allergene_ibfk_2` FOREIGN KEY (`FIDAllergen`) REFERENCES `tbl_allergene` (`IDAllergen`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_wochenmenue`
--
ALTER TABLE `tbl_wochenmenue`
  ADD CONSTRAINT `tbl_wochenmenue_ibfk_1` FOREIGN KEY (`FIDKategorie`) REFERENCES `tbl_kategorien` (`IDKategorie`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
