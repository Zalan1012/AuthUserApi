-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3307
-- Létrehozás ideje: 2026. Nov 05. 11:21
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `authuser`
--
CREATE DATABASE IF NOT EXISTS `authuser` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `authuser`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `Id` char(36) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `RegTime` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`Id`, `Name`, `RegTime`) VALUES
('4845c72f-94b0-42b7-b52d-c613023c5c00', 'Ilona', '2026-11-05 11:15:08');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `userrole`
--

CREATE TABLE `userrole` (
  `UserId` char(36) NOT NULL,
  `RoleId` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `Id` char(36) NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` text DEFAULT NULL,
  `RegTime` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`Id`, `Name`, `Email`, `Password`, `RegTime`) VALUES
('921e8f5d-b8c7-4492-ace9-4b39202c7051', 'kata01', 'kata01@gmail.com', 'Alma123', '2026-11-05 09:55:16');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `UserId` (`UserId`,`RoleId`),
  ADD KEY `RoleId` (`RoleId`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
