-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2019 at 02:03 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydbtest`
--

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE `goods` (
  `id` int(5) NOT NULL,
  `goods_quantity` int(11) DEFAULT NULL,
  `goods_type` varchar(50) DEFAULT NULL,
  `goods_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `goods`
--

INSERT INTO `goods` (`id`, `goods_quantity`, `goods_type`, `goods_date`) VALUES
(2, 69, 'Chicken Noodle soup', '2019-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `goods_has_inventory`
--

CREATE TABLE `goods_has_inventory` (
  `goods_id` int(5) NOT NULL,
  `inventory_id` int(5) NOT NULL,
  `id` int(5) NOT NULL,
  `goods_has_delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `goods_has_inventory`
--

INSERT INTO `goods_has_inventory` (`goods_id`, `inventory_id`, `id`, `goods_has_delivery_date`) VALUES
(2, 3, 4, '2019-10-26');

-- --------------------------------------------------------

--
-- Stand-in structure for view `goods_view`
-- (See below for the actual view)
--
CREATE TABLE `goods_view` (
`goods_type` varchar(50)
,`goods_quantity` int(11)
,`inventory_stock` int(11)
,`inventory_item` varchar(50)
,`inventory_sold` int(11)
,`goods_id` int(5)
,`goods_has_delivery_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(5) NOT NULL,
  `inventory_item` varchar(50) DEFAULT NULL,
  `inventory_type` varchar(50) DEFAULT NULL,
  `inventory_stock` int(11) DEFAULT NULL,
  `inventory_sold` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `inventory_item`, `inventory_type`, `inventory_stock`, `inventory_sold`) VALUES
(3, 'Utensils', 'tools', 600, 269);

-- --------------------------------------------------------

--
-- Structure for view `goods_view`
--
DROP TABLE IF EXISTS `goods_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `goods_view`  AS  select `goods`.`goods_type` AS `goods_type`,`goods`.`goods_quantity` AS `goods_quantity`,`inventory`.`inventory_stock` AS `inventory_stock`,`inventory`.`inventory_item` AS `inventory_item`,`inventory`.`inventory_sold` AS `inventory_sold`,`goods_has_inventory`.`goods_id` AS `goods_id`,`goods_has_inventory`.`goods_has_delivery_date` AS `goods_has_delivery_date` from ((`goods` join `goods_has_inventory` on((`goods`.`id` = `goods_has_inventory`.`goods_id`))) join `inventory` on((`inventory`.`id` = `goods_has_inventory`.`inventory_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goods_has_inventory`
--
ALTER TABLE `goods_has_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_goods_has_inventory1_inventory1_idx` (`inventory_id`),
  ADD KEY `fk_goods_has_inventory1_goods_idx` (`goods_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `goods_has_inventory`
--
ALTER TABLE `goods_has_inventory`
  ADD CONSTRAINT `fk_goods_has_inventory1_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_goods_has_inventory1_inventory1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
