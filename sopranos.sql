-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 27 mrt 2024 om 13:02
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sopranos`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `category`
--

INSERT INTO `category` (`id`, `name`, `img`) VALUES
(1, 'Vegatarische pizza\'s', 'veggie.jpg'),
(2, 'Vlees pizza\'s', 'bbq.jpg'),
(3, 'Vis pizza\'s', 'zalm.jpg');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230315135305', '2023-03-22 12:47:53', 228),
('DoctrineMigrations\\Version20230315135447', '2023-03-22 12:47:53', 155),
('DoctrineMigrations\\Version20230315141140', '2023-03-22 12:47:54', 141),
('DoctrineMigrations\\Version20230315142304', '2023-03-22 12:47:54', 266),
('DoctrineMigrations\\Version20230315142816', '2023-03-22 12:47:54', 229),
('DoctrineMigrations\\Version20230316105020', '2023-03-22 12:47:54', 40),
('DoctrineMigrations\\Version20230316105607', '2023-03-22 12:47:54', 148),
('DoctrineMigrations\\Version20230316105806', '2023-03-22 12:47:54', 37),
('DoctrineMigrations\\Version20230316113202', '2023-03-22 12:47:54', 137);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `Firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `order`
--

INSERT INTO `order` (`id`, `Firstname`, `Lastname`, `address`, `email`, `zipcode`, `pizza_id`, `size_id`) VALUES
(25, 'wass', '', 'van goghstraat 86', 'mhand070@hotmail.com', '2512tg', 2, 1),
(26, 'wass', '', 'van goghstraat 86', 'mhand070@hotmail.com', '2512tg', 2, 1),
(27, 'wass', '', 'van goghstraat 86', 'mhand070@hotmail.com', '2512tg', 2, 1),
(28, 'wass', '', 'van goghstraat 86', 'mhand070@hotmail.com', '2512tg', 2, 1),
(29, 'jan', '', 'van fdffstraat 86', 'mhand070@hotmail.com', '2512tg', 3, 2),
(30, 'jan', '', 'van fdffstraat 86', 'mhand070@hotmail.com', '2512tg', 3, 2),
(31, 'hello', '', 'mondriaanstraat1', 'mhand070@hotmail.com', '2512tg', 2, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `pizza`
--

INSERT INTO `pizza` (`id`, `name`, `description`, `price`, `category_id`, `img`) VALUES
(1, 'Veggie Deluxe', '', '8.50', 1, 'veggie pizza.jpg'),
(2, 'bbq pizza', '', '7.50', 2, 'bbq.jpg'),
(3, 'Tonijn pizza', '', '9.00', 3, 'pizza tonno.jpg');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `size`
--

INSERT INTO `size` (`id`, `name`) VALUES
(1, '25 CM'),
(2, '32 CM'),
(3, 'Calzone');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398D41D1D42` (`pizza_id`),
  ADD KEY `IDX_F5299398498DA827` (`size_id`);

--
-- Indexen voor tabel `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CFDD826F12469DE2` (`category_id`);

--
-- Indexen voor tabel `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT voor een tabel `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398498DA827` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  ADD CONSTRAINT `FK_F5299398D41D1D42` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`);

--
-- Beperkingen voor tabel `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `FK_CFDD826F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
