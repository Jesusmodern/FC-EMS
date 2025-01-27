-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 31 jan. 2022 à 21:54
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fcems`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id-article` int(10) UNSIGNED NOT NULL,
  `titre` varchar(80) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `sub` varchar(500) NOT NULL,
  `texte` text NOT NULL,
  `auteur` int(10) UNSIGNED NOT NULL,
  `date` varchar(20) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id-article`, `titre`, `keyword`, `sub`, `texte`, `auteur`, `date`, `type`) VALUES
(1, 'Article victoire senior', 'senior;victoire', 'Lorem ipsum dolor sit amet. Et assumenda illo ut rerum dolorem non sunt impedit ut amet expedita vel ipsam ratione! Aut voluptatem ipsam sit dolorum consequatur eos fugiat exercitationem qui modi dolorem.', 'Lorem ipsum dolor sit amet. Et assumenda illo ut rerum dolorem non sunt impedit ut amet expedita vel ipsam ratione! Aut voluptatem ipsam sit dolorum consequatur eos fugiat exercitationem qui modi dolorem. Cum omnis amet id incidunt sint est totam dignissimos ut dolores nihil est voluptatem recusandae in unde odit.\r\n\r\nEa galisum vero aut officiis enim ad deleniti voluptates nam quas itaque ad Quis incidunt. Est nihil harum quo rerum enim qui ipsam velit eum recusandae sint ab autem temporibus et temporibus amet. Et voluptas alias et omnis nemo hic ipsum rerum non provident nulla.\r\n\r\nEst rerum accusantium et perspiciatis quisquam hic iste necessitatibus est velit galisum ea nesciunt inventore in officia laborum aut dolor nisi? Eum quasi quam non aspernatur voluptas qui commodi excepturi non aspernatur maxime et tenetur veritatis eos ducimus consequatur. Eum sunt corporis est ducimus voluptate sed aliquam illum sit vero molestias et quos asperiores quo neque vitae. In quaerat sint eum deleniti saepe sed dicta neque 33 quod veritatis eos fuga nihil?', 1, '20220130', 'type1');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `equipe` tinyint(3) UNSIGNED NOT NULL,
  `categorie` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `equipe`, `categorie`) VALUES
(1, 1, 'U13 A'),
(4, 1, 'U13 B'),
(6, 3, 'U15 A'),
(7, 3, 'U15 B');

-- --------------------------------------------------------

--
-- Structure de la table `convocation`
--

CREATE TABLE `convocation` (
  `id-convocation` int(10) UNSIGNED NOT NULL,
  `joueur` int(10) UNSIGNED NOT NULL,
  `categorie` tinyint(3) UNSIGNED NOT NULL,
  `id-rencontre` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `id-equipe` tinyint(10) UNSIGNED NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`id-equipe`, `nom`) VALUES
(1, 'U13'),
(3, 'U15'),
(4, 'Senior');

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE `joueur` (
  `id-joueur` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `equipe` tinyint(3) UNSIGNED NOT NULL,
  `photo` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `joueur`
--

INSERT INTO `joueur` (`id-joueur`, `nom`, `prenom`, `equipe`, `photo`) VALUES
(1, 'Charlet', 'Tom', 4, NULL),
(2, 'Abraham', 'Noah', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id-media` smallint(5) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `equipe` tinyint(3) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL,
  `article` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `palmares`
--

