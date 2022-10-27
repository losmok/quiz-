-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Paź 2022, 11:06
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mydb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `is_right` varchar(45) DEFAULT NULL,
  `questions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `answers`
--

INSERT INTO `answers` (`id`, `content`, `is_right`, `questions_id`) VALUES
(1, '18', '1', 1),
(2, '17', '0', 1),
(3, '16', '0', 1),
(4, '4', '1', 2),
(5, '3', '0', 2),
(6, '1', '0', 2),
(7, 'pies', '1', 3),
(8, 'kot', '0', 3),
(9, 'kaczka', '0', 3),
(10, 'Tak', '1', 4),
(11, 'Nie', '0', 4),
(12, '1920x1080', '1', 5),
(13, '1980x1040', '0', 5),
(14, '2048×1152', '0', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `questions`
--

INSERT INTO `questions` (`id`, `content`) VALUES
(1, 'Ile mam lat?'),
(2, '2+2 to:'),
(3, 'Zwierzę które szczeka'),
(4, 'Czy paweł jest ciepły '),
(5, 'Która rozdzielczość to fullhd');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students_checks`
--

CREATE TABLE `students_checks` (
  `id` int(11) NOT NULL,
  `answers_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students_has_tests`
--

CREATE TABLE `students_has_tests` (
  `id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests_has_questions`
--

CREATE TABLE `tests_has_questions` (
  `id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`,`questions_id`),
  ADD KEY `fk_answers_questions` (`questions_id`);

--
-- Indeksy dla tabeli `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `students_checks`
--
ALTER TABLE `students_checks`
  ADD PRIMARY KEY (`id`,`answers_id`,`questions_id`,`tests_id`,`students_id`),
  ADD KEY `fk_students_checks_answers1` (`answers_id`),
  ADD KEY `fk_students_checks_questions1` (`questions_id`),
  ADD KEY `fk_students_checks_tests1` (`tests_id`),
  ADD KEY `fk_students_checks_students1` (`students_id`);

--
-- Indeksy dla tabeli `students_has_tests`
--
ALTER TABLE `students_has_tests`
  ADD PRIMARY KEY (`id`,`students_id`,`tests_id`),
  ADD KEY `fk_students_has_tests_students1` (`students_id`),
  ADD KEY `fk_students_has_tests_tests1` (`tests_id`);

--
-- Indeksy dla tabeli `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tests_has_questions`
--
ALTER TABLE `tests_has_questions`
  ADD PRIMARY KEY (`id`,`tests_id`,`questions_id`),
  ADD KEY `fk_tests_has_questions_tests1` (`tests_id`),
  ADD KEY `fk_tests_has_questions_questions1` (`questions_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `fk_answers_questions` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `students_checks`
--
ALTER TABLE `students_checks`
  ADD CONSTRAINT `fk_students_checks_answers1` FOREIGN KEY (`answers_id`) REFERENCES `answers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_checks_questions1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_checks_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_checks_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `students_has_tests`
--
ALTER TABLE `students_has_tests`
  ADD CONSTRAINT `fk_students_has_tests_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_has_tests_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `tests_has_questions`
--
ALTER TABLE `tests_has_questions`
  ADD CONSTRAINT `fk_tests_has_questions_questions1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tests_has_questions_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
