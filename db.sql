-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2019 at 10:48 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invade`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `address` varchar(400) NOT NULL,
  `address_line2` varchar(400) NOT NULL,
  `city` varchar(100) NOT NULL,
  `msisdn` varchar(18) NOT NULL,
  `country_type` varchar(40) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `is_default` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `fname`, `lname`, `address`, `address_line2`, `city`, `msisdn`, `country_type`, `country`, `state`, `postal_code`, `is_default`, `user_id`, `date_created`, `date_updated`) VALUES
(1, 'Dolor', 'Sit', '5, Lorem Isum Way, Dolor Street, Off Sit Close, Amet, Lagos. Amet Lagos Nigeria', '', 'Amet', '08128765432', 'nigeria', 'nigeria', 'lagos', '23401', 0, 2, '2019-05-15 20:22:36', '0000-00-00 00:00:00'),
(2, 'Dolor', 'Sit', '5, Lorem Isum Way, Dolor Street, Off Sit Close, Amet, Lagos. Amet Lagos Nigeria', '', 'Amet', '08128765432', 'african', 'Botswana', 'Ringo', '23401', 0, 2, '2019-05-15 20:23:55', '0000-00-00 00:00:00'),
(3, 'Dolor', 'Sit', '5, Lorem Isum Way, Dolor Street, Off Sit Close, Amet, Lagos. Amet Lagos Nigeria', '', 'Amet', '08128765432', 'nigeria', 'nigeria', 'lagos', '23401', 0, 2, '2019-05-15 21:41:28', '0000-00-00 00:00:00'),
(4, 'Dolor', 'Sit', '5, Lorem Isum Way, Dolor Street, Off Sit Close, Amet, Lagos. Amet Lagos Nigeria', '', 'Amet', '08128765432', 'others', 'Taiwan', 'Ringo', '23401', 0, 2, '2019-05-15 22:58:21', '2019-05-15 23:32:26');

-- --------------------------------------------------------

--
-- Table structure for table `authentication`
--

CREATE TABLE `authentication` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(64) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_activity` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authentication`
--

INSERT INTO `authentication` (`id`, `user_id`, `session_id`, `date_created`, `last_activity`) VALUES
(1, 1, 'A4GrnmTi0VD2AXCipy0T3Dcm4XHbW4qL4cebi3eVewzcl3BtQKosvtMkIHXXjuBA', '2019-05-06 13:07:23', '2019-05-06 13:07:23'),
(2, 1, '3397etOvW6q2eLr1MUqxUM86ObJf8gJjZ08YcrKYic5LqjF8PdopKpWsHOERybJ5', '2019-05-06 13:27:19', '2019-05-06 13:27:19'),
(3, 1, 'S81M2cIJAAlniZoUKBfFuUd39uQW8I2SlU19n93wARil5hP0QIuFWRLmOId7AYXx', '2019-05-06 13:36:19', '2019-05-06 13:36:19'),
(4, 1, 'Fv3bDc6TXIVAJZ0JI78GznQHQyFafNB9iHTNKfQqRNHTE2EVZnlVCX6KN5oQkpoi', '2019-05-06 14:54:11', '2019-05-06 15:13:49'),
(5, 1, 'dc9oHL2VQQrLiNLkbjVqqfEX8sVeT8fTNN2x4P9I4lzyYd8ysqjUUzyc14aX8VN0', '2019-05-07 21:25:28', '2019-05-07 21:25:28'),
(6, 2, '0L3QaSi3W9zJ7EXt2LKqyJLSvmTvfQoJKhKJwMmvCGVLIlPny8CMgiuHPe0x2pio', '2019-05-07 21:30:42', '2019-05-07 21:30:43'),
(7, 1, 'zLVmoAR5sTlFVxUDTE5H1JVMO1EHVXRNa4e1rwRhCoMwukQUAfzkEbSnYZFNa90n', '2019-05-07 21:31:26', '2019-05-07 21:31:26'),
(8, 1, 'tO9Nyyg4tEcB7aIIOVcbQ0TnF2bfieOcvm7zoSv7hVEeKdtrXsK7JqhCASAZ0ZgY', '2019-05-07 21:55:06', '2019-05-07 21:55:59'),
(9, 2, 'GUICBznDQQZjxYrT40mfjcXcbomMv5BDH4X5Tr09zxaNzuuFiuwlRnBVdzThYIY3', '2019-05-07 21:56:50', '2019-05-07 21:56:54'),
(10, 1, 'ezZHBfDzVA7TDvGH94PVrOmXxNZJOvsZMqOIQTlXBtlL9ml6dcBdu6562TxO4AbS', '2019-05-07 21:57:55', '2019-05-07 21:58:04'),
(11, 1, 'z6DA00WgjSUpPqRtrQy8eq85EzakDKtGRI4XQrv65zoBc3aYkh02qQDhOrw38z7L', '2019-05-07 22:02:41', '2019-05-07 22:14:00'),
(12, 1, 'avRo9bKTj9sIyvotYWMzefWeCV9ot1sXWRz1HsWjVG2H3f3jtNQY4eroeqKPDzfX', '2019-05-07 22:29:12', '2019-05-07 22:53:20'),
(13, 1, 'z4RRe1CGuELYRYO022xFxuZ4NWAq9ZUpRzFDcAO2GsqT4iMGvYCDxaeIsiaxVqlE', '2019-05-07 23:04:35', '2019-05-07 23:53:16'),
(14, 1, 'nP3GsVUIMua5ww7f28eagftDrFBsLfYrhrv8kyS8qPD1Deer5LDmYzMwMs8zgDrH', '2019-05-08 19:52:55', '2019-05-08 21:00:45'),
(15, 1, 'BCDDA0W6fT1Bk7g8Xwh2AwBo1TAENrbsXZdTkdoQUF5YyaEYTgSjCSBUvGJu3GWZ', '2019-05-08 21:52:30', '2019-05-08 22:28:08'),
(16, 1, 'rcKcYvgzxMEz9wrSeDNnb0h1B0i2noHzd4ODFudDecRXeCKBhcVHfSgrD1vQkR4E', '2019-05-08 22:42:04', '2019-05-08 22:51:02'),
(17, 1, '1MrNEvIKm4ZK7OBMzl3LKllZrkzxBfVXjoeucqD01948mG2TlcvCcuqCfs3sd3EO', '2019-05-08 23:11:38', '2019-05-08 23:18:16'),
(18, 1, 'Ss65IRh3on23diHaAbiUaeNiOpgepgm8IuahVXSePYfjGM5GATVnouSUjdIB6xZ2', '2019-05-08 23:18:50', '2019-05-09 00:09:13'),
(19, 2, 'fQoSy4PiFyHMOVmlRQ8CbEuzV2hRNclmrvRdSxI3vfiqOodKEE2dFEIBFTLjwwIA', '2019-05-09 19:34:38', '2019-05-09 19:41:21'),
(20, 1, '8spfs9Y7EetaJ5ZKk5XwlkTkUFEQgLrmBSGFu0UDjNOuPeQvAKUNO7HpHCuZCdun', '2019-05-09 19:41:39', '2019-05-09 19:42:48'),
(21, 1, 'QNbhVL9CB6rHdVJd5axeiDuvoeWEEt9DT5ENIj8TJ0TAg7XjZ0T3FRrq7CH25U9U', '2019-05-09 19:46:01', '2019-05-09 19:47:27'),
(22, 2, 'ggK7Z7OU399XTrkiV0mrfk3kQKfet01Jceu28D9kjpxHkd0GwmPhln0eQhsEBRpI', '2019-05-09 19:48:08', '2019-05-09 20:21:25'),
(23, 1, 'u86XHdMFlO4pZPnD9K6v4vJHPUl77qzmBZRPVBePDmRCtLUwvWTc1bOAzGukkU3U', '2019-05-09 20:21:50', '2019-05-09 20:22:09'),
(24, 2, 'QG2J050JSe1MrjZlEo5eIUEvltNRyzaXyA5anpgRgO9T6pnOo7bxfh5xqCl77hOZ', '2019-05-09 20:22:24', '2019-05-09 20:55:19'),
(25, 2, 'xwrRjrHkSH2Z6LrQ0IyJOzMy9L0MrtAppeTlXyGDJjD9HWq3Xcna2Z2lFyNuuILN', '2019-05-09 21:14:00', '2019-05-09 21:41:30'),
(26, 1, 'iZBtHoBpeVcinP6iPzEWqqgMontLLQCnm2CNDu7oVrsBU8qnKTy4EhZnpRBPbrzr', '2019-05-09 22:32:30', '2019-05-09 22:56:54'),
(27, 1, '0Y4YTnFB8qwx39b2ZK7FpBAxbKhwx4tH8BnJyEDUF53DstWxTd6xhthessT8Ovs3', '2019-05-09 23:07:22', '2019-05-09 23:38:16'),
(28, 1, 'ULTNlAVTtTDAzFLUZUG2xLYvq1yuB1z6AdzjUlysdDGuk3IxfbXeyCJu49ZUMp2H', '2019-05-11 10:32:27', '2019-05-11 11:24:30'),
(29, 1, 'U3IGeSMsBjEnHbqIqCYfjnTk9ge33TQ2abFQvBkR4KcXYAP3FP7ZGze2FPCahKri', '2019-05-11 12:07:47', '2019-05-11 12:45:57'),
(30, 1, 'Xwdi8Lufn4u3XUVnij2SWlhvpDKp2a4ancvZJON4tn3zhLZExcuKP5As0TfYnjcA', '2019-05-11 12:58:25', '2019-05-11 13:14:40'),
(31, 1, '1hlFlqQDq76NQKRdP0C1wAwqbcnTFh2g7LbiSex2o0DbAMXNEJGtnuCdEurTZ2om', '2019-05-11 16:57:27', '2019-05-11 17:54:28'),
(32, 1, 'fUHxtFFURNEsIkDAO4cyum5rgnUo9CdWEhlRPsXQBlwno1MQTnvIMqQZM58OCnDb', '2019-05-11 18:16:24', '2019-05-11 18:43:05'),
(33, 1, 'o3X3MYo6pQkQnpINlcrEC6NcLSrpbZuUqMN4BVoByV35oNd1r7QotPbndhreObAw', '2019-05-11 18:54:16', '2019-05-11 18:54:46'),
(34, 1, 'N6nS9FwZrmHSseLJnWADvK7abYm4hWM7OYT3USpEwCEJftHnwT58ZuJGG5QFHVzL', '2019-05-11 19:09:53', '2019-05-11 19:10:23'),
(35, 1, '446slwvrGTi0Fk4EFSi7W7Zw5RfMGrykdIjP2R3JkIpLddvahuHo7kkfAk4OhngI', '2019-05-11 19:20:45', '2019-05-11 19:22:49'),
(36, 2, 'SdeCmENslObyc8YD5tcc66rHUuBVDRAM9WBLZY0pSxjo7uyUpxqwFg8fTQGhYSZA', '2019-05-11 21:02:53', '2019-05-11 21:03:13'),
(37, 1, 'aBOjzV8fmVuWSlzPjryfFMTN2FGkCbcZf6bTL1okYWG1LdBTE18hgZTHnUe8jvnK', '2019-05-12 09:13:59', '2019-05-12 09:17:35'),
(38, 1, 'uGk3VWVG95qjhXfM1SonaRkLKxKtYVzJ45ZOEXQt4eGs7MTBBkJBQolyB6nSNhTQ', '2019-05-12 09:18:20', '2019-05-12 09:18:34'),
(39, 1, 'ePIeTlII4pbt4RdfjObSFvw2L6Gkoprh9LR3YAOqbNMVxzyrmM93NGlVJ5rJZNuc', '2019-05-12 16:58:12', '2019-05-12 17:25:31'),
(40, 1, 'yHXkczfexABpwA7bDB9Qb4FAKtU1crQPRGblBvvn0M1c2orSZxoq0OvE2tv4zC55', '2019-05-12 17:42:18', '2019-05-12 17:55:49'),
(41, 1, 'ADUcOdATpuPGjifRJ0IMJudzH4Xig6bh0lQA3Ng4K0oiH4eHjHuGLFJ3AoU32NhS', '2019-05-12 18:04:08', '2019-05-12 18:04:11'),
(42, 2, 'PkAD092zWxisKAWHgaFLhhYkk2694nJ7OMgCStpM50tc4nRirDQC26OXErXp4bMB', '2019-05-12 18:57:22', '2019-05-12 18:58:46'),
(43, 2, 'bwIGOOmZ9AiPhvFIvKyfTci6QCcVmNHbiK84FLKAo60aMMj9pPQEOyLo8nhIRcAq', '2019-05-12 19:22:47', '2019-05-12 19:42:39'),
(44, 2, 'OeEkaENOT1hPBFlT4ryM4HTVQxUjleoRnAzvE0aF9LA0Hf0YdByhpV8Hm7A8F7lb', '2019-05-12 20:01:58', '2019-05-12 20:02:45'),
(45, 2, 'Jjj6tNjSUY0DRoITsbYSIpV964YILoW57gmxIqUUJscoFe7fE2Wa9F4L3vAkIu0H', '2019-05-12 20:19:28', '2019-05-12 20:35:53'),
(46, 2, 'J5yrnLW4iBOwwLM2S2k5hyTEBPkjM873I1BiQfXgh4X3bGQxdVLzSMcqY6DKQgfH', '2019-05-12 20:56:34', '2019-05-12 21:09:10'),
(47, 2, 'f7v0nWwONQU1qzujZeXtyn8WhvDS1YnWhPUqi7WeXBFVdQNghYuAHM0WAKBNf3bf', '2019-05-12 21:14:13', '2019-05-12 21:27:10'),
(48, 2, 'fAZkdwo8JhmpinnSgp5xvYrFnXSoADaedt5WQHZYJNVNpMGfQd7cnyGVFoMZy2gn', '2019-05-12 22:44:03', '2019-05-12 23:02:32'),
(49, 2, 'gOAvo9mHqEyd3Qc4kjZNRrn6Zkh5qomem4wwGW78os8Q09Vzv9vNmv3pdT3dWcyV', '2019-05-13 22:38:05', '2019-05-13 23:07:26'),
(50, 2, '0SuFYzUeb8HXeTUO4H6TUVQbNnhaFkg5JqcHLy3FgLyi7uJFdTR1NPgyv2itTAST', '2019-05-14 22:59:43', '2019-05-14 23:05:11'),
(51, 2, '7nZYSuI0ZFcU9TkwV1A9PzIFwTSS88YMclgD6Ocx7IPsvc5iuvnD2besdrrfqLY6', '2019-05-15 18:40:00', '2019-05-15 18:41:18'),
(52, 2, 'eKkIT2SeXYxlQkPSiZyn2wzlCqd92Q5UohCnix8joUaN17aZYrZC2mmTmAAyIjAR', '2019-05-15 19:36:41', '2019-05-15 20:07:19'),
(53, 2, 'wo1vtbYeezKOcjmoQKqqxYUpSHHi41ecDQOoFXY2YAsyp7gehZtwGyavnhAYVZSQ', '2019-05-15 20:21:35', '2019-05-15 20:23:55'),
(54, 2, 'RsYeo4YxOzx7Z1NSTFx5xTjC0MtSot75l8ekGkWTLzeYV74qnyQxn47Dg6suoJ22', '2019-05-15 21:37:26', '2019-05-15 21:56:48'),
(55, 2, 'MiWcnKEb6DqzT4HfW338TMjj9jXOAn32WjA0H7V2xqWEgLMKeSnE8SlB0QD5Bw2G', '2019-05-15 22:58:04', '2019-05-15 23:07:56'),
(56, 2, 'uhSuyuOhLXKSPQ8SGSeJzekwf07gk0Z4PiUrcoIHe0rU5X7wlj8wi60ibXzhU51e', '2019-05-15 23:19:15', '2019-05-15 23:43:07'),
(57, 1, 'KPIjPNsnvmCXhq0ltsCuum4vnAMoUCRWGLcxw2MONR1OiOWsFOCinZGrbzqRFUJE', '2019-05-16 20:38:16', '2019-05-16 20:38:28'),
(58, 1, 'EDlCX4gMw0UXiwePRc8luPhaXKieGqhfogv7tmV1WrJkF6AElwIFMSwaV1TfsBWB', '2019-05-16 20:52:37', '2019-05-16 21:13:48'),
(59, 1, '7PBzxLQSUJhcWx45p7Sw9rDjGY9V0NQZZxLwQh2qlSZh3gaGKDVfKHcxkPIGjv0a', '2019-05-16 22:13:48', '2019-05-16 22:58:45'),
(60, 1, 'Rd2mdF22uVe0tjh7SFUyDHaxpPpRvIb78Ujgxm5ZAZsvFcwaGKY5k4BW0jchEvXh', '2019-05-18 00:33:31', '2019-05-18 00:45:26'),
(61, 1, '9XTwkLmfjUAGRcabPt8RoQPNXV6vpQjz6OOzistPD49NpaKAQzMUvN1wT4pCXVCO', '2019-05-18 01:22:19', '2019-05-18 01:27:52'),
(62, 1, 'l2kOGFrdBj9TfnGdMt6CdV15doygaPZ7KJ9oFBz8rmm2BkBkDjfYixKGf838KGi2', '2019-05-18 09:34:54', '2019-05-18 09:38:04'),
(63, 1, 'QfeKKAbiFI0uezjDcLmxn2CSbgnsI0dnOsWtsOUVJDjYEdNQ8EUF7p3PJdU9uGSZ', '2019-05-18 20:05:29', '2019-05-18 20:20:49'),
(64, 1, '2SGKIiGMHyKCsCErDhSIq7eG6jAYqLdqoyCIIc2cUuQJRlGHsODO73zuDmAe7OAf', '2019-05-18 23:00:10', '2019-05-18 23:39:55'),
(65, 1, 'dZ6OgJ2jdDqY9cy5wr9HcUyuboWRLjX0XAza1lHoiWb55FtWRgBzYpoJRvbgHwFM', '2019-05-19 07:23:01', '2019-05-19 07:41:05'),
(66, 1, 'oHtI7au4kzIxW1TNWXKMoftBPkWnS9b7gKpeXbTS0lFwYvGiiZUCXmDYuMmcfeTl', '2019-05-19 17:25:15', '2019-05-19 17:43:24'),
(67, 2, 'NikkAvej0Fq2rFaaJGlOHNFBaSGemt3m8731MMOPED3vV1We7WSS18HUgvL8D5Ev', '2019-06-01 23:48:03', '2019-06-02 00:18:39'),
(68, 2, 'vHsFRJTQOi0737Y8UQq8d6OkUCjoFq2DsjlICKMyquhEBFIyNAqoz130MviDZkyf', '2019-06-02 14:24:02', '2019-06-02 14:30:32'),
(69, 2, 'E0u6Q9cdOJfGrU5a9vz3fJme8HC2sLr14LkwI3gn8PFwyaxuwk2lox0QFoISQMrw', '2019-06-02 17:04:32', '2019-06-02 17:50:57'),
(70, 2, 'y6VyI7v1a74tvquzQ22gtgisvIhSzhZTwpVRrvZKY5E0Mg4YPrzQS5kekNZvnMXr', '2019-06-02 17:56:16', '2019-06-02 18:05:35'),
(71, 2, '8eURNvWvs5I1CKnRaCb5WnjhTHCbsfDcbdPwsgMMCmZXpzX0V1PBRF8ZcQRPWjIg', '2019-06-02 18:33:34', '2019-06-02 19:12:36'),
(72, 2, 'hFfsODMTq0hf3rU5IPdgZp0A3EGwHQ7guJRwxzuINNjp5zBOFGXTiZ6oAwCK0uKv', '2019-06-02 21:30:11', '2019-06-02 22:04:08'),
(73, 2, 'CDjBfUkiJ81G684fTners2KzhSz4Rf4U0wnVbMHPReaNRVilHiqiZcaqFj6GYjmY', '2019-06-02 22:10:15', '2019-06-02 22:20:35'),
(74, 2, 'caPLDhoLjNuQBKeW15BPYlRciBT5W8j8wCMeybZoCBuPtP3Rvuqx59XLcdXHJSCI', '2019-06-02 22:51:47', '2019-06-02 22:53:25'),
(75, 2, 'ZomoQYrF3PmaQtPPCeBbPLTLxgeCHZBGhK8jfpWlsMln9cIBLqnz25IkxwfgqlBM', '2019-06-04 13:20:55', '2019-06-04 13:22:13'),
(76, 2, 'tFZkOYFk3CUQmolrlYIR0PhjxqPPS9pLPYGTXHbxsAOzQcvFnI3Tw3xVuZJMZkQ1', '2019-06-04 13:37:46', '2019-06-04 13:42:05'),
(77, 2, 'x1cSAx0vDJJh21GH2iGdfpErE75vwqHmLhHEUQepgx7W3VBpOcuvDuYCYWu9lPS0', '2019-06-04 13:47:46', '2019-06-04 14:22:19'),
(78, 2, '6C3B3sdSFzS6E2x1TYfN6K779OGqKRsP1i3RpRebXYNfDHR9wB2RcikpPx2Kc7K5', '2019-06-04 14:36:14', '2019-06-04 14:48:20'),
(79, 2, 'TfAaNrHCnnbkhLBFzVqX6jzlGUmDuoRws6xF2Em7DRYAQyp4zhisN6dUxTaHzQCJ', '2019-06-05 11:59:13', '2019-06-05 12:01:19'),
(80, 2, 'j4GBK0vcScFcVsTGPKB0FSJUdfQtZCstbcGmD9YGLahCaBOW3NfeuSAoVJ03Wf7g', '2019-06-05 12:16:21', '2019-06-05 12:22:01'),
(81, 2, 'MEggr6e0mwtOdKRMdTvFotVdYvVJyE4kBsAITmtL7rqsszTshR1V7yYgOcxYfO94', '2019-06-05 12:53:26', '2019-06-05 13:04:53'),
(82, 2, 'q7Fgz3DKp0tZ0EedZz5UXOuu9UiB4siKPfN4eNYE1urIeKcQ3fP6SRAd7bScrrKF', '2019-06-10 21:05:40', '2019-06-10 21:06:24'),
(83, 2, '9rbsJLHQjtzELDFyDuUJLjA3Q9vfcOjnr9XPbBKL0304HG6JhoUugllCgZCjwYkP', '2019-06-12 09:31:54', '2019-06-12 09:47:01'),
(84, 2, '6mFzvWEYILibfMkiPi8WU2ukawxsejD7r4KXhN4KvZTgDHk4W0SgR54ppjzrDw84', '2019-06-12 10:06:32', '2019-06-12 10:06:37'),
(85, 2, 'R0LoFQb3OVaMUDaZIvKHTMoxdq5RNQoooLz6w3xqyrf0z54myCVHOfKSgjXkVZLX', '2019-06-12 11:40:52', '2019-06-12 11:43:56'),
(86, 2, 'abmXtz98QFjE8wHoGAOGAgtaNBI35Ls9wHCcuZMrFrOqv8oXOxKFeQx0cqm2hoh8', '2019-06-12 11:59:30', '2019-06-12 12:12:57'),
(87, 2, 'cYXv3jObAvWmPFvgtvSfrNRBaVWuhrMOyLW1dwxacN8bsvSvoTE1sFwmJ1JFoIeO', '2019-06-12 12:29:39', '2019-06-12 12:35:22'),
(88, 2, 'D3BzdBICi9TRZxDKUD50JSVUPlCvid2HYAMbwVUks9Xupb9C7B0YscdpQ7SIC0gs', '2019-06-12 13:01:01', '2019-06-12 13:08:06'),
(89, 2, 'bcj03Swf4pfoPgZfpF7tjID8ZhieuZMMzc99ASZX8SCnloqarpkKyu5jBlfrrXIq', '2019-06-12 13:19:06', '2019-06-12 13:19:22'),
(90, 2, 'X4kzPgEcI01JLcWuHTRRpZaMcTYv8rO8Vqr6VEPQmaFREujoFPA0i4POVYdnbwP5', '2019-06-12 13:31:25', '2019-06-12 13:35:53'),
(91, 2, '9DPctgQHeufSSfTPL9KeITXuHDPRWBe2ZDZ2yMUuRGxLqyKZzi3ROs0vyYyvkeMk', '2019-06-12 14:15:42', '2019-06-12 14:15:50'),
(92, 2, '6OiCplOUTrHOjh5TOmdb0FNUlxWdig0PU9Vo2V3pSNxno6TkwApTGwMpth2kYvp3', '2019-06-12 15:08:40', '2019-06-12 15:26:33'),
(93, 2, 'dbucxBgfUsdRHV76n4jmL3zV3mRky0RJgt9fPslhXfPCzqHIhF8P7VBjWO76Vsel', '2019-06-12 15:27:22', '2019-06-12 15:27:40'),
(94, 2, 'nehxXVXmlKPXAQsPiYWgbvgPthT4yklE56Oasg4XgycNjVesCzL3goj0Cqd7LlXX', '2019-06-12 15:33:45', '2019-06-12 15:33:57'),
(95, 2, '2CD8k46a8RKO0IQiTgzSQ3VwC5H9efprWSHEEMTmO268U1PeXmAmL3zoIhMrHZNb', '2019-06-12 15:35:06', '2019-06-12 16:29:11'),
(96, 2, '7zI44XnIGDjjDCKy3d2DS2siBIFnnNibvvOwzT1XbEJ27gkbWSsB4CHELmp1GOIm', '2019-07-07 14:52:07', '2019-07-07 15:34:44'),
(97, 2, 'RmCZd2p69hIdE8BFJoHMEhJPgB9roSX5TEcMxM9mmIs36lsA4LwCDxpnHe1r9lbq', '2019-07-07 16:08:12', '2019-07-07 16:08:15'),
(98, 2, 'DXhHjwmlEBHxKdlMbrsF8pMnDHXpdOhcP8a6y7II3wrntvaben5qp9fzCXPLjOJp', '2019-07-07 16:23:30', '2019-07-07 16:40:17'),
(99, 2, 'LxL0LOCsnUH5a5IL9VAWxOPAKxIa8k5YF7Jg2YupgKzA2XIYqN1xVTSmMrscpmc0', '2019-07-11 22:51:59', '2019-07-11 22:52:00');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `btn_text` varchar(30) NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `title`, `description`, `link`, `btn_text`, `status`, `date_created`, `date_updated`) VALUES
(1, '/banners/6235ab0e-860f-4309-965c-43a2557496cc.jpg', 'new arrivals', 'Amazing Designs from â‚¦10,000', 'http://localhost:8080/designs/', 'SHOP NOW', 1, '2019-05-12 17:47:20', '0000-00-00 00:00:00'),
(3, '/banners/ead1bdf5-76c5-4662-8155-773d6dc35178.jpg', 'hot in demand', 'Trending Items', 'javascript:void(0)', 'SHOP HERE', 1, '2019-05-12 17:55:49', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `business_categories`
--

CREATE TABLE `business_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business_categories`
--

INSERT INTO `business_categories` (`id`, `name`, `status`, `date_created`, `date_updated`) VALUES
(2, 'Materials', 1, '2019-05-18 01:23:26', '0000-00-00 00:00:00'),
(3, 'Accessories', 1, '2019-05-18 01:23:39', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `status`, `date_created`, `date_updated`) VALUES
(2, 'Embroidery', '', 1, '2019-05-08 23:54:39', '0000-00-00 00:00:00'),
(3, 'Traditional', '', 1, '2019-05-08 23:54:47', '0000-00-00 00:00:00'),
(5, 'Senator', '', 1, '2019-05-09 00:09:13', '2019-05-11 12:36:31'),
(7, 'Female', '', 2, '2019-05-11 12:36:42', '2019-05-11 12:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(50) NOT NULL,
  `msisdn` varchar(18) NOT NULL,
  `message` varchar(300) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `msisdn`, `message`, `date_created`, `date_updated`) VALUES
(1, 'Name', 'email@email.com', '', 'Message', '2019-05-18 00:32:53', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `designers`
--

CREATE TABLE `designers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `brand_name` varchar(60) NOT NULL,
  `company_msisdn` varchar(18) NOT NULL,
  `head_office` varchar(300) NOT NULL,
  `ceo_name` varchar(100) NOT NULL,
  `business_category_id` int(11) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `designs`