CREATE TABLE `palmares` (
  `id-palmares` int(10) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `date` varchar(20) NOT NULL,
  `equipe` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rencontre`
--

CREATE TABLE `rencontre` (
  `id-rencontre` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `date` varchar(40) NOT NULL,
  `equipe-ems` tinyint(3) UNSIGNED NOT NULL,
  `equipe-ext` varchar(50) NOT NULL,
  `score` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id-settings` tinyint(4) NOT NULL,
  `name` varchar(256) NOT NULL,
  `value` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id-settings`, `name`, `value`) VALUES
(3, 'home-text', 'voici l histoire du club EMS c est super tout ce blabla');

-- --------------------------------------------------------

--
-- Structure de la table `sponsor`
--

CREATE TABLE `sponsor` (
  `id-sponsor` int(10) UNSIGNED NOT NULL,
  `nom` varchar(80) NOT NULL,
  `date` tinytext NOT NULL,
  `type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `staff`
--

CREATE TABLE `staff` (
  `id-staff` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `infos` varchar(255) DEFAULT NULL,
  `name` varchar(70) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `staff`
--

INSERT INTO `staff` (`id-staff`, `nom`, `prenom`, `type`, `infos`, `name`, `password`) VALUES
(1, 'Caillot', 'Antoine', 'admin', 'fsefsfqd', 'ad', 'fc8252c8dc55839967c58b9ad755a59b61b67c13227ddae4bd3f78a38bf394f7');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id-article`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorie` (`categorie`),
  ADD KEY `equipe` (`equipe`) USING BTREE;

--
-- Index pour la table `convocation`
--
ALTER TABLE `convocation`
  ADD PRIMARY KEY (`id-convocation`),
  ADD KEY `joueur` (`joueur`) USING BTREE,
  ADD KEY `categorie` (`categorie`),
  ADD KEY `id-rencontre` (`id-rencontre`);

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id-equipe`);

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD PRIMARY KEY (`id-joueur`),
  ADD UNIQUE KEY `photo` (`photo`),
  ADD KEY `equipe` (`equipe`) USING BTREE;

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id-media`),
  ADD KEY `article` (`article`),
  ADD KEY `equipe` (`equipe`);

--
-- Index pour la table `palmares`
--
ALTER TABLE `palmares`
  ADD PRIMARY KEY (`id-palmares`),
  ADD KEY `equipe` (`equipe`);

--
-- Index pour la table `rencontre`
--
ALTER TABLE `rencontre`
  ADD PRIMARY KEY (`id-rencontre`),
  ADD KEY `equipe-ems` (`equipe-ems`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id-settings`);

--
-- Index pour la table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`id-sponsor`);

--
-- Index pour la table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id-staff`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id-article` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `convocation`
--
ALTER TABLE `convocation`
  MODIFY `id-convocation` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id-equipe` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `joueur`
--
ALTER TABLE `joueur`
  MODIFY `id-joueur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id-media` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `palmares`
--
ALTER TABLE `palmares`
  MODIFY `id-palmares` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rencontre`
--
ALTER TABLE `rencontre`
  MODIFY `id-rencontre` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id-settings` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `id-sponsor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `staff`
--
ALTER TABLE `staff`
  MODIFY `id-staff` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`equipe`) REFERENCES `equipe` (`id-equipe`);

--
-- Contraintes pour la table `convocation`
--
ALTER TABLE `convocation`
  ADD CONSTRAINT `convocation_ibfk_1` FOREIGN KEY (`joueur`) REFERENCES `joueur` (`id-joueur`) ON UPDATE CASCADE,
  ADD CONSTRAINT `convocation_ibfk_2` FOREIGN KEY (`categorie`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `convocation_ibfk_3` FOREIGN KEY (`id-rencontre`) REFERENCES `rencontre` (`id-rencontre`);

--
-- Contraintes pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD CONSTRAINT `joueur_ibfk_1` FOREIGN KEY (`equipe`) REFERENCES `equipe` (`id-equipe`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`equipe`) REFERENCES `equipe` (`id-equipe`) ON UPDATE CASCADE,
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`article`) REFERENCES `article` (`id-article`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `palmares`
--
ALTER TABLE `palmares`
  ADD CONSTRAINT `palmares_ibfk_1` FOREIGN KEY (`equipe`) REFERENCES `equipe` (`id-equipe`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `rencontre`
--
ALTER TABLE `rencontre`
  ADD CONSTRAINT `rencontre_ibfk_1` FOREIGN KEY (`equipe-ems`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
