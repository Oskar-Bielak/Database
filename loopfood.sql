-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Sie 2020, 12:19
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `loopfood`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `imie` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(9) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawca`
--

CREATE TABLE `dostawca` (
  `id_dostawcy` int(11) NOT NULL,
  `imie` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `seria_dowod` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `lokalizacja` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `his_dost`
--

CREATE TABLE `his_dost` (
  `id_his_dos` int(11) NOT NULL,
  `id_zlecenia` int(11) NOT NULL,
  `id_dostawcy` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `ocena` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `his_klient`
--

CREATE TABLE `his_klient` (
  `id_his_kli` int(11) NOT NULL,
  `id_zlecenia` int(11) NOT NULL,
  `id_klient` int(11) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `his_restauracji`
--

CREATE TABLE `his_restauracji` (
  `id_his_rest` int(11) NOT NULL,
  `id_zlecenia` int(11) NOT NULL,
  `id_restauracji` int(11) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id_klient` int(11) NOT NULL,
  `imie` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `adres` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `miasto` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(9) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menu_restauracji`
--

CREATE TABLE `menu_restauracji` (
  `id_potrawy` int(11) NOT NULL,
  `nazwa_potrawy` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `opis_potrawy` text COLLATE utf8_polish_ci NOT NULL,
  `cena` int(11) NOT NULL,
  `dlugosc_wyk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `restauracja`
--

CREATE TABLE `restauracja` (
  `id_restauracji` int(11) NOT NULL,
  `nazwa_restauracji` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `nip` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `menu` int(11) NOT NULL,
  `opis_restauracji` text COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wiadomosci`
--

CREATE TABLE `wiadomosci` (
  `id_wiadomosci` int(11) NOT NULL,
  `tytul` text COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `tekst` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zlecenie`
--

CREATE TABLE `zlecenie` (
  `id_zlecenia` int(11) NOT NULL,
  `id_klient` int(11) NOT NULL,
  `id_dostawcy` int(11) NOT NULL,
  `id_restauracji` int(11) NOT NULL,
  `koszyk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeksy dla tabeli `dostawca`
--
ALTER TABLE `dostawca`
  ADD PRIMARY KEY (`id_dostawcy`);

--
-- Indeksy dla tabeli `his_dost`
--
ALTER TABLE `his_dost`
  ADD PRIMARY KEY (`id_his_dos`),
  ADD KEY `id_dostawcy` (`id_dostawcy`),
  ADD KEY `id_zlecenia` (`id_zlecenia`);

--
-- Indeksy dla tabeli `his_klient`
--
ALTER TABLE `his_klient`
  ADD PRIMARY KEY (`id_his_kli`),
  ADD KEY `id_klient` (`id_klient`),
  ADD KEY `id_zlecenia` (`id_zlecenia`);

--
-- Indeksy dla tabeli `his_restauracji`
--
ALTER TABLE `his_restauracji`
  ADD PRIMARY KEY (`id_his_rest`),
  ADD KEY `id_restauracji` (`id_restauracji`),
  ADD KEY `id_zlecenia` (`id_zlecenia`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klient`);

--
-- Indeksy dla tabeli `menu_restauracji`
--
ALTER TABLE `menu_restauracji`
  ADD PRIMARY KEY (`id_potrawy`);

--
-- Indeksy dla tabeli `restauracja`
--
ALTER TABLE `restauracja`
  ADD PRIMARY KEY (`id_restauracji`),
  ADD KEY `menu` (`menu`);

--
-- Indeksy dla tabeli `wiadomosci`
--
ALTER TABLE `wiadomosci`
  ADD PRIMARY KEY (`id_wiadomosci`);

--
-- Indeksy dla tabeli `zlecenie`
--
ALTER TABLE `zlecenie`
  ADD PRIMARY KEY (`id_zlecenia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `dostawca`
--
ALTER TABLE `dostawca`
  MODIFY `id_dostawcy` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `his_dost`
--
ALTER TABLE `his_dost`
  MODIFY `id_his_dos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `his_klient`
--
ALTER TABLE `his_klient`
  MODIFY `id_his_kli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `his_restauracji`
--
ALTER TABLE `his_restauracji`
  MODIFY `id_his_rest` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id_klient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `menu_restauracji`
--
ALTER TABLE `menu_restauracji`
  MODIFY `id_potrawy` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `restauracja`
--
ALTER TABLE `restauracja`
  MODIFY `id_restauracji` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wiadomosci`
--
ALTER TABLE `wiadomosci`
  MODIFY `id_wiadomosci` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zlecenie`
--
ALTER TABLE `zlecenie`
  MODIFY `id_zlecenia` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `his_dost`
--
ALTER TABLE `his_dost`
  ADD CONSTRAINT `his_dost_ibfk_1` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawca` (`id_dostawcy`),
  ADD CONSTRAINT `his_dost_ibfk_2` FOREIGN KEY (`id_zlecenia`) REFERENCES `zlecenie` (`id_zlecenia`);

--
-- Ograniczenia dla tabeli `his_klient`
--
ALTER TABLE `his_klient`
  ADD CONSTRAINT `his_klient_ibfk_1` FOREIGN KEY (`id_klient`) REFERENCES `klienci` (`Id_klient`),
  ADD CONSTRAINT `his_klient_ibfk_2` FOREIGN KEY (`id_zlecenia`) REFERENCES `zlecenie` (`id_zlecenia`);

--
-- Ograniczenia dla tabeli `his_restauracji`
--
ALTER TABLE `his_restauracji`
  ADD CONSTRAINT `his_restauracji_ibfk_1` FOREIGN KEY (`id_restauracji`) REFERENCES `restauracja` (`id_restauracji`),
  ADD CONSTRAINT `his_restauracji_ibfk_2` FOREIGN KEY (`id_zlecenia`) REFERENCES `zlecenie` (`id_zlecenia`);

--
-- Ograniczenia dla tabeli `restauracja`
--
ALTER TABLE `restauracja`
  ADD CONSTRAINT `restauracja_ibfk_1` FOREIGN KEY (`menu`) REFERENCES `menu_restauracji` (`id_potrawy`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
