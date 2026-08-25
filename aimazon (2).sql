-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2025 at 09:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aimazon`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `admin_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `verification_code` int(6) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`admin_id`, `first_name`, `last_name`, `contact_number`, `email`, `verification_code`, `username`, `password`, `created_at`) VALUES
(1, 'John Arthur', 'Tuliao', '9385869225', 'Tuliaojohnarthur097@gmail.com', 186061, 'arthur', 'arthur', '2025-11-02 22:46:50'),
(4, 'izzy', 'ignacio', '9385869225', 'izzytosocignacio@gmail.com', 104880, 'Zyrissss', 'blue123', '2025-11-05 22:10:53');

-- --------------------------------------------------------

--
-- Table structure for table `best_sellers`
--

CREATE TABLE `best_sellers` (
  `prod_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `total_sold` int(11) DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_code` varchar(50) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `shipping_address` text NOT NULL,
  `shipping_city` varchar(100) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Photo_url` varchar(100) NOT NULL,
  `status` enum('Pending','Processing','Completed','Shipped','Delivered','Cancelled','Refunded','Approved') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_code`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `shipping_city`, `payment_method`, `subtotal`, `tax`, `total_price`, `created_at`, `order_date`, `Photo_url`, `status`) VALUES
(18, 'ORD-690C534AE175D', 'basta barc', 'pantaleonraiche@gmail.com', '09385869225', '0276 Esguerra St.', 'Calumpit', 'COD', 42240.00, 5760.00, 48000.00, '2025-11-05 23:50:34', '2025-11-06 07:50:34', '../AimazonAdmin/uploads/686.png', 'Pending'),
(19, 'ORD-690C54937A540', 'basta barc', 'pantaleonraiche@gmail.com', '09385869225', '0276 Esguerra St.', 'Calumpit', 'COD', 174680.00, 23820.00, 198500.00, '2025-11-05 23:56:03', '2025-11-06 07:57:35', '../AimazonAdmin/uploads/1762415763_background.jpg', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `item_name`, `qty`, `price`) VALUES
(22, 19, 'FN MINIMI Mk3', 1, 198500.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `prod_id` int(11) NOT NULL,
  `prod_title` varchar(255) NOT NULL,
  `prod_category` varchar(100) NOT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_stock` int(11) DEFAULT 0,
  `prod_desc` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT 'img/default.png',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`prod_id`, `prod_title`, `prod_category`, `prod_price`, `prod_stock`, `prod_desc`, `image_path`, `created_at`) VALUES
(6, 'Glock 17', 'Pistol', 24000.00, 20, 'Glock 17 is a 9×19mm, polymer-framed, striker-fired pistol with a standard 17-round magazine. It is renowned for its reliability, simplicity, and widespread use by law enforcement and military forces around the world.', '../AimazonUser/uploads/glck17.png', '2025-11-05 20:36:05'),
(7, 'Beretta 92FS', 'Pistol', 24600.00, 20, 'The Beretta 92/92FS is a reliable 9×19mm service pistol, typically with a 15-round magazine, known for its open-slide design and widespread military and police use.', '../AimazonUser/uploads/beretta.png', '2025-11-05 20:37:26'),
(8, 'SIG Saucer P320', 'Pistol', 23800.00, 20, 'The SIG Sauer P320 is a modular, striker-fired pistol with a serialized fire-control unit that allows swapping grip modules, slides, and calibers, and is praised for its consistent trigger, ergonomic design, and reliability.', '../AimazonUser/uploads/ssig.png', '2025-11-05 20:38:16'),
(9, 'Smith & Wesson Model 686', 'Revolver', 87200.00, 20, 'The Smith & Wesson Model 686 is an L-frame, six-shot revolver chambered in .357 Magnum (also .38 Special) with double-action/single-action operation, valued for its balance and durability for duty and range use.', '../AimazonUser/uploads/686.png', '2025-11-05 20:39:04'),
(10, 'Coly Python', 'Revolver', 88100.00, 20, 'The Colt Python is a premium double-action/single-action .357 Magnum revolver renowned for its smooth trigger, accurate barrel, and finely finished construction, popular with collectors and target shooters.', '../AimazonUser/uploads/coly.png', '2025-11-05 20:39:54'),
(12, 'Ruger LCR', 'Revolver', 87550.00, 20, 'The Ruger LCR is a lightweight, compact double-action-only revolver with a polymer/composite frame and smooth trigger, commonly chambered in .38 Special or .357 Magnum and designed for concealed carry and easy handling.', '../AimazonUser/uploads/lcr.png', '2025-11-05 20:40:39'),
(13, 'Heckler & Koch MP5', 'SMG', 150500.00, 20, 'The Heckler & Koch MP5, developed in the 1960s, is a widely used closed‑bolt, roller‑delayed blowback submachine gun prized for its accuracy and low recoil.', '../AimazonUser/uploads/mp5.png', '2025-11-05 20:41:54'),
(15, 'IMI Uzi', 'SMG', 120000.00, 20, 'The IMI Uzi is a compact, early‑1950s submachine gun featuring a telescoping bolt and magazine‑in‑grip layout, prized for its simple design, rugged reliability, and short overall length.', '../AimazonUser/uploads/uzi.png', '2025-11-05 20:42:35'),
(16, 'Thompson', 'SMG', 145200.00, 20, 'The Thompson submachine gun (1918) is an iconic .45 ACP SMG famed for Prohibition‑era use and WWII service, known for its high rate of fire and distinctive silhouette.', '../AimazonUser/uploads/thompson.png', '2025-11-05 20:43:15'),
(18, 'Remington 870', 'Shotgun', 35000.00, 20, 'The Remington 870 is a rugged, reliable pump-action shotgun commonly chambered in 12 gauge (also available in other gauges), prized for its versatility in hunting, law-enforcement, and home-defense roles.', '../AimazonUser/uploads/remington.png', '2025-11-05 20:45:26'),
(20, 'Browning Auto-5', 'Shotgun', 35800.00, 20, 'The Browning Auto-5 is a classic long-recoil semi-automatic shotgun, commonly in 12 gauge, famous for its distinctive humpback receiver and reliable performance in hunting and sport shooting.', '../AimazonUser/uploads/browning.png', '2025-11-05 20:46:12'),
(21, 'Benelli M4', 'Shotgun', 35600.00, 20, 'Benelli is an Italian shotgun maker best known for reliable 12-gauge semi-automatic designs—using inertia-driven and ARGO gas systems—highlighted by the M4; tube capacities commonly range from 3–8 rounds and models are popular for tactical, hunting, and competition use.', '../AimazonUser/uploads/benelli.png', '2025-11-05 20:47:43'),
(25, 'M250', 'LMG', 199000.00, 20, 'The M250 is a U.S. Army Next‑Generation Squad Weapon-era lightweight, gas‑operated, belt‑fed machine gun chambered in 6.8×51mm SIG Fury, adopted to replace the M249 SAW for improved range and lethality.', '../AimazonUser/uploads/m250.png', '2025-11-05 20:52:12'),
(27, 'FN MINIMI Mk3', 'LMG', 198500.00, 19, 'The FN MINIMI Mk3 is a modern light machine gun in 5.56×45mm and 7.62×51mm with ergonomic and mobility upgrades over earlier MINIMI variants, widely used worldwide.', '../AimazonUser/uploads/mk3.png', '2025-11-05 20:53:01'),
(28, 'IWI Negev NG7', 'LMG', 200900.00, 20, 'The IWI Negev NG7 is an Israeli 7.62×51mm light machine gun—an upscaled Negev designed for versatile use on bipod (LMG role) or tripod (sustained‑fire), prized for its compactness and adaptability.', '../AimazonUser/uploads/iwi.png', '2025-11-05 20:54:11'),
(33, 'Tear Gas', 'Loadout', 4850.00, 20, 'Tear gas is an aerosol or pyrotechnic chemical irritant that causes intense eye and respiratory irritation to disperse crowds, is used by police and military for riot control, and can be dangerous with prolonged or concentrated exposure and is legally restricted in many jurisdictions.', '../AimazonUser/uploads/teargas.png', '2025-11-05 20:58:24'),
(34, 'First Aid Kit', 'Loadout', 10900.00, 20, 'The First Aid Kit is a personal soldier’s pouch containing tourniquets, bandages, and other medical supplies for rapid, one‑handed treatment of life-threatening injuries in the field.', '../AimazonUser/uploads/fak.png', '2025-11-05 20:59:02'),
(35, 'Night Vision Goggles', 'Loadout', 9990.00, 20, 'Night Vision Goggles (NVG) are helmet-mounted devices that allow soldiers to see in low-light or darkness, providing a tactical advantage during nighttime operations.', '../AimazonUser/uploads/googles.png', '2025-11-05 20:59:40'),
(37, 'eickhorn 4000', 'Melee', 13927.00, 20, 'Tanto-style blade (designed for strong tip penetration) made of stainless steel type 1.4110. Weight: Approx. 330 g (≈0.73 lb) for the knife alone.', '../AimazonUser/uploads/eickhorn.png', '2025-11-06 06:40:35'),
(38, 'kukri', 'Melee', 7000.00, 20, 'Distinctive inward curve — the recurved blade concentrates force at the point of impact, making chopping and slicing more efficient than a straight blade.', '../AimazonUser/uploads/kukri.png', '2025-11-06 06:47:21'),
(39, 'bowie', 'Melee', 6000.00, 20, 'Large, broad blade — usually long (commonly 8–15+ in / 20–38+ cm) with a wide cutting surface for chopping and slicing.', '../AimazonUser/uploads/bowie.png', '2025-11-06 06:55:07'),
(40, 'Fairbairn–Sykes Fighting Knife', 'Melee', 11750.00, 20, 'Double-edged, dagger-style blade — long, narrow, symmetrical edges optimized for thrusting. ', '../AimazonUser/uploads/fairbairn.png', '2025-11-06 07:00:55'),
(41, 'KA-BAR Fighting Utility Knife', 'Melee', 10000.00, 20, 'Blade: 7\" (≈178 mm) clip-point blade (classic KA-BAR profile) made of 1095 Cro-Van carbon steel (robust, easy to sharpen).', '../AimazonUser/uploads/kabar.png', '2025-11-06 07:05:31'),
(42, 'FN SCAR', 'Rifle', 205000.00, 20, 'Semi-Automatic Precision Rifle / Designated Marksman Rifle (DMR). Designed for engaging targets accurately at long ranges (up to and beyond 1,000 yards/meters).', '../AimazonUser/uploads/fnscar.png', '2025-11-06 07:18:40'),
(43, 'AK-47', 'Rifle', 100000.00, 20, 'long-stroke piston and generous tolerances/clearances) allows the rifle to shrug off dirt, mud, sand, snow, and corrosion.', '../AimazonUser/uploads/ak47.png', '2025-11-06 07:24:18'),
(44, 'Remington 700', 'Rifle', 150000.00, 20, 'Heavy target barrels (26 inches), premium synthetic stocks.Dedicated long-range target shooting and competition.', '../AimazonUser/uploads/remington700.png', '2025-11-06 07:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `reports_log`
--

CREATE TABLE `reports_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` int(11) NOT NULL,
  `report_type` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `message` text DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('pending','replied','admin_replied','responded') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports_log`
--

INSERT INTO `reports_log` (`id`, `user_id`, `product_name`, `report_type`, `start_date`, `end_date`, `message`, `email`, `status`, `created_at`) VALUES
(13, 7, 0, NULL, NULL, NULL, 'basta', 'pantaleonraiche@gmail.com', 'replied', '2025-11-05 22:51:45'),
(14, 7, 0, NULL, NULL, NULL, 'tangina ang pangit ng bala baliko', 'pantaleonraiche@gmail.com', 'replied', '2025-11-05 22:52:48'),
(15, 7, 0, NULL, NULL, NULL, 'Panget ng item', 'pantaleonraiche@gmail.com', 'replied', '2025-11-06 07:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `report_chats`
--

CREATE TABLE `report_chats` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `sender` enum('admin','user') NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `verification_code` int(6) DEFAULT NULL,
  `profile` varchar(255) DEFAULT 'default.png',
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `first_name`, `last_name`, `email`, `username`, `password`, `contact_number`, `address`, `verification_code`, `profile`, `role`, `created_at`) VALUES
(3, 'John Arthur', 'Tuliao', 'Tuliaojohnarthur097@gmail.com', 'arthur', '123456', '9385869225', '0276 Esguerra St.', 938042, '1762128784_fak.png', 'user', '2025-11-02 22:55:33'),
(5, 'Reden', 'Barcelo', 'zensensei15@gmail.com', 'Reden', 'reden', '9385869225', '0276 Esguerra St.', 761748, NULL, 'user', '2025-11-05 21:37:47'),
(7, 'basta', 'barc', 'pantaleonraiche@gmail.com', 'basta', 'reden', '9385869225', '0276 Esguerra St.', 256431, '1762415875_686.png', 'user', '2025-11-05 21:41:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `best_sellers`
--
ALTER TABLE `best_sellers`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `reports_log`
--
ALTER TABLE `reports_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_chats`
--
ALTER TABLE `report_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `best_sellers`
--
ALTER TABLE `best_sellers`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `reports_log`
--
ALTER TABLE `reports_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `report_chats`
--
ALTER TABLE `report_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
