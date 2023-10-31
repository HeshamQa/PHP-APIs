-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2023 at 04:08 PM
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
-- Database: `ecommercedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Id` int(11) NOT NULL,
  `IdUsers` int(11) NOT NULL,
  `IdItem` int(11) NOT NULL,
  `Count` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`Id`, `IdUsers`, `IdItem`, `Count`) VALUES
(22, 55, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `itemimage`
--

CREATE TABLE `itemimage` (
  `Id` int(11) NOT NULL,
  `IdItems` int(11) NOT NULL,
  `ImageUrl` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itemimage`
--

INSERT INTO `itemimage` (`Id`, `IdItems`, `ImageUrl`) VALUES
(1, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7umYBd3ZjQ3T7UbjcDxNv6aZoosqcUo959XDpJ9N0vdi70PRDcoytw6kAamXw_25AjqQ&usqp=CAU'),
(2, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7umYBd3ZjQ3T7UbjcDxNv6aZoosqcUo959XDpJ9N0vdi70PRDcoytw6kAamXw_25AjqQ&usqp=CAU');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `HomeImage` varchar(200) NOT NULL,
  `Price` double NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Id`, `Name`, `HomeImage`, `Price`, `Description`) VALUES
(1, 'painter', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7umYBd3ZjQ3T7UbjcDxNv6aZoosqcUo959XDpJ9N0vdi70PRDcoytw6kAamXw_25AjqQ&usqp=CAU', 2500, 'this images is without a back ground'),
(2, 'hesham', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7umYBd3ZjQ3T7UbjcDxNv6aZoosqcUo959XDpJ9N0vdi70PRDcoytw6kAamXw_25AjqQ&usqp=CAU', 10000, 'hello there'),
(3, 'hhhhhhhh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7umYBd3ZjQ3T7UbjcDxNv6aZoosqcUo959XDpJ9N0vdi70PRDcoytw6kAamXw_25AjqQ&usqp=CAU', 1000, 'oihfuilhaefhil');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `Id` int(11) NOT NULL,
  `IdOrder` int(11) NOT NULL,
  `IdItems` int(11) NOT NULL,
  `Count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `IdUsers` int(11) NOT NULL,
  `TotalPrice` double NOT NULL,
  `IdOrderState` int(11) NOT NULL,
  `FullName` varchar(200) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `City` varchar(50) NOT NULL,
  `StreetName` varchar(100) NOT NULL,
  `BuildingNumber` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderstate`
--

CREATE TABLE `orderstate` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Password` text NOT NULL,
  `IdUserType` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `Name`, `Email`, `Phone`, `Password`, `IdUserType`) VALUES
(55, 'Hesham', 'ss', 's', '123', 1),
(56, 'hesham', 'qaoudqa@gmail.com', '0788828337', 'heshamqa123', 1),
(57, 'hesham ahmed', 'Qaoud@gmail.com', '0123456789', 'Hesham', 1),
(58, 'qa', 'aa@gmail.com', '0788828337', 'aasssss', 1),
(59, 'hesham', 'ww@gmail.com', '0788828337', '123456', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `Name`) VALUES
(1, 'user'),
(2, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cart_ibfk_1` (`IdUsers`),
  ADD KEY `cart_ibfk_2` (`IdItem`);

--
-- Indexes for table `itemimage`
--
ALTER TABLE `itemimage`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `itemimage_ibfk_1` (`IdItems`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `orderdetails_ibfk_1` (`IdItems`),
  ADD KEY `orderdetails_ibfk_2` (`IdOrder`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `orders_ibfk_1` (`IdOrderState`),
  ADD KEY `orders_ibfk_2` (`IdUsers`);

--
-- Indexes for table `orderstate`
--
ALTER TABLE `orderstate`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `user_ibfk_1` (`IdUserType`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `itemimage`
--
ALTER TABLE `itemimage`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderstate`
--
ALTER TABLE `orderstate`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`IdUsers`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`IdItem`) REFERENCES `items` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `itemimage`
--
ALTER TABLE `itemimage`
  ADD CONSTRAINT `itemimage_ibfk_1` FOREIGN KEY (`IdItems`) REFERENCES `items` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`IdItems`) REFERENCES `items` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`IdOrder`) REFERENCES `orders` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`IdOrderState`) REFERENCES `orderstate` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`IdUsers`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`IdUserType`) REFERENCES `usertype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
