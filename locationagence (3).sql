-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 15 mars 2024 à 16:37
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `locationagence`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telephone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `email`, `telephone`) VALUES
(1, 'Nabil Djerroud', 'test@tets.ca', '5554445555'),
(2, 'Test 2', 'test@cmaisonneuve.qc.ca', '448758458'),
(3, 'teststetst', 'nabil.djerroud93@hotmail.com', '5068995174'),
(4, 'Nabil Djerroudqsdqsddsq', 'nabil.djerroud93@hotmail.com', '0773199330'),
(5, 'Nabil Djerroudsssssss', 'nabil.djerroud93@hotmail.com', '5068995174'),
(6, 'tesgfg', 'nabil.djerroud93@hotmail.com', '5068995174');

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `date_location` date NOT NULL,
  `client_id` int(11) NOT NULL,
  `date_retour` date DEFAULT NULL,
  `voiture_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`id`, `date_location`, `client_id`, `date_retour`, `voiture_id`) VALUES
(1, '2024-02-12', 1, '2024-03-10', 2),
(2, '2024-02-29', 2, '2024-03-26', 1);

-- --------------------------------------------------------

--
-- Structure de la table `privilege`
--

CREATE TABLE `privilege` (
  `id` int(11) NOT NULL,
  `privilege` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `privilege`
--

INSERT INTO `privilege` (`id`, `privilege`) VALUES
(1, 'Admin'),
(2, 'Manager'),
(3, 'Employee');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `email`, `privilege_id`, `created_at`) VALUES
(1, 'Bilou', 'nabil@bilou.dz', '$2y$10$L0UY2raf8XV12iWN7qhk3uuqfqQg8Ro/dpD8lWwPuaPbSJirtXwMa', 'nabil@bilou.dz', 1, '2024-03-14 17:46:01'),
(44, 'Nabil', 'test@test.ca', '$2y$10$L0UY2raf8XV12iWN7qhk3uuqfqQg8Ro/dpD8lWwPuaPbSJirtXwMa', 'test@test.ca', 1, '2024-03-14 16:59:24'),
(45, 'Test 1', 'Nabil@gmail.com', '$2y$10$AKr8GHlZ6cxlw7nOmWZape3xUYCvndN7uopJEwafiBHL8d5LQpSNO', 'Nabil@gmail.com', 3, '2024-03-14 17:47:20'),
(46, 'test', 'e2899555@cmaisonneuve.qc.ca', '$2y$10$capjYPfTXwNp395W1/PUgOmEDAonS9tf8vNMKmrrMKimuhYCyuMUO', 'nabil.djerroud93@gmail.com', 1, '2024-03-15 04:51:10'),
(47, 'malha', 'emma.luche@gmail.com', '$2y$10$kSB.bjZHorbcENvo/rp40ep6xQ0nBfw4nvyIThfBf8L/Q2gDznCge', 'emma.luche@gmail.com', 1, '2024-03-15 04:52:03'),
(48, 'malha', 'tssest@test.ca', '$2y$10$Kwizq4SOo5uXsM0Ls0rNPurtlW/DLqK6SFIIteo4nJEJL/2QyB5j.', 'tssest@test.ca', 1, '2024-03-15 04:55:04'),
(49, 'malhatest', 'tsdsdest@test.ca', '$2y$10$/gOw88tI7gsjniMZn0R5OeGrnO85PHqd57CVvGOP..5BYB.tx6VMi', 'tsdsdest@test.ca', 1, '2024-03-15 04:56:26'),
(50, 'ssssss', 'vv@v.va', '$2y$10$cc3yUQsUj/JRI49MbKjP2O5sXnTVz3OpDtM7WtSMovQjjkvomGSCq', 'vv@v.va', 3, '2024-03-15 05:10:07'),
(51, 'Malek', 'male@t.ca', '$2y$10$08ECGB8xWUHC2bMbh2.gQOPoHJO/r1VriM4IRn/WJEdHLQHoBhsRy', 'male@t.ca', 1, '2024-03-15 13:23:42');

-- --------------------------------------------------------

--
-- Structure de la table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `visited_page` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_logs`
--

INSERT INTO `user_logs` (`id`, `username`, `ip_address`, `visited_page`, `created_at`, `user_id`) VALUES
(134, 'utilisateur_test', '192.168.1.1', '/page-test', '2024-03-15 19:58:30', 1),
(135, 'utilisateur_test', '192.168.1.1', '/page-test', '2024-03-15 19:58:32', 1),
(136, 'utilisateur_test', '192.168.1.1', '/page-test', '2024-03-15 19:59:01', 1),
(137, 'utilisateur_test', '192.168.1.1', '/page-test', '2024-03-15 19:59:06', 1),
(138, 'utilisateur_test', '192.168.1.1', '/page-test', '2024-03-15 20:26:48', 1);

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE `voiture` (
  `id` int(11) NOT NULL,
  `marque` varchar(255) NOT NULL,
  `modele` varchar(255) NOT NULL,
  `annee` int(11) DEFAULT NULL,
  `prix_location` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`id`, `marque`, `modele`, `annee`, `prix_location`) VALUES
(1, 'Honda', 'Civic', 2010, 100),
(2, 'Bentley', '3', 2006, 250);

-- --------------------------------------------------------

--
-- Structure de la table `voiture_location`
--

CREATE TABLE `voiture_location` (
  `voiture_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `prix` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_location_client_idx` (`client_id`);

--
-- Index pour la table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_privilege_id` (`privilege_id`);

--
-- Index pour la table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_logs_user_id` (`user_id`);

--
-- Index pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `voiture_location`
--
ALTER TABLE `voiture_location`
  ADD UNIQUE KEY `voiture_id_UNIQUE` (`voiture_id`),
  ADD UNIQUE KEY `location_id_UNIQUE` (`location_id`),
  ADD KEY `fk_voiture_has_location_location1_idx` (`location_id`),
  ADD KEY `fk_voiture_has_location_voiture1_idx` (`voiture_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `privilege`
--
ALTER TABLE `privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT pour la table `voiture`
--
ALTER TABLE `voiture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `fk_location_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_privilege_id` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`id`);

--
-- Contraintes pour la table `user_logs`
--
ALTER TABLE `user_logs`
  ADD CONSTRAINT `fk_user_logs_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `voiture_location`
--
ALTER TABLE `voiture_location`
  ADD CONSTRAINT `fk_voiture_has_location_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_voiture_has_location_voiture1` FOREIGN KEY (`voiture_id`) REFERENCES `voiture` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
