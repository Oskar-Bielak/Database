-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Wrz 2020, 17:06
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

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_dostawce` (IN `a` INT, IN `b` INT)  NO SQL
UPDATE `dost_zlecenie` SET `id_dostawcy` = a WHERE `dost_zlecenie`.`id_zlecenia` = b$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usun_danie` (IN `a` INT)  NO SQL
DELETE FROM menu_restauracji WHERE id_potrawy = a$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuwanie` (IN `a` INT)  DELETE FROM `zlecenie` WHERE `id_zlecenia` = a$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zakoncz_dostawe` (IN `a` INT)  NO SQL
UPDATE dost_zlecenie SET realizacja = 'Zakonczone' WHERE id_zlecenia = a$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zakoncz_restauracja` (IN `a` INT)  NO SQL
UPDATE dost_zlecenie SET realizacja_res = 'Zakonczone' WHERE id_zlecenia = a$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zaplacone` (IN `a` INT)  NO SQL
DELETE FROM `zlecenie` WHERE `id_klient` = a$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zaplacone_1` (IN `a` INT)  NO SQL
INSERT INTO dost_zlecenie(id_klient,id_dostawcy,id_restauracji,koszyk)
SELECT zlecenie.id_klient,zlecenie.id_dostawcy,zlecenie.id_restauracji,zlecenie.koszyk FROM zlecenie WHERE zlecenie.id_klient = a$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zmiana_imienia` (IN `a` INT, IN `b` VARCHAR(45))  NO SQL
UPDATE `klienci` SET `imie` = b WHERE `klienci`.`id_klient` = a$$

DELIMITER ;

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

--
-- Zrzut danych tabeli `admin`
--

INSERT INTO `admin` (`id_admin`, `imie`, `nazwisko`, `email`, `haslo`, `telefon`) VALUES
(1, 'Oskar', 'Bielak', 'oskar8910@o2.pl', '$2y$10$LlngIfA8hlsBpbK6c2Rs3.3F.0abZ0tF/Vs8duc5Q2VxOcP4026Iy', '533933944');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawca`
--

CREATE TABLE `dostawca` (
  `id_dostawcy` int(11) NOT NULL,
  `imie` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `telefon_dost` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `seria_dowod` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `lokalizacja` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `keyword` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `dostawca`
--

INSERT INTO `dostawca` (`id_dostawcy`, `imie`, `nazwisko`, `telefon_dost`, `seria_dowod`, `opis`, `lokalizacja`, `haslo`, `email`, `keyword`) VALUES
(1, 'Łukasz', 'Moszka', '594269413', 'Car 98731', 'Lubie to co robie.', 'Nowy Sącz', '$2y$10$LlngIfA8hlsBpbK6c2Rs3.3F.0abZ0tF/Vs8duc5Q2VxOcP4026Iy', 'lukasz@o2.pl', 'fsadfdsafasf');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dost_zlecenie`
--

