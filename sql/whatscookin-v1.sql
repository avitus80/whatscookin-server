-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 17, 2018 at 04:38 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whatscookin`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `category_image_link` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_image_link`) VALUES
(1, 'dairy', 'images/dairy.jpg'),
(2, 'vegetable', 'images/vegetable.jpg'),
(3, 'fruit', 'images/fruit.jpg'),
(4, 'meat', 'images/meat.jpg'),
(5, 'seafood', 'images/seafood.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category_ingredient`
--

CREATE TABLE `category_ingredient` (
  `category_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_ingredient`
--

INSERT INTO `category_ingredient` (`category_id`, `ingredient_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 27),
(1, 28),
(1, 29),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(4, 18),
(4, 19),
(4, 20),
(5, 21),
(5, 22),
(5, 23),
(5, 24),
(5, 25),
(5, 26);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_id` int(11) NOT NULL,
  `ingredient_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredient_id`, `ingredient_name`) VALUES
(1, 'Egg'),
(2, 'Milk'),
(3, 'Flour'),
(4, 'Butter'),
(5, 'Cheese'),
(6, 'Cream'),
(7, 'Yogurt'),
(8, 'Custard'),
(9, 'Brocolli'),
(10, 'Carrot'),
(11, 'Tomato'),
(12, 'Potato'),
(13, 'Apple'),
(14, 'Orange'),
(15, 'Banana'),
(16, 'Strawberry'),
(17, 'Coconut'),
(18, 'Chicken'),
(19, 'Beef'),
(20, 'Lamb'),
(21, 'Tuna'),
(22, 'Salmon'),
(23, 'Shrimp'),
(24, 'Crab'),
(25, 'Prawn'),
(26, 'Scallop'),
(27, 'Sugar'),
(28, 'Oil'),
(29, 'Bread');

-- --------------------------------------------------------

--
-- Table structure for table `measurements`
--

CREATE TABLE `measurements` (
  `measurement_id` int(11) NOT NULL,
  `measurement_unit` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `measurements`
--

INSERT INTO `measurements` (`measurement_id`, `measurement_unit`) VALUES
(1, 'cup'),
(2, 'g'),
(3, 'tablespoon'),
(4, 'teaspoon');

-- --------------------------------------------------------

--
-- Table structure for table `methods`
--

CREATE TABLE `methods` (
  `recipe_id` int(11) NOT NULL,
  `method_step` int(11) NOT NULL,
  `method` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `methods`
--

INSERT INTO `methods` (`recipe_id`, `method_step`, `method`) VALUES
(1, 1, 'Whisk milk and egg together in a jug.'),
(1, 2, 'Sift flour into a bowl. Stir in sugar. Make a well in centre. Add milk mixture. Whisk until just combined.'),
(1, 3, 'Heat a large non-stick frying pan over medium heat. Brush pan with butter. Using 1/4 cup mixture per pancake, cook 2 pancakes for 3 to 4 minutes or until bubbles appear on surface. Turn and cook for 3 minutes or until cooked through.'),
(1, 4, 'Transfer to a plate. Cover loosely with foil to keep warm. Repeat with remaining mixture, brushing pan with butter between batches. Serve.'),
(2, 1, 'Preheat waffle iron. Beat eggs in large bowl with hand beater until fluffy. Beat in flour, milk, oil and sugar, just until smooth.'),
(2, 2, 'Spray preheated waffle iron with non-stick cooking spray. Pour mix onto hot waffle iron. Cook until golden brown. Serve hot.'),
(3, 1, 'Using a 6.5cm round cutter, cut 1 round from the centre of each bread slice. Discard rounds. Spread both sides of bread slices with butter.'),
(3, 2, 'Heat a non-stick frying pan over medium heat. Cook 1 side of bread slices for 2 to 3 minutes or until lightly toasted. Turn. Crack 1 egg into each hole. Cook for 5 to 6 minutes or until egg whites are set and yolks still soft. Serve.');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int(11) NOT NULL,
  `recipe_name` varchar(30) NOT NULL,
  `recipe_description` varchar(200) NOT NULL,
  `recipe_creator` varchar(20) NOT NULL,
  `recipe_image_small` varchar(150) NOT NULL,
  `recipe_image_full` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `recipe_name`, `recipe_description`, `recipe_creator`, `recipe_image_small`, `recipe_image_full`) VALUES
(1, 'Simple Pancake', 'This simple and delicious pancake is the perfect breakfast for any given day!', 'Super Food Ideas', 'images/pancake.jpg', 'images/pancake-full.jpg'),
(2, 'Tasty Waffles', 'Super crispy on the outside but very soft in the inside, this waffles is an excellent breakfast for the weekends.', 'allrecipes', 'images/waffles.jpg', 'images/waffles-full.jpg'),
(3, 'Toasty eggs', 'The kids will love these gooey eggs hidden inside their breakfast toast.', 'Super Food Ideas', 'images/toasty-eggs.jpg', 'images/toasty-eggs-full.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredient`
--

CREATE TABLE `recipe_ingredient` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `measurement_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipe_ingredient`
--

INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `measurement_id`) VALUES
(1, 1, '1', NULL),
(1, 2, '1 1/2', 1),
(1, 3, '2', 1),
(1, 4, '1', 2),
(1, 27, '1/3', 1),
(2, 1, '2', NULL),
(2, 2, '1 3/4', 1),
(2, 3, '2', 1),
(2, 27, '1', 3),
(2, 28, '1/2', 1),
(3, 1, '4', NULL),
(3, 4, '1', 3),
(3, 29, '4', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `category_ingredient`
--
ALTER TABLE `category_ingredient`
  ADD PRIMARY KEY (`category_id`,`ingredient_id`),
  ADD KEY `category_ingredient_ibfk_2` (`ingredient_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indexes for table `measurements`
--
ALTER TABLE `measurements`
  ADD PRIMARY KEY (`measurement_id`);

--
-- Indexes for table `methods`
--
ALTER TABLE `methods`
  ADD PRIMARY KEY (`recipe_id`,`method_step`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Indexes for table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD PRIMARY KEY (`recipe_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `measurement_id` (`measurement_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `measurements`
--
ALTER TABLE `measurements`
  MODIFY `measurement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_ingredient`
--
ALTER TABLE `category_ingredient`
  ADD CONSTRAINT `category_ingredient_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `methods`
--
ALTER TABLE `methods`
  ADD CONSTRAINT `methods_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD CONSTRAINT `recipe_ingredient_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recipe_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recipe_ingredient_ibfk_3` FOREIGN KEY (`measurement_id`) REFERENCES `measurements` (`measurement_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
