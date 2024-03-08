-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2024 at 05:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipelens`
--

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `title` text NOT NULL,
  `ingredients` text NOT NULL,
  `recipe` text NOT NULL,
  `uid` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`title`, `ingredients`, `recipe`, `uid`) VALUES
('Penne alla pizzaiola', 'oil, pepper, onion, clove, tomato, cheese, basil, salt, pasta, wine, parsley', 'Heat olive oil in a large dutch oven over medium-high heat., Cook and stir onion and garlic in hot oil until onion is soft and golden, 5 to 10 minutes., Stir tomatoes, tomato paste, wine, parsley, salt, and pepper into onion mixture., Bring to a simmer., Stir tomatoes and basil into onion mixture., Bring pasta to a boil., Reduce heat to medium; simmer covered, until pasta is tender yet firm to the bite, stirring occasionally, about 11 minutes., Stir cooked penne into tomato mixture and cook 5 minutes.', 1),
('Creamy pasta primavera', 'cheese, peas, pepper, pasta, milk, carrot, butter, flour', 'Cook pasta according to package directions., Meanwhile, melt butter in large saucepan over medium heat., Add flour and cook, stirring constantly, for 2 minutes., Gradually add milk, stirring constantly, until smooth., Add cheese, salt and pepper., Cook, stirring constantly, until cheese is melted., Add peas and carrots; cook until heated through., Drain pasta; toss with sauce.', 1),
('Shrimp fried rice', 'oil, onion, rice, salt, shrimp, pepper, chicken, clove, soy_sauce, water', 'In a large skillet, heat the oil over medium-high heat., Add the onion and garlic and cook, stirring occasionally, until the onion is translucent, about 5 minutes., Add the rice and cook, stirring, until the rice is lightly toasted, about 2 minutes., Add the water, soy sauce, salt and pepper and bring to a boil., Cover and reduce the heat to low., Cook until the rice is tender and the liquid is absorbed, about 20 minutes., Stir in the shrimp and cook until the shrimp are pink, about 2 minutes.', 1),
('Easy cheesy beef fajitas', 'onion, cheese, tortilla, tomato, pepper, lettuce, salsa, chili', 'Cook meat in large skillet on medium-high heat 5 min., Or until done, stirring occasionally., Add peppers and onions; cook and stir 5 min., Or until crisp-tender., Stir in tomatoes and salsa; cook 5 min., Or until heated through, stirring occasionally., Spoon meat mixture evenly onto tortillas; top with cheese., Roll up.', 1),
('Cheese pizza', 'onion, pepper, oil, salt, pizza_dough, cheese', 'Preheat oven to 450, Roll out pizza dough on a cookie sheet., I used a pizza stone., Brush dough with olive oil., Spread mozzarella cheese over crust., Add red bell pepper and onion., Sprinkle mozzarella cheese over the pizza., Bake for 8 minutes, then remove from oven and let sit for 5-10 minutes., Enjoy !', 1),
('Pizza with caramelized onions', 'onion, pepper, oil, salt, pizza_dough, cheese', 'Preheat oven to 450 degrees f., Roll out pizza dough on a lightly floured surface to a 12-inch round., Transfer to a pizza pan., Brush dough with olive oil., Sprinkle with salt and pepper., Top with onions and cheese., Bake for 10 minutes., Remove from oven and sprinkle with green onions., Return to oven and bake for an additional 5 minutes or until crust is golden brown.', 1),
('Grilled chicken kebabs', 'pepper, oil, onion, clove, salt, chicken, cilantro, cumin, chili, paprika', 'In a large bowl, combine the first 9 ingredients., Add chicken and toss to coat., Cover and refrigerate for at least 1 hour., Thread chicken onto skewers., Grill over medium heat, turning occasionally, until chicken is cooked through, about 10 minutes.', 1),
('Quick & easy taco pizza', 'onion, cheese, tortilla, tomato, pepper, lettuce, salsa, chili', 'Preheat oven to 350f., Place tortillas on lightly greased baking sheet., Bake 5 to 8 minutes or until crisp; cool slightly., Combine salsa, onion, cheese and ground red pepper in 1-quart casserole., Microwave on high 3 to 5 minutes or until cheese has melted., Stir well., Arrange lettuce, tomato, onion, cheese mixture and red pepper over tortilla.', 1),
('Pasta with tomatoes and basil', 'oil, pepper, onion, clove, tomato, cheese, basil, salt, pasta, wine, parsley', 'Heat the olive oil in a large skillet over medium heat., Add the onion and garlic and cook until the onion is translucent, about 5 minutes., Add the tomatoes, wine, salt, pepper, and basil., Bring to a boil, then reduce heat to low and simmer for 15 minutes., Meanwhile, cook the pasta according to package directions., Drain and toss with the sauce., Top with parmesan cheese and parsley.', 10),
('Pasta with tomatoes and basil', 'oil, pepper, onion, clove, tomato, cheese, basil, salt, pasta, wine, parsley', 'Heat the olive oil in a large skillet over medium heat., Add the onion and garlic and cook until the onion is translucent, about 5 minutes., Add the tomatoes, wine, salt, pepper, and basil., Bring to a boil, then reduce heat to low and simmer for 15 minutes., Meanwhile, cook the pasta according to package directions., Drain and toss with the sauce., Top with parmesan cheese and parsley.', 11),
('Spicy roasted chicken drumsticks', 'pepper, oil, onion, clove, salt, chicken, cilantro, cumin, chili, paprika', 'Preheat oven to 425 f. line a rimmed baking sheet with foil., Add all the vegetables into a bowl., Combine all of the spices in a small bowl with the olive oil and toss to coat well., Place chicken drumsticks on the baking sheet and roast at 425 f for 20 minutes., Turn the drumsticks halfway through roasting., Continue roasting until the meat is golden and cooked through, about 10-15 minutes more., Adapted from cooking light.', 1),
('Creamy pasta primavera', 'cheese, peas, pepper, pasta, milk, carrot, butter, flour', 'Cook pasta according to package directions., Meanwhile, melt butter in large saucepan over medium heat., Add flour and cook, stirring constantly, for 2 minutes., Gradually add milk, stirring constantly, until smooth., Add cheese, salt and pepper., Cook, stirring constantly, until cheese is melted., Add peas and carrots; cook until heated through., Drain pasta; toss with sauce.', 12),
('Grilled chicken thighs', 'pepper, oil, onion, clove, salt, chicken, cilantro, cumin, chili, paprika', 'Mix all spice rub ingredients together in a small bowl and rub on the chicken thighs., Set aside for 30 minutes (longer if you do not have time)., Preheat grill to high heat and cook for 6-8 minutes per side, until juices run clear when pierced with a fork., Let rest for 5 minutes before serving.', 12),
('Creamy pasta primavera', 'cheese, peas, pepper, pasta, milk, carrot, butter, flour', 'Cook pasta according to package directions., Meanwhile, melt butter in large saucepan over medium heat., Add flour and cook, stirring constantly, for 2 minutes., Gradually add milk, stirring constantly, until smooth., Add cheese, salt and pepper., Cook, stirring constantly, until cheese is melted., Add peas and carrots; cook until heated through., Drain pasta; toss with sauce.', 14),
('Shrimp fried rice with green onions, garlic & red chili peppers', 'oil, onion, rice, salt, shrimp, pepper, chicken, clove, soy_sauce, water', 'Heat a large, heavy pot over medium-high heat., Add oil to pan and swirl to coat., Stir in green onion and garlic, and cook, stirring occasionally, until onion is golden brown, about 10 minutes., Add shrimp, bell pepper, and water (or broth)., Add rice; stir until water is absorbed, about 10 minutes., Add salt and black pepper to taste., Cover, and simmer 15 minutes., Remove pan from heat and let stand, covered, until liquid is absorbed, about 5 minutes.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(30) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `username`, `password`) VALUES
(1, '1', 'pbkdf2:sha256:260000$xaUpmgsxXUvApup5$7b9ea6766acf8f48f386bc2f59e4776445185db2e25686cb8425e07ab964f240'),
(2, '2', 'pbkdf2:sha256:260000$pmJPxJmSjdmH6uZ3$675c41ecbd95876dc7fcba5a43c9b16b737b8231a047422e85f755f109d515e0'),
(3, '3', 'pbkdf2:sha256:260000$PXBJNNFY4hXGDi9i$ba98945a41c0789a6feea4397fe6d49521d993bf11593599fc7864efe04fae44'),
(4, 'ukesh', 'pbkdf2:sha256:260000$VXvpa3hLfnaECpzV$eb2ad614937bf43854d0d5289d49740406ce492c230541839cc7c2a489046855'),
(5, 'shirish', 'pbkdf2:sha256:260000$3QSldDPsZqK1zPmj$eb5868f0a1008a674d637b85910586dc3880ef2d893ed99a20590d50cb0dbd91'),
(10, 'advanced', 'pbkdf2:sha256:260000$4fIdP5rDUS6j36Pr$895700d15c58f2027e0b6f89e2eaee63be4d55c5bc7a2427a1ad52c4f14195c7'),
(11, 'acem', 'pbkdf2:sha256:260000$Qvss8vlHlua3rtAD$33dfc9783c17f23e26af9f155e831a5b73e6cae9a3b3b63416b57cbf26e8bf78'),
(12, 'recipelens', 'pbkdf2:sha256:260000$BM3dkaBdITENmjLQ$f2795830fccc6c7f76daa768ffddb70b81c35e1b77f0d77bbaa3eabf7163e3f3'),
(14, 'acem123', 'pbkdf2:sha256:260000$abEjef0CKXQ5HYIU$0bc9645e49d5a1cf0574c7bd4658d84543ae8f926f7371638f17e03835904343');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD KEY `uid` (`uid`),
  ADD KEY `uid_2` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
