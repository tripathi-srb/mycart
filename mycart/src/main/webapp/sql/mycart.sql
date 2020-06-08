-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2020 at 01:38 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mycart`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `categoryDescription` varchar(255) DEFAULT NULL,
  `categoryTitle` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `categoryDescription`, `categoryTitle`) VALUES
(1, 'A rose is a woody perennial flowering plant of the genus Rosa, in the family Rosaceae, or the flower it bears.', 'Rose'),
(2, 'The benefit to the plant is that it is very easily seen by the insects and birds which pollinate it, and it produces thousands of seeds.', 'Sunflower'),
(3, 'The lily is a genus of flowering plant. There are many species of lilies, like trumpet lilies and tiger lilies.', 'Lily flowers'),
(4, 'Tulips form a genus of spring-blooming perennial herbaceous bulbiferous geophytes.', 'Tulip'),
(5, 'Jasmine is a genus of shrubs and vines in the olive family.', 'Jasmine');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pId` int(11) NOT NULL,
  `pDes` varchar(3000) DEFAULT NULL,
  `pDiscount` int(11) NOT NULL,
  `pName` varchar(255) DEFAULT NULL,
  `pPhoto` varchar(255) DEFAULT NULL,
  `pPrice` int(25) DEFAULT NULL,
  `pQuantity` int(11) NOT NULL,
  `category_categoryId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pId`, `pDes`, `pDiscount`, `pName`, `pPhoto`, `pPrice`, `pQuantity`, `category_categoryId`) VALUES
(1, 'Black roses are symbols featured in fiction with many different meanings and titles such as black velvet rose, black magic,', 20, 'Black rose', 'black_rose1.jpg', 100, 1, 1),
(2, 'Long associated with the sun and its life-giving warmth, yellow is the age-old spokes-color for warm feelings of friendship and optimism', 10, 'Yellow Rose', 'yellow_rose.jpeg', 200, 1, 1),
(3, 'The sunflower (Helianthus annuus) is a living annual plant in the family Asteraceae, with a large flower head (capitulum).', 20, 'Common sunflower', 'sunflower1.jpg', 300, 1, 2),
(4, 'Brand New & Best Quality Imported Latex?Real Touch Flower?\r\nPlumeria Flowers Latex Frangipani , Made from Synthetic Silk polyester;', 30, 'White , 10pcs : 10 pcs White Tulip Flower', 'white_tulip1.jpg', 400, 10, 4),
(5, 'Jasmine is a genus of shrubs and vines in the olive family.', 20, 'Jasmine', 'jasmine.jpg', 500, 1, 5),
(6, 'Jasmine is a genus of shrubs and vines in the olive family.', 10, 'jasmine new', 'jasmine1.jpg', 400, 1, 5),
(7, 'Seed Type: Flower\r\nSuitable For: Indoor, Outdoor\r\nSeed For: Beautiful PINK Rose Plant\r\nFlowering Plant', 10, 'Beautiful PINK Rose Plant ', 'pink_rose.jpeg', 100, 1, 1),
(8, 'A blue rose is a flower of the genus Rosa (family Rosaceae) that presents blue-to-violet pigmentation instead of the more common red, white, or yellow. Blue roses are often used to symbolise secret or unattainable love. ', 20, 'Blue rose', 'blue_rose.jpg', 300, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_address` varchar(1500) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `user_phone` varchar(17) DEFAULT NULL,
  `user_pic` varchar(17) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_address`, `user_email`, `user_name`, `user_password`, `user_phone`, `user_pic`, `user_type`) VALUES
(1, 'hgfhg', 'surabhi@ebix.com', 'surabhi', '123', '87876464', 'default.jpg', 'normal'),
(2, 'delhi', 'priya@123', 'priya', '123', '987456123', 'default.jpg', 'normal'),
(3, 'xx', 'a@b.com', 'ttht5', '1234', '87876464', 'default.jpg', 'normal'),
(4, 'hi', 'him@gmail.com', 'him', '123', '6464545', 'default.jpg', 'admin'),
(5, 'ddfgf', 'abc@gmail.com', 'surabhi tripathi', '123', '44444444', 'default.jpg', 'normal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pId`),
  ADD KEY `FK825v7lftk50hyta3jlxerywcb` (`category_categoryId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UK_2q4p7v0ke69f4s36ueyb2pe2k` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
