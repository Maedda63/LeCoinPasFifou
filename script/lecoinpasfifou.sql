-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 09 juin 2019 à 23:13
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `lecoinpasfifou`
--

-- --------------------------------------------------------

--
-- Structure de la table `ad`
--

CREATE TABLE `ad` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `picture` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `created_at` datetime NOT NULL,
  `place_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ad`
--

INSERT INTO `ad` (`id`, `title`, `owner_id`, `description`, `picture`, `price`, `created_at`, `place_id`, `category_id`) VALUES
(1, 'Anciens livres', 1, 'Vends livres anciens avec au moins 90% de pages restantes pour la plupart.\r\n5€/livre 50€ pour la collection entière', 'https://cdn.pixabay.com/photo/2016/09/10/17/18/book-1659717_1280.jpg', 5, '2019-06-09 10:13:15', 1, 6),
(2, 'Vieux pinceau', 1, 'Vends vieux pinceau beaucoup utilisé. Cause : nouveau pinceau.', 'https://cdn.pixabay.com/photo/2014/02/18/17/44/paint-brush-269341_1280.jpg', 20, '2019-06-09 10:15:24', 1, 2),
(3, 'Collection de vieilles bouteilles', 1, 'Magnifiques collection de bouteilles vides. Avis aux amateurs, pressez-vous, il n\'y en aura pas pour tout le monde !', 'https://cdn.pixabay.com/photo/2016/03/28/09/45/bottles-1285230_1280.jpg', 50, '2019-06-09 10:17:08', 1, 5),
(4, 'Beau corps de ferme', 1, 'Vous aimez la campagne ? Vous aimez les travaux ? Vous aimez la tranquillité ? Ce corps de ferme est fait pour vous ! Magnifique vue à 360°C sur les champs. Deux, trois petites rénovations (toilettes bouchés et évier à changer mais rien de plus). Tranquillité assuré, premiers voisins à 10km.', 'https://cdn.pixabay.com/photo/2017/07/24/20/08/old-farmhouse-2535919_1280.jpg', 150000, '2019-06-09 16:54:52', 11, 4),
(5, 'Voiture de collection', 1, 'Je me sépare à contre cœur de ma magnifique voiture de collection. Peinture blanche avec quelques effets de rouille (pour le style). Faible kilométrage, pneus Michelin neufs, CT ok. Une occasion à ne pas rater ! Merci de l\'a bichonner comme je l\'ai fait toutes ces années. (P.S. : L\'homme n\'est pas à vendre, je le garde).', 'https://cdn.pixabay.com/photo/2015/06/20/13/55/man-815795_1280.jpg', 5000, '2019-06-09 19:33:20', 13, 3),
(6, 'Cadenas', 1, 'A vendre mon cadenas de casier d\'école (il y a 30 ans). Très peu servi, car j\'ai arrêté l\'école à 14 ans pour travailler. En parfait état (pour son âge) peut encore protéger vos biens les plus précieux !', 'https://cdn.pixabay.com/photo/2014/08/26/21/29/by-wlodek-428549_1280.jpg', 6, '2019-06-09 22:46:29', 16, 5),
(7, 'Meuble', 1, 'Je vends un meuble de la photo, choisi aléatoirement. Vous m\'envoyez l\'argent et je vous envoi le meuble choisi par mes soins. Amateurs de surprise, vous serez servi !', 'https://cdn.pixabay.com/photo/2016/04/18/13/53/room-1336497_1280.jpg', 100, '2019-06-09 22:51:50', 4, 1),
(8, 'Livre fantastique (type Harry Potter)', 1, 'Je vends un livre racontant les aventures d\'une civilisation contrôlée par un être supérieur. De leur création à leur destruction, ce livre de genre Fantastique saura ravir petits et grands à la manière des plus grand best-seller du genre.', 'https://cdn.pixabay.com/photo/2015/09/18/11/37/child-945422_1280.jpg', 15, '2019-06-09 22:58:56', 7, 6),
(9, 'Fleurs fanées', 1, 'Fleurs pour agrémenter vos tables de pot-pourri. En parfait état de décomposition. Magnifique nature morte. Une occasion en or !', 'https://cdn.pixabay.com/photo/2017/10/19/18/54/frost-damage-2868807_1280.jpg', 2, '2019-06-09 23:03:29', 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Meuble'),
(2, 'Outils'),
(3, 'Automobile'),
(4, 'Immobilier'),
(5, 'Brick à Brack'),
(6, 'Livres');

-- --------------------------------------------------------

--
-- Structure de la table `place`
--

CREATE TABLE `place` (
  `id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `place`
--

INSERT INTO `place` (`id`, `city`, `zip_code`) VALUES
(1, 'Clermont-Ferrand', '63000'),
(2, 'Aubière', '63170'),
(3, 'Blanzat', '63112'),
(4, 'Chamalières', '63400'),
(5, 'Châteaugay', '63119'),
(6, 'Durtol', '63830'),
(7, 'Le Cendre', '63670'),
(8, 'Nohanent', '63830'),
(9, 'Pont-du-Château', '63430'),
(10, 'Royat', '63130'),
(11, 'Saint-Genès-Champanelle', '63122'),
(12, 'Aulnat', '63510'),
(13, 'Beaumont', '63110'),
(14, 'Cournon-d\'Auvergne', '63800'),
(15, 'Cébazat', '63118'),
(16, 'Ceyrat', '63122'),
(17, 'Gerzat', '63360'),
(18, 'Lempdes', '63370'),
(19, 'Orcines', '63870'),
(20, 'Pérignat-Lès-Sarliève', '63170'),
(21, 'Romagnat', '63540');

-- --------------------------------------------------------

--
-- Structure de la table `seller`
--

CREATE TABLE `seller` (
  `ad` int(11) NOT NULL,
  `buyer` int(11) NOT NULL,
  `sale_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'Michmich', 'jm@gmail.com', 'michmich63');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ad`
--
ALTER TABLE `ad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `place` (`place_id`),
  ADD KEY `owner` (`owner_id`),
  ADD KEY `ad_ibfk_4` (`category_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`ad`,`buyer`),
  ADD KEY `seller_ibfk_1` (`buyer`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ad`
--
ALTER TABLE `ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ad`
--
ALTER TABLE `ad`
  ADD CONSTRAINT `ad_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ad_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ad_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
