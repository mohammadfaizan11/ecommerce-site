-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2024 at 03:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `camp`
--

CREATE TABLE `camp` (
  `Name` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `GSTNO` varchar(100) NOT NULL,
  `Yeardate` varchar(100) NOT NULL,
  `closedate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camp`
--

INSERT INTO `camp` (`Name`, `Location`, `Address`, `City`, `GSTNO`, `Yeardate`, `closedate`) VALUES
('JK MART', 'Amravati', 'Raja Peth Amravati', 'Amravati', 'AJ553230SD54', '2024-04-08', '2027-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Stock` varchar(100) NOT NULL,
  `catagery` varchar(100) NOT NULL,
  `Prices` varchar(100) NOT NULL,
  `GST` varchar(50) NOT NULL,
  `Total` varchar(100) NOT NULL,
  `Product_Cost` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `Name`, `Stock`, `catagery`, `Prices`, `GST`, `Total`, `Product_Cost`) VALUES
(1, 'Cooking Oil (1 liter)', '100', 'FOOD', '120', '0.05%', '140', '2000'),
(2, 'Chocolate (per 100g)', '100', 'FOOD', '50', '0.05%', '60', '5000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