--

CREATE TABLE `designs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `picture` varchar(200) NOT NULL,
  `other_pictures` varchar(1400) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `featured` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designs`
--

INSERT INTO `designs` (`id`, `name`, `description`, `picture`, `other_pictures`, `category_id`, `price`, `sale_price`, `featured`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Cool Design', 'Cool Design Description, Its very awesome', '/designs/IMG_0477.jpg', '[\"/designs/IMG_0477.jpg\"]', 2, 9000, 4500, 1, 1, '2019-05-11 18:19:34', '2019-05-11 19:21:00'),
(2, 'Cooler Design', 'Cooler Design Description', '/designs/65fba222-b625-437b-b806-9c9f0a38a326.jpg', '[\"/designs/65fba222-b625-437b-b806-9c9f0a38a326.jpg\",\"/designs/65fba222-b625-437b-b806-9c9f0a38a326.jpg\",\"/designs/65fba222-b625-437b-b806-9c9f0a38a326.jpg\"]', 3, 12000, 0, 1, 1, '2019-05-11 18:35:29', '2019-05-11 19:22:49'),
(3, 'Awesome Design', 'Awesome Design Description', '/designs/IMG_1754.jpg', '[\"/designs/IMG_1754.jpg\",\"/designs/IMG_1754.jpg\"]', 5, 8000, 0, 0, 1, '2019-05-12 09:15:30', '2019-05-12 09:18:34'),
(4, 'Nice Design', 'Nice Design Description', '/designs/d4d721f1-5a7f-4e20-848c-ac1cfc126fb4.jpg', '[\"/designs/d4d721f1-5a7f-4e20-848c-ac1cfc126fb4.jpg\",\"/designs/d4d721f1-5a7f-4e20-848c-ac1cfc126fb4.jpg\",\"/designs/d4d721f1-5a7f-4e20-848c-ac1cfc126fb4.jpg\"]', 3, 22000, 0, 0, 1, '2019-05-12 09:17:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `link` varchar(300) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `link`, `date_created`) VALUES
(1, '/images/invade.png', '2019-05-18 23:27:07'),
(2, '/images/1d678502-29c9-4b22-87ab-a1912686b66a.jpg', '2019-05-18 23:31:27'),
(3, '/images/ead1bdf5-76c5-4662-8155-773d6dc35178.jpg', '2019-05-18 23:31:39'),
(4, '/images/8732a4d4-5688-4e58-b72d-7bbd25025da0.jpg', '2019-05-18 23:32:04'),
(5, '/images/ec066e7c-6242-4ead-aba7-0025d9dfd007.jpg', '2019-05-18 23:32:24');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `picture1` varchar(100) NOT NULL,
  `picture2` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `name`, `picture1`, `picture2`, `price`, `sale_price`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 1000, 100, 1, '2019-05-09 23:07:44', '2019-05-11 10:55:03'),
(2, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 450, 200, 1, '2019-05-09 23:08:16', '2019-05-11 10:55:28'),
(3, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 2000, 0, 1, '2019-05-09 23:08:43', '2019-05-11 10:55:51'),
(4, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 5500, 0, 1, '2019-05-09 23:10:15', '2019-05-11 10:56:08'),
(5, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 999, 0, 2, '2019-05-09 23:23:03', '2019-05-11 11:23:46'),
(6, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 888, 0, 1, '2019-05-09 23:30:06', '0000-00-00 00:00:00'),
(7, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 989, 0, 1, '2019-05-09 23:32:33', '2019-05-11 11:24:03'),
(8, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 1000, 0, 1, '2019-05-11 10:40:47', '2019-05-11 10:57:03'),
(9, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 1000, 0, 2, '2019-05-11 10:42:27', '2019-05-11 11:23:40'),
(10, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 1000, 0, 1, '2019-05-11 10:43:15', '2019-05-11 10:57:41'),
(11, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 1000, 0, 1, '2019-05-11 10:44:01', '2019-05-11 12:42:01'),
(12, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 1000, 0, 1, '2019-05-11 10:44:39', '2019-05-11 12:41:45'),
(13, 'Cashmere', '/materials/thread-4058667_1920.jpg', '', 1000, 200, 1, '2019-05-11 10:45:13', '2019-05-11 11:23:26'),
(14, 'Wool', '/materials/thread-4058667_1920.jpg', '', 10000, 0, 1, '2019-05-11 10:59:08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `measurement`
--

CREATE TABLE `measurement` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_default` int(11) NOT NULL,
  `details` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measurement`
--

INSERT INTO `measurement` (`id`, `user_id`, `is_default`, `details`, `date_created`, `date_updated`) VALUES
(1, 2, 1, '{\"Neck\":\"55\",\"Waist\":\"32\",\"Sleeve\":\"14\",\"Trouser:Waist\":\"28\",\"Trouser:Width\":\"44\",\"Agbada:Width\":\"120\"}', '2019-05-09 21:16:03', '2019-05-09 21:23:35'),
(2, 2, 0, '{\"Neck\":\"\",\"Waist\":\"\",\"Sleeve\":\"\",\"Trouser:Waist\":\"\",\"Trouser:Width\":\"\",\"Agbada:Width\":\"\"}', '2019-05-09 21:16:27', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `total_cart_amount` int(11) NOT NULL,
  `design_amount` int(11) NOT NULL,
  `shipping_amount` int(11) NOT NULL,
  `express_charge` int(11) NOT NULL,
  `transaction_charge` int(11) NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `shipping_method_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_ref` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `total_cart_amount`, `design_amount`, `shipping_amount`, `express_charge`, `transaction_charge`, `shipping_address_id`, `billing_address_id`, `shipping_method_id`, `payment_id`, `order_ref`, `status`, `date_created`, `date_updated`) VALUES
(1, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 1, 'RXaWX4-5m4QlAYzwijO-f9id5m', 'CREATED', '2019-06-12 11:41:03', '0000-00-00 00:00:00'),
(2, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 2, 'dlYn5B-UaU1cp3HaMvg-26WiMm', 'CREATED', '2019-06-12 11:42:15', '0000-00-00 00:00:00'),
(3, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 3, 'Y3f961-bMK9Y2pORKrh-YrLfZm', 'CREATED', '2019-06-12 11:43:56', '0000-00-00 00:00:00'),
(4, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 4, 0, 4, '4vTiT5-JdPeLpzFBPTY-wzQzXr', 'CREATED', '2019-06-12 12:01:31', '0000-00-00 00:00:00'),
(5, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 5, 'KfQ3UZ-xixT2MxLfXSt-7w9in9', 'CREATED', '2019-06-12 12:04:11', '0000-00-00 00:00:00'),
(6, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 6, '5DXP1q-Z1qu4RMh9qM1-N7hwMw', 'CREATED', '2019-06-12 12:10:31', '0000-00-00 00:00:00'),
(7, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 7, '1o4nU3-eXeJDDpReqsT-EDupGD', 'CREATED', '2019-06-12 12:11:20', '0000-00-00 00:00:00'),
(8, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 8, 'qzhYMr-9pApfVWwlvMW-YBOQKc', 'CREATED', '2019-06-12 12:12:57', '0000-00-00 00:00:00'),
(9, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 9, 'zkQemH-Ei5g8Cix9G12-oIecAH', 'CREATED', '2019-06-12 12:30:27', '0000-00-00 00:00:00'),
(10, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 10, 'GZsDSh-ZMb4Z9BFBBAl-zVO5qB', 'CREATED', '2019-06-12 12:32:16', '0000-00-00 00:00:00'),
(11, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 11, 'IhlOch-A6TFQvHP3N5o-GxLKMT', 'CREATED', '2019-06-12 12:33:28', '0000-00-00 00:00:00'),
(12, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 12, '5hz4rp-S3FeruylZTYq-futeDC', 'CREATED', '2019-06-12 12:34:30', '0000-00-00 00:00:00'),
(13, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 13, 'V09nvg-3mJdoqYpJnTD-gPjqbT', 'CREATED', '2019-06-12 12:35:22', '0000-00-00 00:00:00'),
(14, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 14, '7bjqDI-6GGAusNKzMgq-aGaF9L', 'CREATED', '2019-06-12 13:07:19', '0000-00-00 00:00:00'),
(15, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 15, 'CTcM3i-oHMI7DcIYebQ-xTpVWe', 'CREATED', '2019-06-12 13:08:06', '0000-00-00 00:00:00'),
(16, 2, 81790, 45700, 34500, 13000, 20700, 2390, 2, 2, 0, 16, 'QPIUVk-Nm954yGaYoqH-EfYrGS', 'COMPLETED', '2019-06-12 13:19:22', '2019-06-12 15:57:31'),
(17, 2, 48093, 28388, 26500, 2500, 15900, 1305, 1, 1, 0, 17, 'atTEn3-B6aYpmSPrRlU-KBKS8t', 'CREATED', '2019-06-12 15:59:18', '0000-00-00 00:00:00'),
(18, 2, 48093, 28388, 26500, 2500, 15900, 1305, 1, 1, 0, 18, '95vMqy-9Q9dh60HcVe0-EAxsuQ', 'COMPLETED', '2019-06-12 16:03:45', '2019-06-12 16:04:05'),
(19, 2, 33970, 10000, 4500, 20000, 2700, 1270, 4, 4, 0, 19, 'rYFjfW-YTXGl7kSBU4h-gtu2Ns', 'UNCOMPLETED', '2019-06-12 16:05:08', '2019-06-12 16:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_ref` varchar(50) NOT NULL,
  `design_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `design_price` int(11) NOT NULL,
  `material_price` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `user_style` int(11) NOT NULL,
  `measurement_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `user_id`, `order_id`, `order_ref`, `design_id`, `material_id`, `design_price`, `material_price`, `status`, `user_style`, `measurement_id`, `date_created`) VALUES
(1, 2, 3, 'Y3f961-bMK9Y2pORKrh-YrLfZm', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 11:43:56'),
(2, 2, 3, 'Y3f961-bMK9Y2pORKrh-YrLfZm', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 11:43:57'),
(3, 2, 3, 'Y3f961-bMK9Y2pORKrh-YrLfZm', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 11:43:57'),
(4, 2, 4, '4vTiT5-JdPeLpzFBPTY-wzQzXr', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 12:01:31'),
(5, 2, 4, '4vTiT5-JdPeLpzFBPTY-wzQzXr', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 12:01:31'),
(6, 2, 4, '4vTiT5-JdPeLpzFBPTY-wzQzXr', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 12:01:31'),
(7, 2, 5, 'KfQ3UZ-xixT2MxLfXSt-7w9in9', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 12:04:11'),
(8, 2, 5, 'KfQ3UZ-xixT2MxLfXSt-7w9in9', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 12:04:11'),
(9, 2, 5, 'KfQ3UZ-xixT2MxLfXSt-7w9in9', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 12:04:11'),
(10, 2, 6, '5DXP1q-Z1qu4RMh9qM1-N7hwMw', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 12:10:31'),
(11, 2, 6, '5DXP1q-Z1qu4RMh9qM1-N7hwMw', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 12:10:31'),
(12, 2, 6, '5DXP1q-Z1qu4RMh9qM1-N7hwMw', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 12:10:31'),
(13, 2, 7, '1o4nU3-eXeJDDpReqsT-EDupGD', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 12:11:20'),
(14, 2, 7, '1o4nU3-eXeJDDpReqsT-EDupGD', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 12:11:20'),
(15, 2, 7, '1o4nU3-eXeJDDpReqsT-EDupGD', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 12:11:20'),
(16, 2, 8, 'qzhYMr-9pApfVWwlvMW-YBOQKc', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 12:12:57'),
(17, 2, 8, 'qzhYMr-9pApfVWwlvMW-YBOQKc', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 12:12:57'),
(18, 2, 8, 'qzhYMr-9pApfVWwlvMW-YBOQKc', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 12:12:57'),
(19, 2, 9, 'zkQemH-Ei5g8Cix9G12-oIecAH', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 12:30:27'),
(20, 2, 9, 'zkQemH-Ei5g8Cix9G12-oIecAH', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 12:30:27'),
(21, 2, 9, 'zkQemH-Ei5g8Cix9G12-oIecAH', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 12:30:27'),
(22, 2, 10, 'GZsDSh-ZMb4Z9BFBBAl-zVO5qB', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 12:32:16'),
(23, 2, 10, 'GZsDSh-ZMb4Z9BFBBAl-zVO5qB', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 12:32:17'),
(24, 2, 10, 'GZsDSh-ZMb4Z9BFBBAl-zVO5qB', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 12:32:17'),
(25, 2, 11, 'IhlOch-A6TFQvHP3N5o-GxLKMT', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 12:33:28'),
(26, 2, 11, 'IhlOch-A6TFQvHP3N5o-GxLKMT', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 12:33:29'),
(27, 2, 11, 'IhlOch-A6TFQvHP3N5o-GxLKMT', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 12:33:29'),
(28, 2, 12, '5hz4rp-S3FeruylZTYq-futeDC', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 12:34:30'),
(29, 2, 12, '5hz4rp-S3FeruylZTYq-futeDC', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 12:34:30'),
(30, 2, 12, '5hz4rp-S3FeruylZTYq-futeDC', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 12:34:30'),
(31, 2, 13, 'V09nvg-3mJdoqYpJnTD-gPjqbT', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 12:35:22'),
(32, 2, 13, 'V09nvg-3mJdoqYpJnTD-gPjqbT', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 12:35:22'),
(33, 2, 13, 'V09nvg-3mJdoqYpJnTD-gPjqbT', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 12:35:22'),
(34, 2, 14, '7bjqDI-6GGAusNKzMgq-aGaF9L', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 13:07:19'),
(35, 2, 14, '7bjqDI-6GGAusNKzMgq-aGaF9L', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 13:07:19'),
(36, 2, 14, '7bjqDI-6GGAusNKzMgq-aGaF9L', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 13:07:20'),
(37, 2, 15, 'CTcM3i-oHMI7DcIYebQ-xTpVWe', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 13:08:06'),
(38, 2, 15, 'CTcM3i-oHMI7DcIYebQ-xTpVWe', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 13:08:06'),
(39, 2, 15, 'CTcM3i-oHMI7DcIYebQ-xTpVWe', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 13:08:06'),
(40, 2, 16, 'QPIUVk-Nm954yGaYoqH-EfYrGS', 4, 11, 22000, 1000, 'CREATED', 0, 1, '2019-06-12 13:19:22'),
(41, 2, 16, 'QPIUVk-Nm954yGaYoqH-EfYrGS', 3, 14, 8000, 10000, 'CREATED', 0, 1, '2019-06-12 13:19:22'),
(42, 2, 16, 'QPIUVk-Nm954yGaYoqH-EfYrGS', 1, 2, 4500, 200, 'CREATED', 0, 1, '2019-06-12 13:19:22'),
(43, 2, 17, 'atTEn3-B6aYpmSPrRlU-KBKS8t', 4, 6, 22000, 888, 'CREATED', 0, 1, '2019-06-12 15:59:18'),
(44, 2, 17, 'atTEn3-B6aYpmSPrRlU-KBKS8t', 1, 10, 4500, 1000, 'CREATED', 0, 1, '2019-06-12 15:59:18'),
(45, 2, 18, '95vMqy-9Q9dh60HcVe0-EAxsuQ', 4, 6, 22000, 888, 'CREATED', 0, 1, '2019-06-12 16:03:45'),
(46, 2, 18, '95vMqy-9Q9dh60HcVe0-EAxsuQ', 1, 10, 4500, 1000, 'CREATED', 0, 1, '2019-06-12 16:03:45'),
(47, 2, 19, 'rYFjfW-YTXGl7kSBU4h-gtu2Ns', 1, 4, 4500, 5500, 'CREATED', 0, 1, '2019-06-12 16:05:08');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `app_default` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `link`, `title`, `content`, `app_default`, `date_created`, `date_updated`) VALUES
(1, '/aboutus', 'About Us', '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Alegreya Sans&quot;, sans-serif; font-size: 13.66px; letter-spacing: 0.5px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima, ipsam ab. Et commodi deserunt, laborum autem earum perferendis molestiae sit quae quam consectetur excepturi accusamus perspiciatis praesentium quos, modi nihil! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima, ipsam ab. Et commodi deserunt, laborum autem earum perferendis molestiae sit quae quam consectetur excepturi accusamus perspiciatis praesentium quos, modi nihil!</span></p><p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Alegreya Sans&quot;, sans-serif; font-size: 13.66px; letter-spacing: 0.5px; text-align: justify;\"><br></span></p><p><img src=\"http://localhost:8080/images/invade.png\" style=\"width: 323.991px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Alegreya Sans&quot;, sans-serif; font-size: 13.66px; letter-spacing: 0.5px; text-align: justify;\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Alegreya Sans&quot;, sans-serif; font-size: 13.66px; letter-spacing: 0.5px; text-align: justify;\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Alegreya Sans&quot;, sans-serif; font-size: 13.66px; letter-spacing: 0.5px; text-align: justify;\"><b>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima, ipsam ab. Et commodi deserunt, laborum autem earum perferendis molestiae sit quae quam consectetur excepturi accusamus perspiciatis praesentium quos, modi nihil! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima, ipsam ab. Et commodi deserunt, laborum autem earum perferendis molestiae sit quae quam consectetur excepturi accusamus perspiciatis praesentium quos, modi nihil!</b></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Alegreya Sans&quot;, sans-serif; font-size: 13.66px; letter-spacing: 0.5px; text-align: justify;\"><br></span><br></p><p></p>', 1, '2019-05-18 23:01:42', '2019-05-18 23:38:58'),
(2, '/tandc', 'Terms and Conditions', '<p><b>Lorem Ipsum Dolor Sit Amet</b></p><p style=\"\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima aut suscipit, et expedita libero cumque nam saepe aliquam sint eaque repellat iure placeat at molestiae non, dignissimos inventore nostrum eius. Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima aut suscipit, et expedita libero cumque nam saepe aliquam sint eaque repellat iure placeat at molestiae non, dignissimos inventore nostrum eius.</p><p style=\"\"><br></p><p style=\"font-size: 16px;\"><span style=\"font-weight: bolder;\">Lorem Ipsum Dolor Sit Amet</span></p><p style=\"font-size: 16px;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima aut suscipit, et expedita libero cumque nam saepe aliquam sint eaque repellat iure placeat at molestiae non, dignissimos inventore nostrum eius. Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima aut suscipit, et expedita libero cumque nam saepe aliquam sint eaque repellat iure placeat at molestiae non, dignissimos inventore nostrum eius.</p><p style=\"font-size: 16px;\"><br></p><p style=\"font-size: 16px;\"><span style=\"font-weight: bolder;\">Lorem Ipsum Dolor Sit Amet</span></p><p style=\"font-size: 16px;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima aut suscipit, et expedita libero cumque nam saepe aliquam sint eaque repellat iure placeat at molestiae non, dignissimos inventore nostrum eius. Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima aut suscipit, et expedita libero cumque nam saepe aliquam sint eaque repellat iure placeat at molestiae non, dignissimos inventore nostrum eius.</p><p style=\"font-size: 16px;\"><br></p><p style=\"font-size: 16px;\"><span style=\"font-weight: bolder;\">Lorem Ipsum Dolor Sit Amet</span></p><p style=\"font-size: 16px;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima aut suscipit, et expedita libero cumque nam saepe aliquam sint eaque repellat iure placeat at molestiae non, dignissimos inventore nostrum eius. Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima aut suscipit, et expedita libero cumque nam saepe aliquam sint eaque repellat iure placeat at molestiae non, dignissimos inventore nostrum eius.</p><p style=\"font-size: 16px;\"><br></p><p style=\"font-size: 16px;\"><span style=\"font-weight: bolder;\">Lorem Ipsum Dolor Sit Amet</span></p><p style=\"font-size: 16px;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima aut suscipit, et expedita libero cumque nam saepe aliquam sint eaque repellat iure placeat at molestiae non, dignissimos inventore nostrum eius. Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima aut suscipit, et expedita libero cumque nam saepe aliquam sint eaque repellat iure placeat at molestiae non, dignissimos inventore nostrum eius.</p><p style=\"font-size: 16px;\"><br></p><p style=\"font-size: 16px;\"><span style=\"font-weight: bolder;\">Lorem Ipsum Dolor Sit Amet</span></p><p style=\"font-size: 16px;\">Lorem ipsum dolor sit amet consectetur ', 1, '2019-05-19 07:26:47', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `method` varchar(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `charge` int(11) NOT NULL,
  `request_id` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `payment_reference` varchar(50) NOT NULL,
  `payment_response` varchar(20000) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `method`, `amount`, `charge`, `request_id`, `status`, `payment_reference`, `payment_response`, `date_created`, `date_updated`) VALUES
(1, 2, 'PAYSTACK', 81790, 2390, 'dgANxl-uLwqQ77kwBVk-e8y6v2', 'PENDING', '', '', '2019-06-12 11:41:03', '0000-00-00 00:00:00'),
(2, 2, 'PAYSTACK', 81790, 2390, 'MIWWKT-KUTjVhsiVhBj-s2JUlW', 'PENDING', '', '', '2019-06-12 11:42:15', '0000-00-00 00:00:00'),
(3, 2, 'PAYSTACK', 81790, 2390, 'Yp4Txl-S0uGJNkHsLAk-Hcr8ie', 'PENDING', '', '', '2019-06-12 11:43:56', '0000-00-00 00:00:00'),
(4, 2, 'PAYSTACK', 81790, 2390, '23gjK9-JkIiJsJAq1aA-Tqq0M4', 'PENDING', '', '', '2019-06-12 12:01:31', '0000-00-00 00:00:00'),
(5, 2, 'PAYSTACK', 81790, 2390, '6E0BMC-TPFlkTewfsWE-l2mpkD', 'PENDING', '', '', '2019-06-12 12:04:11', '0000-00-00 00:00:00'),
(6, 2, 'PAYSTACK', 81790, 2390, 'lWadSi-pVTBC6FR0UJd-2Yz6vy', 'PENDING', '', '', '2019-06-12 12:10:30', '0000-00-00 00:00:00'),
(7, 2, 'PAYSTACK', 81790, 2390, '029yIE-nSWTSKuXF71E-8LHc12', 'PENDING', '', '', '2019-06-12 12:11:20', '0000-00-00 00:00:00'),
(8, 2, 'PAYSTACK', 81790, 2390, 'nKyqhB-XpNMeK2V5Mq6-VWPZNO', 'PENDING', '', '', '2019-06-12 12:12:57', '0000-00-00 00:00:00'),
(9, 2, 'PAYSTACK', 81790, 2390, 'NxrU1k-O0P0MxxXzWVv-PoZ3eD', 'PENDING', '', '', '2019-06-12 12:30:27', '0000-00-00 00:00:00'),
(10, 2, 'PAYSTACK', 81790, 2390, '8FkdEc-7RAWv0ezyahE-jagsCj', 'PENDING', '', '', '2019-06-12 12:32:16', '0000-00-00 00:00:00'),
(11, 2, 'PAYSTACK', 81790, 2390, '20ADlv-ieNJXHUy3moa-haXSJa', 'PENDING', '', '', '2019-06-12 12:33:28', '0000-00-00 00:00:00'),
(12, 2, 'PAYSTACK', 81790, 2390, '0WamFY-EEj547vvNTb5-fv5tar', 'SUCCESS', '', '{\"id\":194034654,\"domain\":\"test\",\"status\":\"success\",\"reference\":\"0WamFY-EEj547vvNTb5-fv5tar\",\"amount\":10000,\"message\":\"test-3ds\",\"gateway_response\":\"[Test] Approved\",\"paid_at\":\"2019-06-12T11:35:08.000Z\",\"created_at\":\"2019-06-12T11:34:37.000Z\",\"channel\":\"card\",\"currency\":\"NGN\",\"ip_address\":\"105.112.38.222\",\"metadata\":{\"custom_fields\":[{\"display_name\":\"Mobile Number\",\"variable_name\":\"mobile_number\",\"value\":\"+2348012345678\"}],\"referrer\":\"http://localhost:8080/cart/payment\"},\"log\":{\"start_time\":1560339273,\"time_spent\":32,\"attempts\":3,\"authentication\":\"3DS\",\"errors\":2,\"success\":true,\"mobile\":false,\"input\":[],\"history\":[{\"type\":\"action\",\"message\":\"Attempted to pay with card\",\"time\":10},{\"type\":\"error\",\"message\":\"Error: Declined\",\"time\":10},{\"type\":\"action\",\"message\":\"Attempted to pay with card\",\"time\":22},{\"type\":\"error\",\"message\":\"Error: Declined\",\"time\":23},{\"type\":\"action\",\"message\":\"Attempted to pay with card\",\"time\":29},{\"type\":\"auth\",\"message\":\"Authentication Required: 3DS\",\"time\":30},{\"type\":\"success\",\"message\":\"Successfully paid with card\",\"time\":32}]},\"fees\":150,\"fees_split\":null,\"authorization\":{\"authorization_code\":\"AUTH_kgcohkia8u\",\"bin\":\"408408\",\"last4\":\"0409\",\"exp_month\":\"12\",\"exp_year\":\"2020\",\"channel\":\"card\",\"card_type\":\"visa DEBIT\",\"bank\":\"Test Bank\",\"country_code\":\"NG\",\"brand\":\"visa\",\"reusable\":true,\"signature\":\"SIG_2C13TOg4TB7m40ECWuM9\"},\"customer\":{\"id\":9194630,\"first_name\":\"\",\"last_name\":\"\",\"email\":\"customer@email.com\",\"customer_code\":\"CUS_2rzi69ngl6cux4o\",\"phone\":\"\",\"metadata\":null,\"risk_action\":\"deny\"},\"plan\":null,\"order_id\":null,\"paidAt\":\"2019-06-12T11:35:08.000Z\",\"createdAt\":\"2019-06-12T11:34:37.000Z\",\"transaction_date\":\"2019-06-12T11:34:37.000Z\",\"plan_object\":[],\"subaccount\":[]}', '2019-06-12 12:34:30', '2019-06-12 15:10:16'),
(13, 2, 'PAYSTACK', 81790, 2390, 'NV9Epq-FsGpN9NdrjGc-Sh2ng6', 'FAILED', '', '{\"id\":194034992,\"domain\":\"test\",\"status\":\"failed\",\"reference\":\"NV9Epq-FsGpN9NdrjGc-Sh2ng6\",\"amount\":10000,\"message\":null,\"gateway_response\":\"Declined\",\"paid_at\":null,\"created_at\":\"2019-06-12T11:35:29.000Z\",\"channel\":\"card\",\"currency\":\"NGN\",\"ip_address\":\"105.112.38.222\",\"metadata\":{\"custom_fields\":[{\"display_name\":\"Mobile Number\",\"variable_name\":\"mobile_number\",\"value\":\"+2348012345678\"}],\"referrer\":\"http://localhost:8080/cart/payment\"},\"log\":{\"start_time\":1560339597,\"time_spent\":12,\"attempts\":1,\"errors\":1,\"success\":false,\"mobile\":false,\"input\":[],\"history\":[{\"type\":\"action\",\"message\":\"Set payment method to: bank\",\"time\":3},{\"type\":\"action\",\"message\":\"Set payment method to: card\",\"time\":7},{\"type\":\"action\",\"message\":\"Attempted to pay with card\",\"time\":11},{\"type\":\"error\",\"message\":\"Error: Declined\",\"time\":12}]},\"fees\":null,\"fees_split\":null,\"authorization\":{\"authorization_code\":\"AUTH_8axlxk9nf8\",\"bin\":\"408408\",\"last4\":\"5408\",\"exp_month\":\"12\",\"exp_year\":\"2020\",\"channel\":\"card\",\"card_type\":\"visa DEBIT\",\"bank\":\"Test Bank\",\"country_code\":\"NG\",\"brand\":\"visa\",\"reusable\":true,\"signature\":\"SIG_6Gt5inMbN5lvaqNMaS5k\"},\"customer\":{\"id\":9194630,\"first_name\":\"\",\"last_name\":\"\",\"email\":\"customer@email.com\",\"customer_code\":\"CUS_2rzi69ngl6cux4o\",\"phone\":\"\",\"metadata\":null,\"risk_action\":\"deny\"},\"plan\":null,\"order_id\":null,\"paidAt\":null,\"createdAt\":\"2019-06-12T11:35:29.000Z\",\"transaction_date\":\"2019-06-12T11:35:29.000Z\",\"plan_object\":[],\"subaccount\":[]}', '2019-06-12 12:35:22', '2019-06-12 15:09:55'),
(14, 2, 'PAYSTACK', 81790, 2390, 'iUkCMm-pof7xvMaiY9G-EU69Tg', 'FAILED', '', '{\"id\":194046319,\"domain\":\"test\",\"status\":\"abandoned\",\"reference\":\"iUkCMm-pof7xvMaiY9G-EU69Tg\",\"amount\":81790,\"message\":null,\"gateway_response\":\"The transaction was not completed\",\"paid_at\":null,\"created_at\":\"2019-06-12T12:07:28.000Z\",\"channel\":\"card\",\"currency\":\"NGN\",\"ip_address\":\"105.112.38.222\",\"metadata\":{\"custom_fields\":[],\"referrer\":\"http://localhost:8080/cart/payment\"},\"log\":null,\"fees\":null,\"fees_split\":null,\"authorization\":[],\"customer\":{\"id\":9195614,\"first_name\":\"\",\"last_name\":\"\",\"email\":\"lorem.ipsum@email.com\",\"customer_code\":\"CUS_676gsgvcz6r5vqi\",\"phone\":\"\",\"metadata\":null,\"risk_action\":\"default\"},\"plan\":null,\"order_id\":null,\"paidAt\":null,\"createdAt\":\"2019-06-12T12:07:28.000Z\",\"transaction_date\":\"2019-06-12T12:07:28.000Z\",\"plan_object\":[],\"subaccount\":[]}', '2019-06-12 13:07:19', '2019-06-12 15:09:37'),
(15, 2, 'PAYSTACK', 81790, 2390, 'Uy34zG-CszoOZzAN1WU-nPLstN', 'SUCCESS', '', '{\"id\":194046578,\"domain\":\"test\",\"status\":\"success\",\"reference\":\"Uy34zG-CszoOZzAN1WU-nPLstN\",\"amount\":8179000,\"message\":null,\"gateway_response\":\"Successful\",\"paid_at\":\"2019-06-12T12:12:03.000Z\",\"created_at\":\"2019-06-12T12:08:12.000Z\",\"channel\":\"card\",\"currency\":\"NGN\",\"ip_address\":\"105.112.38.222\",\"metadata\":{\"custom_fields\":[],\"referrer\":\"http://localhost:8080/cart/payment\"},\"log\":{\"start_time\":1560341509,\"time_spent\":10,\"attempts\":1,\"errors\":0,\"success\":false,\"mobile\":false,\"input\":[],\"history\":[{\"type\":\"action\",\"message\":\"Attempted to pay with card\",\"time\":10}]},\"fees\":132685,\"fees_split\":null,\"authorization\":{\"authorization_code\":\"AUTH_29kmqctabt\",\"bin\":\"408408\",\"last4\":\"4081\",\"exp_month\":\"12\",\"exp_year\":\"2020\",\"channel\":\"card\",\"card_type\":\"visa DEBIT\",\"bank\":\"Test Bank\",\"country_code\":\"NG\",\"brand\":\"visa\",\"reusable\":true,\"signature\":\"SIG_fXKZP0Bx0uLzGvVI8TgF\"},\"customer\":{\"id\":9195614,\"first_name\":\"\",\"last_name\":\"\",\"email\":\"lorem.ipsum@email.com\",\"customer_code\":\"CUS_676gsgvcz6r5vqi\",\"phone\":\"\",\"metadata\":null,\"risk_action\":\"default\"},\"plan\":null,\"order_id\":null,\"paidAt\":\"2019-06-12T12:12:03.000Z\",\"createdAt\":\"2019-06-12T12:08:12.000Z\",\"transaction_date\":\"2019-06-12T12:08:12.000Z\",\"plan_object\":[],\"subaccount\":[]}', '2019-06-12 13:08:06', '2019-06-12 15:09:17'),
(16, 2, 'PAYSTACK', 81790, 2390, 'bAc8Eq-cY6Io83AzXHC-BKabMs', 'SUCCESS', '', '{\"id\":194050221,\"domain\":\"test\",\"status\":\"success\",\"reference\":\"bAc8Eq-cY6Io83AzXHC-BKabMs\",\"amount\":8179000,\"message\":null,\"gateway_response\":\"Successful\",\"paid_at\":\"2019-06-12T12:19:38.000Z\",\"created_at\":\"2019-06-12T12:19:30.000Z\",\"channel\":\"card\",\"currency\":\"NGN\",\"ip_address\":\"105.112.38.222\",\"metadata\":{\"custom_fields\":[],\"referrer\":\"http://localhost:8080/cart/payment\"},\"log\":{\"start_time\":1560341967,\"time_spent\":8,\"attempts\":1,\"errors\":0,\"success\":true,\"mobile\":false,\"input\":[],\"history\":[{\"type\":\"action\",\"message\":\"Attempted to pay with card\",\"time\":7},{\"type\":\"success\",\"message\":\"Successfully paid with card\",\"time\":8}]},\"fees\":132685,\"fees_split\":null,\"authorization\":{\"authorization_code\":\"AUTH_a3wfpm0ayt\",\"bin\":\"408408\",\"last4\":\"4081\",\"exp_month\":\"12\",\"exp_year\":\"2020\",\"channel\":\"card\",\"card_type\":\"visa DEBIT\",\"bank\":\"Test Bank\",\"country_code\":\"NG\",\"brand\":\"visa\",\"reusable\":true,\"signature\":\"SIG_fXKZP0Bx0uLzGvVI8TgF\"},\"customer\":{\"id\":9195614,\"first_name\":\"\",\"last_name\":\"\",\"email\":\"lorem.ipsum@email.com\",\"customer_code\":\"CUS_676gsgvcz6r5vqi\",\"phone\":\"\",\"metadata\":null,\"risk_action\":\"default\"},\"plan\":null,\"order_id\":null,\"paidAt\":\"2019-06-12T12:19:38.000Z\",\"createdAt\":\"2019-06-12T12:19:30.000Z\",\"transaction_date\":\"2019-06-12T12:19:30.000Z\",\"plan_object\":[],\"subaccount\":[]}', '2019-06-12 13:19:22', '2019-06-12 15:57:31'),
(17, 2, 'PAYSTACK', 48093, 1305, 'D5tOPV-5tgfTPnQacpn-GrQ8F0', 'PENDING', '', '', '2019-06-12 15:59:18', '0000-00-00 00:00:00'),
(18, 2, 'PAYSTACK', 48093, 1305, 'MJ5Whf-MKp4MjDfCu4u-WyaZZC', 'SUCCESS', '', '{\"id\":194113584,\"domain\":\"test\",\"status\":\"success\",\"reference\":\"MJ5Whf-MKp4MjDfCu4u-WyaZZC\",\"amount\":4809300,\"message\":null,\"gateway_response\":\"Successful\",\"paid_at\":\"2019-06-12T15:04:07.000Z\",\"created_at\":\"2019-06-12T15:03:54.000Z\",\"channel\":\"card\",\"currency\":\"NGN\",\"ip_address\":\"105.112.38.222\",\"metadata\":{\"custom_fields\":[],\"referrer\":\"http://localhost:8080/cart/payment\"},\"log\":{\"start_time\":1560351830,\"time_spent\":13,\"attempts\":1,\"errors\":0,\"success\":true,\"mobile\":false,\"input\":[],\"history\":[{\"type\":\"action\",\"message\":\"Attempted to pay with card\",\"time\":12},{\"type\":\"success\",\"message\":\"Successfully paid with card\",\"time\":13}]},\"fees\":82140,\"fees_split\":null,\"authorization\":{\"authorization_code\":\"AUTH_wjmz56ixrq\",\"bin\":\"408408\",\"last4\":\"4081\",\"exp_month\":\"12\",\"exp_year\":\"2020\",\"channel\":\"card\",\"card_type\":\"visa DEBIT\",\"bank\":\"Test Bank\",\"country_code\":\"NG\",\"brand\":\"visa\",\"reusable\":true,\"signature\":\"SIG_fXKZP0Bx0uLzGvVI8TgF\"},\"customer\":{\"id\":9195614,\"first_name\":\"\",\"last_name\":\"\",\"email\":\"lorem.ipsum@email.com\",\"customer_code\":\"CUS_676gsgvcz6r5vqi\",\"phone\":\"\",\"metadata\":null,\"risk_action\":\"default\"},\"plan\":null,\"order_id\":null,\"paidAt\":\"2019-06-12T15:04:07.000Z\",\"createdAt\":\"2019-06-12T15:03:54.000Z\",\"transaction_date\":\"2019-06-12T15:03:54.000Z\",\"plan_object\":[],\"subaccount\":[]}', '2019-06-12 16:03:45', '2019-06-12 16:04:05'),
(19, 2, 'PAYSTACK', 33970, 1270, 'aYUSIb-gqnH3xKJdo0q-paK8hW', 'FAILED', '', '{\"id\":194115222,\"domain\":\"test\",\"status\":\"failed\",\"reference\":\"aYUSIb-gqnH3xKJdo0q-paK8hW\",\"amount\":3397000,\"message\":null,\"gateway_response\":\"Declined\",\"paid_at\":null,\"created_at\":\"2019-06-12T15:05:15.000Z\",\"channel\":\"card\",\"currency\":\"NGN\",\"ip_address\":\"105.112.38.222\",\"metadata\":{\"custom_fields\":[],\"referrer\":\"http://localhost:8080/cart/payment\"},\"log\":{\"start_time\":1560351911,\"time_spent\":8,\"attempts\":1,\"errors\":1,\"success\":false,\"mobile\":false,\"input\":[],\"history\":[{\"type\":\"action\",\"message\":\"Attempted to pay with card\",\"time\":6},{\"type\":\"error\",\"message\":\"Error: Declined\",\"time\":8}]},\"fees\":null,\"fees_split\":null,\"authorization\":{\"authorization_code\":\"AUTH_vxl0aiy5dw\",\"bin\":\"408408\",\"last4\":\"5408\",\"exp_month\":\"12\",\"exp_year\":\"2020\",\"channel\":\"card\",\"card_type\":\"visa DEBIT\",\"bank\":\"Test Bank\",\"country_code\":\"NG\",\"brand\":\"visa\",\"reusable\":true,\"signature\":\"SIG_6Gt5inMbN5lvaqNMaS5k\"},\"customer\":{\"id\":9195614,\"first_name\":\"\",\"last_name\":\"\",\"email\":\"lorem.ipsum@email.com\",\"customer_code\":\"CUS_676gsgvcz6r5vqi\",\"phone\":\"\",\"metadata\":null,\"risk_action\":\"default\"},\"plan\":null,\"order_id\":null,\"paidAt\":null,\"createdAt\":\"2019-06-12T15:05:15.000Z\",\"transaction_date\":\"2019-06-12T15:05:15.000Z\",\"plan_object\":[],\"subaccount\":[]}', '2019-06-12 16:05:08', '2019-06-12 16:06:36'),
(20, 2, 'PAYSTACK', 27758, 958, 'G3mTxJ-l7MNBnrgihV2-Fs74sG', 'PENDING', '', '', '2019-07-15 23:46:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `content` varchar(800) NOT NULL,
  `is_default` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `identifier`, `content`, `is_default`, `date_created`, `date_updated`) VALUES
(1, 'measurements', '[{\"name\":\"Neck\",\"status\":true},{\"name\":\"Sleeve\",\"status\":true},{\"name\":\"Trouser:Waist\",\"status\":true},{\"name\":\"Trouser:Width\",\"status\":true},{\"name\":\"Agbada:Width\",\"status\":true},{\"name\":\"Agbada:Sleeve\",\"status\":true},{\"name\":\"Waist\",\"status\":true}]', 0, '2019-05-08 20:47:37', '2019-05-11 12:33:27'),
(2, 'phone', '07088562421', 0, '2019-05-16 20:48:38', '2019-05-16 22:42:46'),
(3, 'whatsapp', '08036022641', 0, '2019-05-16 20:48:38', '2019-05-16 22:38:05'),
(4, 'email', 'info@invade.ng', 0, '2019-05-16 20:48:38', '2019-05-16 22:46:25'),
(5, 'instagram', 'https://www.instagram.com/invadeng', 0, '2019-05-16 20:48:38', '2019-05-16 22:49:25'),
(6, 'twitter', 'https://www.twitter.com/invadeng', 0, '2019-05-16 20:50:38', '2019-05-16 22:50:06'),
(7, 'facebook', 'https://www.facebook.com/invadeng', 0, '2019-05-16 20:50:38', '2019-05-16 22:49:54');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `type`, `country`, `state`, `price`, `date_created`, `date_updated`) VALUES
(1, 'non-african', '', '', 20000, '2019-05-19 09:15:00', '2019-05-19 17:39:08'),
(2, 'african', '', '', 13000, '2019-05-19 09:15:00', '2019-05-19 17:39:25'),
(3, 'nigerian', 'nigeria', 'Abia', 5000, '2019-05-19 09:15:00', '2019-05-19 17:40:21'),
(4, 'nigerian', 'nigeria', 'Adamawa', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(5, 'nigerian', 'nigeria', 'Akwa Ibom', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(6, 'nigerian', 'nigeria', 'Anambra', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(7, 'nigerian', 'nigeria', 'Bauchi', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(8, 'nigerian', 'nigeria', 'Bayelsa', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(9, 'nigerian', 'nigeria', 'Benue', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(10, 'nigerian', 'nigeria', 'Borno', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(11, 'nigerian', 'nigeria', 'Cross River', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(12, 'nigerian', 'nigeria', 'Delta', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(13, 'nigerian', 'nigeria', 'Ebonyi', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(14, 'nigerian', 'nigeria', 'Enugu', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(15, 'nigerian', 'nigeria', 'Edo', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(16, 'nigerian', 'nigeria', 'Ekiti', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(17, 'nigerian', 'nigeria', 'Gombe', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(18, 'nigerian', 'nigeria', 'Imo', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(19, 'nigerian', 'nigeria', 'Jigawa', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(20, 'nigerian', 'nigeria', 'Kaduna', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(21, 'nigerian', 'nigeria', 'Kano', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(22, 'nigerian', 'nigeria', 'Katsina', 5000, '2019-05-19 09:15:00', '0000-00-00 00:00:00'),
(23, 'nigerian', 'nigeria', 'Kebbi', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(24, 'nigerian', 'nigeria', 'Kogi', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(25, 'nigerian', 'nigeria', 'Kwara', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(26, 'nigerian', 'nigeria', 'Lagos', 2500, '2019-05-19 17:20:00', '2019-05-19 17:43:24'),
(27, 'nigerian', 'nigeria', 'Nasarawa', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(28, 'nigerian', 'nigeria', 'Niger', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(29, 'nigerian', 'nigeria', 'Ogun', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(30, 'nigerian', 'nigeria', 'Ondo', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(31, 'nigerian', 'nigeria', 'Osun', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(32, 'nigerian', 'nigeria', 'Oyo', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(33, 'nigerian', 'nigeria', 'Plateau', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(34, 'nigerian', 'nigeria', 'Rivers', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(35, 'nigerian', 'nigeria', 'Sokoto', 5000, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'nigerian', 'nigeria', 'Taraba', 5000, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'nigerian', 'nigeria', 'Yobe', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00'),
(38, 'nigerian', 'nigeria', 'Zamfara', 5000, '2019-05-19 17:20:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `msisdn` varchar(18) NOT NULL,
  `password` varchar(512) NOT NULL,
  `user_type` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `username` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `msisdn`, `password`, `user_type`, `status`, `last_login`, `username`, `date_created`, `date_updated`) VALUES
(1, 'lorem', 'Dolor', 'lorem.ipsum.dolor@email.com', '08128765432', '6e35c89ea97b0bec5308a7db5d615dcf982299a9514648bd7ea02b853e481d7e23db21ebdf9872f73f7c9736dfc7099c70efdad10badcc674d1d2de2cb919218', 1, 1, '2019-05-19 17:25:15', '', '2019-05-06 11:33:51', '0000-00-00 00:00:00'),
(2, 'Dolor', 'Sit', 'lorem.ipsum@email.com', '08128765432', '98342ac5e5af22902001bca289ac9a650ed210311cc7adb410bfd0b4e5067a8699c8d80b03f59787dabc6c1e3617e46fa58335ce6bbed78239be9ec55bfebe4e', 3, 1, '2019-07-11 22:51:59', '', '2019-05-07 21:26:26', '2019-05-12 21:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_designs`
--

CREATE TABLE `user_designs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `picture1` varchar(100) NOT NULL,
  `picture2` varchar(100) NOT NULL,
  `picture3` varchar(100) NOT NULL,
  `approved` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authentication`
--
ALTER TABLE `authentication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_categories`
--
ALTER TABLE `business_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designers`
--
ALTER TABLE `designers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designs`
--
ALTER TABLE `designs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `measurement`
--
ALTER TABLE `measurement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_designs`
--
ALTER TABLE `user_designs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `authentication`
--
ALTER TABLE `authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `business_categories`
--
ALTER TABLE `business_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designers`
--
ALTER TABLE `designers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designs`
--
ALTER TABLE `designs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `measurement`
--
ALTER TABLE `measurement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_designs`
--
ALTER TABLE `user_designs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
