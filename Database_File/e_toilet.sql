-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2023 at 08:14 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_toilet`
--

-- --------------------------------------------------------

--
-- Table structure for table `municipal_corporation`
--

CREATE TABLE `municipal_corporation` (
  `id` int(10) NOT NULL,
  `srno` varchar(50) NOT NULL,
  `cityname` varchar(50) NOT NULL,
  `mcname` varchar(50) NOT NULL,
  `emailid` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `passwd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `municipal_corporation`
--

INSERT INTO `municipal_corporation` (`id`, `srno`, `cityname`, `mcname`, `emailid`, `mobile`, `passwd`) VALUES
(1, '101', 'Nashik', 'Nashik Municipal Corporation', 'nmc@gmail.com', '8888888888', '123456'),
(2, '102', 'Pune', 'Pune Municipal Corporation', 'pmc@gmail.com', '7777777777', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `toilet_details`
--

CREATE TABLE `toilet_details` (
  `id` int(10) NOT NULL,
  `srno` varchar(30) NOT NULL,
  `location` varchar(50) NOT NULL,
  `kitid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `emailid` varchar(50) NOT NULL,
  `RFIDno` varchar(50) NOT NULL,
  `mq135` varchar(50) NOT NULL,
  `mq8` varchar(50) NOT NULL,
  `mq4` varchar(50) NOT NULL,
  `temp` varchar(50) NOT NULL,
  `humidity` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `toilet_details`
--

INSERT INTO `toilet_details` (`id`, `srno`, `location`, `kitid`, `name`, `address`, `mobile`, `emailid`, `RFIDno`, `mq135`, `mq8`, `mq4`, `temp`, `humidity`) VALUES
(1, '1001', 'CBS Thakkar Bazar', '1001', 'ABC', 'PQR', '8989767689', 'abc@gmail.com', '0B0026DEA457', '403', '221', '411', '29.00', '35.00');

-- --------------------------------------------------------

--
-- Table structure for table `uncleanedlog`
--

CREATE TABLE `uncleanedlog` (
  `id` int(10) NOT NULL,
  `RFIDno` varchar(30) NOT NULL,
  `kitid` int(30) NOT NULL,
  `mq135` varchar(50) NOT NULL,
  `mq8` varchar(50) NOT NULL,
  `mq4` varchar(50) NOT NULL,
  `temp` varchar(30) NOT NULL,
  `humidity` varchar(50) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `uncleanedlog`
--

INSERT INTO `uncleanedlog` (`id`, `RFIDno`, `kitid`, `mq135`, `mq8`, `mq4`, `temp`, `humidity`, `date`, `time`) VALUES
(1, '0B0026DEA457', 1001, '407', '222', '413', '29.00', '35.00', '2023-03-02', '11-11-11'),
(2, '0B0026DEA457', 1001, '404', '221', '411', '29.00', '35.00', '2023-03-02', '11-12-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `municipal_corporation`
--
ALTER TABLE `municipal_corporation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toilet_details`
--
ALTER TABLE `toilet_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uncleanedlog`
--
ALTER TABLE `uncleanedlog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `municipal_corporation`
--
ALTER TABLE `municipal_corporation`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `toilet_details`
--
ALTER TABLE `toilet_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uncleanedlog`
--
ALTER TABLE `uncleanedlog`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
