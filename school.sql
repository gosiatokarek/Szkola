-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Czas generowania: 18 Wrz 2022, 06:50
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `school`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assignedsubject`
--

CREATE TABLE `assignedsubject` (
  `allocationID` int(11) NOT NULL,
  `groupID` int(11) NOT NULL,
  `teacherID` int(11) NOT NULL,
  `subjectID` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `weekQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `group`
--

CREATE TABLE `group` (
  `groupID` int(11) NOT NULL,
  `name` tinytext COLLATE utf8mb4_polish_ci NOT NULL,
  `teacherID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rating`
--

CREATE TABLE `rating` (
  `ratingID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `allocationID` int(11) NOT NULL,
  `dateR` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `groupID` int(11) DEFAULT NULL,
  `name` tinytext COLLATE utf8mb4_polish_ci NOT NULL,
  `surname` tinytext COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `subject`
--

CREATE TABLE `subject` (
  `subjectID` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `teacher`
--

CREATE TABLE `teacher` (
  `teacherID` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `surname` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `assignedsubject`
--
ALTER TABLE `assignedsubject`
  ADD PRIMARY KEY (`allocationID`),
  ADD KEY `teacherID` (`teacherID`),
  ADD KEY `subjectID` (`subjectID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indeksy dla tabeli `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`groupID`),
  ADD KEY `teacherID` (`teacherID`);

--
-- Indeksy dla tabeli `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`ratingID`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `allocationID` (`allocationID`);

--
-- Indeksy dla tabeli `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indeksy dla tabeli `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectID`);

--
-- Indeksy dla tabeli `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `assignedsubject`
--
ALTER TABLE `assignedsubject`
  MODIFY `allocationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `group`
--
ALTER TABLE `group`
  MODIFY `groupID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `rating`
--
ALTER TABLE `rating`
  MODIFY `ratingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `student`
--
ALTER TABLE `student`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `subject`
--
ALTER TABLE `subject`
  MODIFY `subjectID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacherID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `assignedsubject`
--
ALTER TABLE `assignedsubject`
  ADD CONSTRAINT `assignedsubject_ibfk_1` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`),
  ADD CONSTRAINT `assignedsubject_ibfk_2` FOREIGN KEY (`groupID`) REFERENCES `group` (`groupID`),
  ADD CONSTRAINT `assignedsubject_ibfk_3` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`);

--
-- Ograniczenia dla tabeli `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `group_ibfk_1` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`);

--
-- Ograniczenia dla tabeli `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`allocationID`) REFERENCES `assignedsubject` (`allocationID`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`);

--
-- Ograniczenia dla tabeli `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`groupID`) REFERENCES `group` (`groupID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