CREATE TABLE `dost_zlecenie` (
  `id_zlecenia` int(11) NOT NULL,
  `id_klient` int(11) NOT NULL,
  `id_dostawcy` int(11) DEFAULT NULL,
  `id_restauracji` int(11) NOT NULL,
  `koszyk` int(11) NOT NULL,
  `realizacja` varchar(45) COLLATE utf8_polish_ci NOT NULL DEFAULT 'W trakcie',
  `realizacja_res` varchar(45) COLLATE utf8_polish_ci NOT NULL DEFAULT 'W trakcie'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `dost_zlecenie`
--

INSERT INTO `dost_zlecenie` (`id_zlecenia`, `id_klient`, `id_dostawcy`, `id_restauracji`, `koszyk`, `realizacja`, `realizacja_res`) VALUES
(36, 1, 1, 1, 1, 'W trakcie', 'Zakonczone'),
(37, 1, 1, 3, 4, 'W trakcie', 'W trakcie'),
(39, 1, 1, 1, 1, 'Zakonczone', 'W trakcie'),
(40, 1, 1, 1, 1, 'Zakonczone', 'W trakcie');

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
  `telefon` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL,
  `keyword` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id_klient`, `imie`, `nazwisko`, `email`, `adres`, `miasto`, `telefon`, `haslo`, `keyword`) VALUES
(1, 'Mariusz', 'Kozakiewicz', 'konieczny@o2.pl', 'Aleje Wolnosci 12', 'Nowy Sącz', '586215635', '$2y$10$VSAZe.YsruRUWskI8oa7qOkJls/DOvvVpsv5zAOV4iG./Z00Lnlpy', 'qwert'),
(2, 'Stanislaw', 'Bąk', 'MAKI@O2.PL', 'Lwowska 123', 'Nowy Sącz', '688423692', '$2y$10$vZ/fUYpv2qXyoaUbYbcmr.izhG6wcXKHNqP1ihBTJDUthU7.ojxM6', 'qwert12345'),
(3, 'Kazimierz', 'Dejna', 'dejna1293@o2.pl', 'Władysława Broniewskiego', 'Stary Sącz', '539874265', '$2y$10$q1rwNX2XG3pCFAUkErqPaOCQWTdBpsiJlpRqWw0witRKYW1pOTATy', 'dark12345678');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menu_restauracji`
--

CREATE TABLE `menu_restauracji` (
  `id_potrawy` int(11) NOT NULL,
  `nazwa_potrawy` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `opis_potrawy` text COLLATE utf8_polish_ci NOT NULL,
  `cena` int(11) NOT NULL,
  `dlugosc_wyk` int(11) NOT NULL,
  `id_restauracji` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `menu_restauracji`
--

INSERT INTO `menu_restauracji` (`id_potrawy`, `nazwa_potrawy`, `opis_potrawy`, `cena`, `dlugosc_wyk`, `id_restauracji`) VALUES
(1, 'Kurczak po chinsku', 'Kuraczka w warzywach z poleowa z bulionu', 25, 45, 1),
(2, 'Bulion', 'Bulion na bazie kurzczaka', 15, 25, 1),
(3, 'Pizza Flamncka', 'Ser, Szynka, Oreganom, Pieczarki', 25, 45, 3),
(4, 'Pizza Mocarz', 'Ser, Szynka, Oregano, Kurczak, Peproni, Boczek', 35, 45, 3),
(5, 'Podstawowy zestaw', 'Uramaki krewetka w tempurze\r\nUramaki wędzony łosoś\r\nFutomaki ryba dnia\r\nFutomaki tuńczyk na ostro\r\nHosomaki z marynowanym ogórkiem na ostro\r\n2x Nigiri z łososiem\r\n2x Nigiri z tamago\r\n\r\n', 45, 60, 2),
(6, 'Kurczak w Warzywach', 'Pyszny kurczak w panierce z domieszka warzyw', 30, 45, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `restauracja`
--

CREATE TABLE `restauracja` (
  `id_restauracji` int(11) NOT NULL,
  `nazwa_restauracji` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `lokalizacja_res` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `adres_res` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `nip` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `opis_restauracji` text COLLATE utf8_polish_ci NOT NULL,
  `telefon_res` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL,
  `keyword` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `restauracja`
--

INSERT INTO `restauracja` (`id_restauracji`, `nazwa_restauracji`, `email`, `lokalizacja_res`, `adres_res`, `nip`, `opis_restauracji`, `telefon_res`, `haslo`, `keyword`) VALUES
(1, 'Mekong', 'mariusz831@o2.pl', 'Nowy Sącz', 'Lwowska 123', '512364264', 'Smaczne chinskie dana na kazda kieszen', '596314599', '$2y$10$LlngIfA8hlsBpbK6c2Rs3.3F.0abZ0tF/Vs8duc5Q2VxOcP4026Iy', 'fsadfqwerfqwfsad'),
(2, 'Sushi', 'szukam@o2.pl', 'Nowy Sącz', 'Broniewskiego 412', '895642364', 'Sushi oraz inne potrawy japonskie.', '652369412', '$2y$10$LlngIfA8hlsBpbK6c2Rs3.3F.0abZ0tF/Vs8duc5Q2VxOcP4026Iy', 'fdsafeqer123515'),
(3, 'ChillChill', 'chill@gmail.com', 'Nowy Sacz', 'Lwowska 392', '589615648', 'Tania pizzeria', '548912648', '$2y$10$LlngIfA8hlsBpbK6c2Rs3.3F.0abZ0tF/Vs8duc5Q2VxOcP4026Iy', 'fr4gtqh1h26h24y');

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
  `id_dostawcy` int(11) DEFAULT NULL,
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
-- Indeksy dla tabeli `dost_zlecenie`
--
ALTER TABLE `dost_zlecenie`
  ADD PRIMARY KEY (`id_zlecenia`),
  ADD KEY `id_klient` (`id_klient`,`id_dostawcy`,`id_restauracji`,`koszyk`),
  ADD KEY `id_dostawcy` (`id_dostawcy`),
  ADD KEY `id_restauracji` (`id_restauracji`),
  ADD KEY `koszyk` (`koszyk`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klient`);

--
-- Indeksy dla tabeli `menu_restauracji`
--
ALTER TABLE `menu_restauracji`
  ADD PRIMARY KEY (`id_potrawy`),
  ADD KEY `id_restauracji` (`id_restauracji`);

--
-- Indeksy dla tabeli `restauracja`
--
ALTER TABLE `restauracja`
  ADD PRIMARY KEY (`id_restauracji`);

--
-- Indeksy dla tabeli `wiadomosci`
--
ALTER TABLE `wiadomosci`
  ADD PRIMARY KEY (`id_wiadomosci`);

--
-- Indeksy dla tabeli `zlecenie`
--
ALTER TABLE `zlecenie`
  ADD PRIMARY KEY (`id_zlecenia`),
  ADD KEY `id_klient` (`id_klient`,`id_dostawcy`,`id_restauracji`,`koszyk`),
  ADD KEY `id_restauracji` (`id_restauracji`),
  ADD KEY `id_dostawcy` (`id_dostawcy`),
  ADD KEY `koszyk` (`koszyk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `dostawca`
--
ALTER TABLE `dostawca`
  MODIFY `id_dostawcy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `dost_zlecenie`
--
ALTER TABLE `dost_zlecenie`
  MODIFY `id_zlecenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id_klient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `menu_restauracji`
--
ALTER TABLE `menu_restauracji`
  MODIFY `id_potrawy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `restauracja`
--
ALTER TABLE `restauracja`
  MODIFY `id_restauracji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `wiadomosci`
--
ALTER TABLE `wiadomosci`
  MODIFY `id_wiadomosci` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zlecenie`
--
ALTER TABLE `zlecenie`
  MODIFY `id_zlecenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `dost_zlecenie`
--
ALTER TABLE `dost_zlecenie`
  ADD CONSTRAINT `dost_zlecenie_ibfk_1` FOREIGN KEY (`id_klient`) REFERENCES `klienci` (`id_klient`),
  ADD CONSTRAINT `dost_zlecenie_ibfk_2` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawca` (`id_dostawcy`),
  ADD CONSTRAINT `dost_zlecenie_ibfk_3` FOREIGN KEY (`id_restauracji`) REFERENCES `restauracja` (`id_restauracji`),
  ADD CONSTRAINT `dost_zlecenie_ibfk_4` FOREIGN KEY (`koszyk`) REFERENCES `menu_restauracji` (`id_potrawy`);

--
-- Ograniczenia dla tabeli `menu_restauracji`
--
ALTER TABLE `menu_restauracji`
  ADD CONSTRAINT `menu_restauracji_ibfk_1` FOREIGN KEY (`id_restauracji`) REFERENCES `restauracja` (`id_restauracji`);

--
-- Ograniczenia dla tabeli `zlecenie`
--
ALTER TABLE `zlecenie`
  ADD CONSTRAINT `zlecenie_ibfk_1` FOREIGN KEY (`id_klient`) REFERENCES `klienci` (`id_klient`),
  ADD CONSTRAINT `zlecenie_ibfk_2` FOREIGN KEY (`id_restauracji`) REFERENCES `restauracja` (`id_restauracji`),
  ADD CONSTRAINT `zlecenie_ibfk_3` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawca` (`id_dostawcy`),
  ADD CONSTRAINT `zlecenie_ibfk_4` FOREIGN KEY (`koszyk`) REFERENCES `menu_restauracji` (`id_potrawy`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
