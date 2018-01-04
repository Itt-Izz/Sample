-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2017 at 12:19 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dmclient`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(35) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'Faisal', 'letmein');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `cat_id`) VALUES
(1, 'Mike & Rudis Race', 2),
(2, 'Secrets of Success', 3),
(3, 'Planet War', 1),
(4, 'Artificial Intelligence II', 5),
(5, 'Livestock Care', 4);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Science Fiction'),
(2, 'Comic'),
(3, 'Business & Finance'),
(4, 'Agriculture'),
(5, 'Computer & Technology');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `username` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `email_address` varchar(70) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `ver_code` varchar(30) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `username`, `email_address`, `password`, `ver_code`) VALUES
(1, 'pearson', 'perason@pear.net', 'rte563g', '345DE9'),
(2, 'litt', 'litt@pear.net', 'hdy753g', '786DER'),
(3, 'scott', 'scott@pear.net', 'jx97gd', '56F45D'),
(4, 'sam', 'sam@pear.net', '5tgs7', '74UFR7'),
(5, 'hann', 'hann@pear.net', 'hde7ys', '573FGRT'),
(6, 'genny', 'genny@pear.net', '63gdrs', '687RTD');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_code` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `book_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `order_date`, `order_time`, `book_id`, `client_id`) VALUES
(1, 'rtdg5623', '2017-05-12', '2017-11-26 19:21:43', 3, 2),
(2, 'rtde93f623', '2017-05-02', '2017-11-26 19:32:45', 3, 2),
(3, 'tdg625tss', '2017-05-28', '2017-11-26 19:32:45', 1, 4),
(4, '5637yhdghw', '2016-07-12', '2017-11-26 19:32:45', 4, 5),
(5, 'gbshuy3rer', '2016-06-12', '2017-11-26 19:32:45', 4, 2),
(6, 'ygh3yw3', '2017-07-12', '2017-11-26 19:32:45', 2, 4),
(7, '563gbr34', '2017-12-12', '2017-11-26 19:32:45', 1, 3),
(8, '7uhjenf', '2017-11-12', '2017-11-26 19:32:45', 5, 4),
(9, 'hbvnce55', '2017-10-12', '2017-11-26 19:32:45', 1, 5),
(10, '789bnht', '2017-09-12', '2017-11-26 19:32:45', 5, 1),
(11, 'yhy876', '2017-08-12', '2017-11-26 19:32:45', 3, 2),
(12, '78uhbhgt6', '2017-05-12', '2017-11-26 19:32:45', 2, 3),
(13, '67uyhb', '2017-05-12', '2017-11-26 19:32:45', 3, 4),
(14, 'y678uhb', '2017-05-12', '2017-11-26 19:32:45', 4, 3),
(15, 'yhjbn8y6', '2017-05-12', '2017-11-26 19:32:45', 1, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cat_id` (`cat_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_id` (`book_id`),
  ADD KEY `fk_client_id` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
