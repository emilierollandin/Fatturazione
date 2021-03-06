-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generato il: Nov 21, 2016 alle 19:49
-- Versione del server: 10.0.27-MariaDB
-- Versione PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `archisti_fatturazione`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `cli_id` int(11) NOT NULL AUTO_INCREMENT,
  `cli_denominazione` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cli_indirizzo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cli_cap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cli_comune` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cli_telefono` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_fax` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_piva` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cli_vecchio` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cli_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`cli_id`, `cli_denominazione`, `cli_indirizzo`, `cli_cap`, `cli_comune`, `cli_telefono`, `cli_fax`, `cli_email`, `cli_piva`, `cli_vecchio`) VALUES
(1, 'Rollandin Emilie', 'via Guillet 6', '11027', 'Saint Vincent', '3457054951', '', 'emilie.rollandin@gmail.com', '01160680078', 0),
(2, 'Laurent Marisa', 'via Guillet 6', '11027', 'Saint Vincent', '0166511415', '', 'laurent.marisa@gmail.com', 'LRNMRS55S63A326H', 0),
(3, 'Groppo Elettra', 'via Guillet 6', '11027', 'Saint Vincent', '3889207016', '', 'elmisworld@gmail.com', 'GRPLTR82T47XXXX', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ddt`
--

CREATE TABLE IF NOT EXISTS `ddt` (
  `ddt_id` int(11) NOT NULL AUTO_INCREMENT,
  `ddt_numero` int(11) NOT NULL,
  `ddt_anno` int(11) NOT NULL,
  `ddt_data` date NOT NULL,
  `ddt_fkcliente` int(11) NOT NULL,
  `ddt_destinazione` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ddt_causale` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ddt_trasporto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ddt_aspetto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ddt_colli` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ddt_ritiro` date DEFAULT NULL,
  `ddt_scontrino` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ddt_importo` decimal(10,2) NOT NULL,
  `ddt_fkfattura` int(11) DEFAULT NULL,
  `ddt_annullato` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ddt_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `ddt`
--

INSERT INTO `ddt` (`ddt_id`, `ddt_numero`, `ddt_anno`, `ddt_data`, `ddt_fkcliente`, `ddt_destinazione`, `ddt_causale`, `ddt_trasporto`, `ddt_aspetto`, `ddt_colli`, `ddt_ritiro`, `ddt_scontrino`, `ddt_importo`, `ddt_fkfattura`, `ddt_annullato`) VALUES
(1, 1, 2016, '2016-06-01', 2, '', 'Vendita', 'Destinatario', 'Sfuso', '1', '2016-06-12', '120', '50.00', 0, 0),
(2, 2, 2016, '2016-06-13', 1, '', 'Vendita', 'Destinatario', 'Sfuso', '1', '2016-06-13', '20', '50.00', 0, 0),
(3, 3, 2016, '2016-06-12', 1, '', 'Vendita', 'Mittente', 'Sfuso', '1', '2016-06-12', '12', '20.00', 0, 0),
(4, 4, 2016, '2016-06-12', 1, '', 'Vendita', 'Destinatario', 'Sfuso', '1', '2016-06-12', '100', '15.00', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ddtdettaglio`
--

CREATE TABLE IF NOT EXISTS `ddtdettaglio` (
  `ddd_id` int(11) NOT NULL AUTO_INCREMENT,
  `ddd_fkddt` int(11) NOT NULL,
  `ddd_quantita` decimal(10,3) NOT NULL,
  `ddd_fkprodotto` int(11) NOT NULL,
  `ddd_tracciabilita` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ddd_annullato` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ddd_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dump dei dati per la tabella `ddtdettaglio`
--

INSERT INTO `ddtdettaglio` (`ddd_id`, `ddd_fkddt`, `ddd_quantita`, `ddd_fkprodotto`, `ddd_tracciabilita`, `ddd_annullato`) VALUES
(1, 2, '3.000', 2, '215', 0),
(2, 2, '1.200', 4, '215', 0),
(4, 2, '0.200', 8, '300', 0),
(5, 3, '1.000', 6, '100', 0),
(6, 1, '0.500', 6, '100', 0),
(7, 4, '2.000', 12, '250', 0),
(8, 4, '2.000', 6, '300', 0),
(9, 4, '1.500', 5, '300', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `fattura`
--

CREATE TABLE IF NOT EXISTS `fattura` (
  `fat_id` int(11) NOT NULL AUTO_INCREMENT,
  `fat_numero` int(11) NOT NULL,
  `fat_anno` int(11) NOT NULL,
  `fat_data` date NOT NULL,
  `fat_pagata` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto`
--

CREATE TABLE IF NOT EXISTS `prodotto` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_categoria` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pro_descrizione` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pro_prezzo` decimal(10,2) NOT NULL,
  `pro_iva` decimal(5,2) NOT NULL,
  `pro_vecchio` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dump dei dati per la tabella `prodotto`
--

INSERT INTO `prodotto` (`pro_id`, `pro_categoria`, `pro_descrizione`, `pro_prezzo`, `pro_iva`, `pro_vecchio`) VALUES
(1, 'Carne bovino', 'Sottofiletto', '15.00', '10.00', 0),
(2, 'Carne bovino', 'Fegato', '10.50', '10.00', 0),
(3, 'Carne bovino', 'Trita magra', '13.00', '10.00', 0),
(4, 'Carne bovino', 'Rolata', '9.30', '10.00', 0),
(5, 'Carne cinghiale', 'Coscia', '18.00', '10.00', 0),
(6, 'Insaccati', 'Lardo Arnad Bertolin', '13.00', '10.00', 0),
(7, 'Insaccati', 'Prosciutto cotto Bossolein', '22.00', '10.00', 0),
(8, 'Carne bovina', 'Presalé', '11.00', '10.00', 0),
(9, 'Formaggi', 'Fontina', '16.00', '4.00', 0),
(10, 'Formaggi', 'Toma Gressoney', '13.00', '4.00', 0),
(11, 'Formaggi', 'Toma', '11.00', '4.00', 0),
(12, 'Carne coniglio', 'Rolata', '17.00', '10.00', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
