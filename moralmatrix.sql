-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2025 at 02:35 PM
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
-- Database: `moralmatrix`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `record_id` int(11) NOT NULL,
  `id_number` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_type` enum('super_admin','administrator','ccdu','faculty','student','security') NOT NULL,
  `change_pass` tinyint(1) DEFAULT 1,
  `reset_token` varchar(64) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`record_id`, `id_number`, `email`, `password`, `account_type`, `change_pass`, `reset_token`, `reset_expires`) VALUES
(1, '', 'superadmin@test.com', '$2y$10$ZAmvFGaaIvRk8Wvy.VjM3eEM6gStBhs0ODqeby4AlhHYmyuBlPEr6', 'super_admin', 0, NULL, NULL),
(2, '1111-1111', 'mainadmin@test.com', '$2y$10$FhwgAoap3CavVUvX89M3t.4hcatH8pfl.Mp8fMgZDXItaJSCH9.qS', 'administrator', 0, NULL, NULL),
(5, '7777-7777', 'mainccdu@test.com', '$2y$10$Sy3ZqVpYYa/R4VNvFv.M1.a/EGuc0jqnlmLS/JVzv.O/8IRV7TMSG', 'ccdu', 0, NULL, NULL),
(6, '4444-4444', 'mainfaculty@test.com', '$2y$10$8aodg435DmUSDazyuF3o2.NJn.yU6Rq39Rlg/XECKzZ.amHAvH6.i', 'faculty', 0, NULL, NULL),
(8, '5555-5555', 'student3@test.com', '$2y$10$hbyXXmU3xc0PdWRGnZubE.aDUbOvrkKFWUlNjhxfIcgmNwjFMRtG2', 'student', 1, NULL, NULL),
(14, '6767-0987', 'student99@test.com', '$2y$10$zoesV7qCHhPtQyKX.Oep0eyERXfkS3ehODhgFSyKbTMvn7iH6RknG', 'student', 1, NULL, NULL),
(15, '9999-9999', 'student577@test.com', '$2y$10$Tv5a9c0MRZvlbSYpLgKBMelXo3jnbbvbFGR6LSWuBW7omC52EPEy2', 'student', 1, NULL, NULL),
(16, '1212-2323', 'stdent48t5@test.com', '$2y$10$n9/Qn6SmOO0BEkqBvkTZG.FRiB9guwovztWT2Rb.rUwkjIMcDMu7a', 'student', 1, NULL, NULL),
(18, '0808-0808', 'student9845@test.com', '$2y$10$lVdCyjCMQSrRw5mRQ8XJruuHU0tOB0WS5LdxA3cRQqcSTRpbm4Iu6', 'student', 1, NULL, NULL),
(19, '8777-8777', 'mainfaculty02@test.com', '$2y$10$psx7g6wfFi9jpRJFHHT4muDVWw3.FEup6/ehM3fEKgiwhSeO0Rtra', 'faculty', 1, NULL, NULL),
(23, '8472-8649', 'mainstudent1@test.com', '$2y$10$8rYAyfkigEb/.dbnDiSvyO4R16nR0NNGnvqi1E5ZUX7TvOYjQTPIW', 'student', 0, NULL, NULL),
(24, '3444-3537', 'student5@test.com', '$2y$10$kE1y/RN.cSXGpTgcm1KKE.B159XGCU2/We3fuABGarmjt3uVMSkra', 'student', 1, NULL, NULL),
(26, '4534-4545', 'student6@test.com', '$2y$10$Lk2/pzUKn7piFSIVTWv92eIJvovhQcLF4P.z.ZrDF.JhNNzltsWe2', 'student', 1, NULL, NULL),
(27, '9854-9556', 'student7@test.com', '$2y$10$KnH3V6anj5Ojb8f0KAnjuuu6ZoRN.81t2CwAFB99Cn5vaNFu8mDP6', 'student', 1, NULL, NULL),
(28, '9090-9090', 'security1@test.com', '$2y$10$j/7zfbB4ytgMO/c4zu6MPuvyzOXRCD4lCzvNTduxYLevcNl4vbTVa', 'security', 0, NULL, NULL),
(30, '0945-9485', 'faculty1@test.com', '$2y$10$jfoILh3yI/6w9a50QnZ9h.RLo0qo/5mWpLKS7oWynwBehn.8Jtuse', 'faculty', 0, NULL, NULL),
(31, '3434-3434', 'admin3@test.com', '$2y$10$gX5icjBJV.QJcvKPcFtqSOY7d7WNDaHcY9bPApmpnhm4FDHZCw8ki', 'administrator', 0, NULL, NULL),
(36, '7548-5438', 'security@test.com', '$2y$10$K/5Nup77eqz4zhAau.l9au0UPVFvTYNTHXcQtS7LBUIehKYUdYHla', 'security', 1, NULL, NULL),
(37, '3843-7980', 'geodenola@gmail.com', '$2y$10$L66mcR8f0ekqQ6iCdx7qt.ahwkZELDHEy5uZusKZ1gvXAV8AjSDSK', 'ccdu', 0, NULL, NULL),
(39, '9854-3458', 'test@test.com', '$2y$10$WMQj0w8BTcuj9H9zDcgFceD4meFqauCnBE6ZjxULkPrrSy9zOynlO', 'ccdu', 0, NULL, NULL),
(43, '2223-0775', 'kuropm23@gmail.com', '$2y$10$YdJj4Iink5g3PJ7Cw.e99urUFvzWn68hbCvkMEBIP3tke2tBLbFKG', 'student', 0, NULL, NULL),
(46, '4654-7656', 'faculty9304@test.com', '$2y$10$foUZNDedtHEU7/YE1MAQo.LlJqrYninrAJURf5gqA4fwyTJ00eNkm', 'faculty', 1, NULL, NULL),
(47, '0495-5453', 'security12321@test.com', '$2y$10$gydSKfWgx.9cOJXr.v3C.u/UxUm9VaizUsxQ3VYo229u0L.d2SAby', 'security', 1, NULL, NULL),
(53, '8989-8989', 'ascbi23@test.com', '$2y$10$gMCwD/YYooRUZ4Sh0jNiFusRhI3no02F/UA/B7JqqDbTDA.slZMpy', 'student', 1, NULL, NULL),
(54, '1010-2020', 'ugvuds@test.com', '$2y$10$4Ipri1beynmjbVgCgtwr9OnD1Lb30IvOzXasoVcm9SuZO3l/wsgpe', 'student', 1, NULL, NULL),
(55, '3030-3030', 'svfs@test.com', '$2y$10$xAnn5vYrZZ5UOGeO0RaTW.BOJ1XsY/Q7I/1kyltgVsGbUwf3.Kpny', 'student', 1, NULL, NULL),
(56, '4040-4040', 'jvjd@test.com', '$2y$10$Q7psD7uLwRb7wVejTL9V5erOOpFY4Pz/WMeBj/J2dpCjMCqeMolz2', 'student', 1, NULL, NULL),
(57, '0101-0101', 'djcbd@test.com', '$2y$10$ziHWuvWxmsOuvPm8T03rUuReiVEJ/xAygrhVl3GmR7QXv0QHb6u6y', 'student', 1, NULL, NULL),
(58, '0202-0202', 'dfasd@test.com', '$2y$10$0hbZvW72V1TtMJx8chgaI.koY1oHSO/ndvGXJiNS8brNUbQfmSw1m', 'student', 1, NULL, NULL),
(59, '0303-0303', 'hjvbd@test.com', '$2y$10$IVI1mtnos.Sj1s2B7NOCEu08xSObKC.ROt7vDm80K2er6LW8OcSmK', 'student', 1, NULL, NULL),
(60, '0505-0505', 'jhh@test.com', '$2y$10$muK0eOSd.4GPmAe2pLOAFOmXeUAQU63.7LMVlD.h.kEPXv72dmfSq', 'student', 1, NULL, NULL),
(61, '0606-0606', 'fjkvnf@test.com', '$2y$10$/BehtCAdMpcgK.ikE5RxhOKbY0a3Pk6emL5rO/bNAoPe1YGh1Lhf2', 'student', 1, NULL, NULL),
(62, '0707-0707', 'jdnf@test.com', '$2y$10$Q3byjoS7UJKqfv5P366Pqe9oxy/aspOfgeJyfPM5nxBgpGzrw.mLC', 'student', 1, NULL, NULL),
(65, '8888-8884', 'algernonangeles01@gmail.com', '$2y$10$psD67tkxGmMPdvwRHbq0cuz6.hDQ7pVcOgGF8WK6JFojKBJqJ4Btu', 'student', 1, NULL, NULL),
(68, '0005-0005', 'fsvd@test.com', '$2y$10$mlrXlNLarHVqs.K.A6ORXeYxdq6WJudso0G3zARKHWWE/hiCbcEh6', 'student', 1, NULL, NULL),
(78, '3070-3070', 'sdDDV@test.com', '$2y$10$Uk4p6Mmosg59IU7ScBx2a.Z/zgV8cfImAnfM0aCduLNiTHSZ9OC.m', 'student', 1, NULL, NULL),
(86, '4534-6334', 'rgddg@test.com', '$2y$10$KsUqlO9Cvsy8jzyCF4BVhus6N/RHa94A8THTTL.h23SJh820bxI6y', 'student', 1, NULL, NULL),
(90, '5656-7070', 'geonnadenola@gmail.com', '$2y$10$fHlW4Pok/49hjGu6XTqjJ.AiNlmozdUu626BNyWNB2ACAJqRtGhFG', 'student', 1, NULL, NULL),
(91, '0394-4365', 'jnfe@test.com', '$2y$10$lX0.fzv8aO7ZFWD3nw6YMe5zpwCtqSYvDaxl1wD6qnXLRNSeQrtI.', 'student', 1, NULL, NULL),
(92, '0459-0545', 'sdg@test.com', '$2y$10$lvtJUa300wn02iYR2qaWSehp0ulS5d8Rx0oSqWX33u0G32p.H9P8y', 'student', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_account`
--

CREATE TABLE `admin_account` (
  `record_id` int(11) NOT NULL,
  `admin_id` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `f_create` varchar(2) DEFAULT NULL,
  `f_update` varchar(2) DEFAULT NULL,
  `f_delete` varchar(2) DEFAULT NULL,
  `s_create` varchar(2) DEFAULT NULL,
  `s_update` varchar(2) DEFAULT NULL,
  `s_delete` varchar(2) DEFAULT NULL,
  `a_create` varchar(2) DEFAULT NULL,
  `a_update` varchar(2) DEFAULT NULL,
  `a_delete` varchar(2) DEFAULT NULL,
  `c_create` varchar(2) DEFAULT NULL,
  `c_update` varchar(2) DEFAULT NULL,
  `c_delete` varchar(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `change_pass` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_account`
--

INSERT INTO `admin_account` (`record_id`, `admin_id`, `first_name`, `last_name`, `middle_name`, `mobile`, `email`, `photo`, `f_create`, `f_update`, `f_delete`, `s_create`, `s_update`, `s_delete`, `a_create`, `a_update`, `a_delete`, `c_create`, `c_update`, `c_delete`, `created_at`, `updated_at`, `change_pass`) VALUES
(1, '1111-1111', 'Algernon', 'Angeles', 'Cruz', '09887677878', 'mainadmin@test.com', '1757697765_images.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-12 17:12:03', '2025-09-12 17:22:45', 1),
(4, '1212-1212', 'Geonna', 'Denola', 'Bcugan', '09567894565', 'admin2@test.com', '1759384389_6cc26574e468770a8b74a833082fc632_8305136916126025774.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-02 05:53:09', '2025-10-02 05:53:09', 1),
(6, '3434-3434', 'Maria', 'Enobio', 'Angelica', '09754556789', 'admin3@test.com', '1759502167_asus.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-03 14:36:07', '2025-10-03 14:36:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ccdu_account`
--

CREATE TABLE `ccdu_account` (
  `record_id` int(11) NOT NULL,
  `ccdu_id` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `change_pass` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ccdu_account`
--

INSERT INTO `ccdu_account` (`record_id`, `ccdu_id`, `first_name`, `last_name`, `mobile`, `email`, `photo`, `created_at`, `updated_at`, `change_pass`) VALUES
(1, '7777-7777', 'Iba', 'Na', '09754756736', 'mainccdu@test.com', '1757698126_542753109_777680591472046_482913898270641425_n.jpg', '2025-09-12 17:28:46', '2025-09-12 17:28:46', 1),
(14, '3843-7980', 'Algernon', 'Angeles', '09786542435', 'geodenola@gmail.com', '', '2025-10-05 07:43:42', '2025-10-05 07:43:42', 1),
(16, '9854-3458', 'fjkvfj', 'ldkgnwl', '09876545678', 'test@test.com', '', '2025-10-05 07:56:52', '2025-10-05 07:56:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `community_service_entries`
--

CREATE TABLE `community_service_entries` (
  `entry_id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `violation_id` int(11) DEFAULT NULL,
  `validator_id` int(11) DEFAULT NULL,
  `hours` decimal(5,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `photo_paths` text DEFAULT NULL,
  `service_date` DATE DEFAULT CURRENT_DATE,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `community_service_entries`
--

INSERT INTO `community_service_entries` (`entry_id`, `student_id`, `violation_id`, `validator_id`, `hours`, `remarks`, `comment`, `photo_paths`, `service_date`, `created_at`) VALUES
(1, '2223-0775', NULL, 10, 5.00, 'parking duty', 'eyyy', '[\"uploads/service/2223-0775_20251008_174006_8d98fdbf.png\",\"uploads/service/2223-0775_20251008_174006_e4bab25b.png\",\"uploads/service/2223-0775_20251008_174006_adf36823.png\"]', '2025-10-08', '2025-10-08 23:40:06'),
(2, '2223-0775', NULL, 10, 8.00, 'Maintenance cleanup', 'parang ewan', '[\"uploads/service/2223-0775_20251012_140026_a302bbb1.png\",\"uploads/service/2223-0775_20251012_140026_0e8b60ae.png\",\"uploads/service/2223-0775_20251012_140026_64bc30d2.png\",\"uploads/service/2223-0775_20251012_140026_8efbca41.png\"]', '2025-10-12', '2025-10-12 20:00:26'),
(3, '2223-0775', NULL, 10, 47.00, 'Maintenance cleanup', '', '[\"uploads/service/2223-0775_20251016_171345_5ffc5b1e.png\",\"uploads/service/2223-0775_20251016_171345_aa1e94d7.png\",\"uploads/service/2223-0775_20251016_171345_b6fb6cb6.png\"]', '2025-10-16', '2025-10-16 23:13:45'),
(4, '2223-0775', NULL, 10, 10.00, 'Maintenance cleanup', '', '[\"uploads/service/2223-0775_20251019_135927_9ced3c6a.png\"]', '2025-10-19', '2025-10-19 19:59:27'),
(5, '2223-0775', NULL, 10, 10.00, 'tagalaba', 'fsrdgf', '[\"uploads/service/2223-0775_20251024_190855_09d90658.jpg\"]', '2025-10-24', '2025-10-25 01:08:55'),
(6, '2223-0775', NULL, 10, 5.00, 'ds', 'sadfv', NULL, '2025-10-25', '2025-10-25 16:10:17'),
(7, '2223-0775', NULL, 10, 10.00, 'tagalaba', 'kdinf', '[\"uploads/service/2223-0775_20251025_101059_d7693dd7.png\",\"uploads/service/2223-0775_20251025_101059_adf7f986.png\",\"uploads/service/2223-0775_20251025_101059_42752b27.jpg\"]', '2025-10-25', '2025-10-25 16:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `community_service_evidence`
--

CREATE TABLE `community_service_evidence` (
  `evidence_id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `validator_id` int(11) NOT NULL,
  `photo` blob DEFAULT NULL,
  `hours_completed` int(11) NOT NULL,
  `performance_rating` enum('excellent','good','Fair','Poor') NOT NULL,
  `remarks` text DEFAULT NULL,
  `uploaded_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_account`
--

CREATE TABLE `faculty_account` (
  `record_id` int(11) NOT NULL,
  `faculty_id` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `institute` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `change_pass` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty_account`
--

INSERT INTO `faculty_account` (`record_id`, `faculty_id`, `first_name`, `last_name`, `mobile`, `email`, `photo`, `institute`, `created_at`, `updated_at`, `change_pass`) VALUES
(1, '4444-4444', 'dfEREHT', 'THDT', '09976567567', 'mainfaculty@test.com', '1757698162_images.png', 'IHTM', '2025-09-12 17:29:22', '2025-09-12 17:29:22', 1),
(2, '8777-8777', 'Algernon', 'Angeles', '09758475847', 'mainfaculty02@test.com', '1757965474_542753109_777680591472046_482913898270641425_n.jpg', 'IHTM', '2025-09-15 19:44:34', '2025-09-15 19:44:34', 1),
(5, '0945-9485', 'eoifrhbr', 'leibje', '09746587346', 'faculty1@test.com', '', 'IBCE', '2025-10-02 17:19:29', '2025-10-02 17:19:29', 1),
(10, '4654-7656', 'rwztxhjjh', 'rezstrxdtfjk', '09876564355', 'faculty9304@test.com', 'IMG_8137.jpg', '', '2025-10-22 20:42:33', '2025-10-22 20:42:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gmrc_certificate_logs`
--

CREATE TABLE `gmrc_certificate_logs` (
  `id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `requestor_name` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `from_semester` varchar(50) DEFAULT NULL,
  `from_ay` varchar(50) DEFAULT NULL,
  `to_semester` varchar(50) DEFAULT NULL,
  `to_ay` varchar(50) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `issued_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gmrc_certificate_logs`
--

INSERT INTO `gmrc_certificate_logs` (`id`, `student_id`, `requestor_name`, `purpose`, `from_semester`, `from_ay`, `to_semester`, `to_ay`, `issue_date`, `issued_by`, `created_at`) VALUES
(1, '4040-4040', 'fcfgvhbjknuih wrghetgr sregbrg', 'Scholarship', '1st Semester', '2014 - 2015', '2nd Semester', '2025 - 2026', '2025-11-21', 'ccdu', '2025-11-20 16:04:53'),
(2, '4040-4040', 'fcfgvhbjknuih wrghetgr sregbrg', 'Scholarship', '1st Semester', '2014 - 2015', '2nd Semester', '2025 - 2026', '2025-11-21', 'ccdu', '2025-11-20 16:05:09'),
(3, '9999-9999', 'ywibKJGW AWWIRUR CWEIUCE', 'Government Requirement', '1st Semester', '2014 - 2015', '2nd Semester', '2025 - 2026', '2025-11-21', 'ccdu', '2025-11-20 16:07:56'),
(4, '0808-0808', 'SYUDVHIUdwhv disufh douofghoreu', 'Employment', '1st Semester', '2014 - 2015', '2nd Semester', '2025 - 2026', '2025-11-21', 'ccdu', '2025-11-20 16:14:57');

-- --------------------------------------------------------

--
-- Table structure for table `gmrc_requests`
--

CREATE TABLE `gmrc_requests` (
  `id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `violation_id` int(11) DEFAULT NULL,
  `requested_by` int(11) NOT NULL,
  `status` enum('PENDING','APPROVED','REJECTED','SCHEDULED','COMPLETED') NOT NULL DEFAULT 'PENDING',
  `schedule_at` datetime DEFAULT NULL,
  `student_reason` text DEFAULT NULL,
  `ccdu_remarks` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gmrc_requests`
--

INSERT INTO `gmrc_requests` (`id`, `student_id`, `violation_id`, `requested_by`, `status`, `schedule_at`, `student_reason`, `ccdu_remarks`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '2223-0775', NULL, 43, 'COMPLETED', '2025-11-25 08:30:00', 'Scholarship for EFAP', 'for pick up', '2025-11-23 20:33:22', 43, '2025-11-23 21:46:54', 5);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `target_role` enum('student','faculty','security','ccdu') NOT NULL,
  `target_user_id` varchar(64) DEFAULT NULL,
  `type` enum('info','success','warning','danger') NOT NULL DEFAULT 'info',
  `title` varchar(150) NOT NULL,
  `body` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `violation_id` int(11) DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `target_role`, `target_user_id`, `type`, `title`, `body`, `url`, `violation_id`, `created_by`, `created_at`, `read_at`) VALUES
(1, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/pending_reports.php#v42', 42, '9090-9090', '2025-10-16 02:35:49', '2025-10-17 22:56:13'),
(2, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/pending_reports.php#v43', 43, '9090-9090', '2025-10-16 02:36:42', '2025-10-17 22:56:13'),
(3, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/pending_reports.php#v44', 44, '9090-9090', '2025-10-16 20:35:46', '2025-10-17 22:56:12'),
(4, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/pending_reports.php#v45', 45, '9090-9090', '2025-10-16 22:48:04', '2025-10-17 22:56:11'),
(5, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/pending_reports.php#v46', 46, '9090-9090', '2025-10-17 22:59:01', NULL),
(6, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'Aaron Manalotlot • Student ID: 8472-8649', '/MoralMatrix/ccdu/view_student.php?student_id=8472-8649#v47', 47, '7777-7777', '2025-10-19 21:08:03', NULL),
(7, 'student', '8472-8649', 'info', 'A violation was filed on your account', 'Please review the entry for Aaron Manalotlot.', '/MoralMatrix/student/violations.php#v47', 47, '7777-7777', '2025-10-19 21:08:03', NULL),
(8, 'ccdu', NULL, 'info', 'New violation reported by Faculty', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/pending_reports.php#v48', 48, '0945-9485', '2025-10-21 23:19:12', NULL),
(9, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/view_student.php?student_id=2223-0775#v50', 50, '7777-7777', '2025-10-23 01:53:36', NULL),
(10, 'student', '2223-0775', 'info', 'A violation was filed on your account', 'Please review the entry for Geonna Denola.', '/MoralMatrix/student/violations.php#v50', 50, '7777-7777', '2025-10-23 01:53:36', NULL),
(11, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'Geonna Denola • Student ID: 2223-0775', '/ccdu/pending_reports.php#v51', 51, '9090-9090', '2025-10-25 00:19:37', NULL),
(12, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'Geonna Denola • Student ID: 2223-0775', '/ccdu/pending_reports.php#v52', 52, '9090-9090', '2025-10-25 00:21:41', NULL),
(13, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/pending_reports.php#v53', 53, '9090-9090', '2025-10-25 00:27:25', NULL),
(14, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/pending_reports.php#v54', 54, '9090-9090', '2025-10-25 00:34:58', NULL),
(15, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'Maria Enobio • Student ID: 4534-4545', '/MoralMatrix/ccdu/pending_reports.php#v55', 55, '9090-9090', '2025-10-25 00:40:52', NULL),
(16, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/view_student.php?student_id=2223-0775#v56', 56, '7777-7777', '2025-10-25 00:47:43', NULL),
(17, 'student', '2223-0775', 'info', 'A violation was filed on your account', 'Please review the entry for Geonna Denola.', '/MoralMatrix/student/violations.php#v56', 56, '7777-7777', '2025-10-25 00:47:43', NULL),
(18, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/view_student.php?student_id=2223-0775#v57', 57, '7777-7777', '2025-10-25 01:04:22', NULL),
(19, 'student', '2223-0775', 'info', 'A violation was filed on your account', 'Please review the entry for Geonna Denola.', '/MoralMatrix/student/violations.php#v57', 57, '7777-7777', '2025-10-25 01:04:22', NULL),
(20, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'Geonna Denola • Student ID: 2223-0775', '/MoralMatrix/ccdu/view_student.php?student_id=2223-0775#v58', 58, '7777-7777', '2025-10-25 01:19:01', NULL),
(21, 'student', '2223-0775', 'info', 'A violation was filed on your account', 'Please review the entry for Geonna Denola.', '/MoralMatrix/student/violations.php#v58', 58, '7777-7777', '2025-10-25 01:19:01', NULL),
(22, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'Aaron Manalotlot • Student ID: 8472-8649', '/MoralMatrix/ccdu/view_student.php?student_id=8472-8649#v59', 59, '7777-7777', '2025-10-25 01:30:43', NULL),
(23, 'student', '8472-8649', 'info', 'A violation was filed on your account', 'Please review the entry for Aaron Manalotlot.', '/MoralMatrix/student/violations.php#v59', 59, '7777-7777', '2025-10-25 01:30:43', NULL),
(24, 'ccdu', NULL, 'info', 'New violation reported by Faculty', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v60', 60, '0945-9485', '2025-10-25 02:56:23', NULL),
(25, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v61', 61, '9090-9090', '2025-10-25 11:40:55', NULL),
(26, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v62', 62, '9090-9090', '2025-10-25 11:41:12', NULL),
(27, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v63', 63, '9090-9090', '2025-10-25 11:57:26', NULL),
(28, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v64', 64, '9090-9090', '2025-10-25 12:11:10', NULL),
(29, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v65', 65, '9090-9090', '2025-10-25 12:21:06', NULL),
(30, 'security', '9090-9090', 'success', 'Your violation report was approved', 'Student ID: 5555-5555 | Offense: id_policy', '/MoralMatrix/security/view_student.php?student_id=5555-5555#v65', 65, '7777-7777', '2025-10-25 13:23:29', NULL),
(31, 'faculty', '0945-9485', 'success', 'Your violation report was approved', 'Student ID: 5555-5555 | Offense: substance_addiction', '/MoralMatrix/faculty/view_student.php?student_id=5555-5555#v60', 60, '7777-7777', '2025-10-25 13:24:32', NULL),
(32, 'ccdu', NULL, 'info', 'New violation reported by Faculty', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v66', 66, '0945-9485', '2025-10-25 13:38:20', NULL),
(33, 'faculty', '0945-9485', 'success', 'Your violation report was approved', 'Student ID: 5555-5555 | Offense: uniform_policy', '/MoralMatrix/faculty/view_student.php?student_id=5555-5555#v66', 66, '7777-7777', '2025-10-25 13:38:27', NULL),
(34, 'ccdu', NULL, 'info', 'New violation reported by Faculty', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v67', 67, '0945-9485', '2025-10-25 13:40:10', NULL),
(35, 'ccdu', NULL, 'info', 'New violation reported by Faculty', 'ucyvuyihn fyvgubhnj • Student ID: 6767-0987', '/MoralMatrix/ccdu/pending_reports.php#v68', 68, '0945-9485', '2025-10-25 14:12:54', NULL),
(36, 'ccdu', NULL, 'info', 'New violation reported by Faculty', 'ucyvuyihn fyvgubhnj • Student ID: 6767-0987', '/MoralMatrix/ccdu/pending_reports.php#v69', 69, '0945-9485', '2025-10-25 14:13:14', NULL),
(37, 'faculty', '0945-9485', 'success', 'Your violation report was approved', 'Student ID: 6767-0987 | Offense: accessories_and_hair', '/MoralMatrix/faculty/view_student.php?student_id=6767-0987#v69', 69, '7777-7777', '2025-10-25 14:19:35', NULL),
(38, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v70', 70, '9090-9090', '2025-10-25 14:51:26', NULL),
(39, 'security', '9090-9090', 'success', 'Your violation report was approved', 'Student ID: 5555-5555 | Offense: improper_conduct', '/MoralMatrix/security/view_student.php?student_id=5555-5555#v70', 70, '7777-7777', '2025-10-25 14:51:38', NULL),
(40, 'security', '9090-9090', 'success', 'Your violation report was approved', 'Student ID: 4534-4545 | Offense: threats_disrespect', 'http://localhost/MoralMatrix/security/view_student.php?student_id=4534-4545#v55', 55, '7777-7777', '2025-10-25 14:54:32', NULL),
(41, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/view_student.php?student_id=5555-5555#v71', 71, '7777-7777', '2025-10-31 16:28:57', NULL),
(42, 'student', '5555-5555', 'info', 'A violation was filed on your account', 'Please review the entry for fmdnah nsysynny.', '/MoralMatrix/student/violations.php#v71', 71, '7777-7777', '2025-10-31 16:28:57', NULL),
(43, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/view_student.php?student_id=5555-5555#v72', 72, '7777-7777', '2025-10-31 16:35:24', NULL),
(44, 'student', '5555-5555', 'info', 'A violation was filed on your account', 'Please review the entry for fmdnah nsysynny.', '/MoralMatrix/student/violations.php#v72', 72, '7777-7777', '2025-10-31 16:35:24', NULL),
(45, 'ccdu', NULL, 'warning', 'New violation reported by Security', 'Geonna Denola • Student ID: 3444-3537', '/MoralMatrix/ccdu/pending_reports.php#v73', 73, '9090-9090', '2025-11-07 22:01:10', NULL),
(46, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'ucyvuyihn fyvgubhnj • Student ID: 6767-0987', '/MoralMatrix/ccdu/view_student.php?student_id=6767-0987#v74', 74, '7777-7777', '2025-11-10 16:49:55', NULL),
(47, 'student', '6767-0987', 'info', 'A violation was filed on your account', 'Please review the entry for ucyvuyihn fyvgubhnj.', '/MoralMatrix/student/violations.php#v74', 74, '7777-7777', '2025-11-10 16:49:55', NULL),
(48, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/view_student.php?student_id=5555-5555#v75', 75, '7777-7777', '2025-11-20 23:05:44', NULL),
(49, 'student', '5555-5555', 'info', 'A violation was filed on your account', 'Please review the entry for fmdnah nsysynny.', '/MoralMatrix/student/violations.php#v75', 75, '7777-7777', '2025-11-20 23:05:44', NULL),
(50, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/view_student.php?student_id=5555-5555#v76', 76, '7777-7777', '2025-11-21 01:51:59', NULL),
(51, 'student', '5555-5555', 'info', 'A violation was filed on your account', 'Please review the entry for fmdnah nsysynny.', '/MoralMatrix/student/violations.php#v76', 76, '7777-7777', '2025-11-21 01:51:59', NULL),
(52, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/view_student.php?student_id=5555-5555#v77', 77, '7777-7777', '2025-11-21 02:01:26', NULL),
(53, 'student', '5555-5555', 'info', 'A violation was filed on your account', 'Please review the entry for fmdnah nsysynny.', '/MoralMatrix/student/violations.php#v77', 77, '7777-7777', '2025-11-21 02:01:26', NULL),
(54, 'ccdu', NULL, 'success', 'New violation added by CCDU', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/view_student.php?student_id=5555-5555#v78', 78, '7777-7777', '2025-11-21 03:54:16', NULL),
(55, 'student', '5555-5555', 'info', 'A violation was filed on your account', 'Please review the entry for fmdnah nsysynny.', '/MoralMatrix/student/violations.php#v78', 78, '7777-7777', '2025-11-21 03:54:16', NULL),
(56, 'ccdu', NULL, 'warning', 'Violation reported by Security', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/view_student.php?student_id=5555-5555#v79', 79, '9090-9090', '2025-11-22 16:58:42', NULL),
(57, 'student', '5555-5555', 'info', 'A violation was filed on your account', 'Please review the entry for fmdnah nsysynny.', '/MoralMatrix/student/violations.php#v79', 79, '9090-9090', '2025-11-22 16:58:42', NULL),
(58, 'ccdu', NULL, 'warning', 'Violation reported by Security', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v80', 80, '9090-9090', '2025-11-22 17:28:21', NULL),
(59, 'ccdu', NULL, 'warning', 'Violation reported by Security', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v81', 81, '9090-9090', '2025-11-22 17:30:40', NULL),
(60, 'ccdu', NULL, 'warning', 'Violation reported by Security', 'ucyvuyihn fyvgubhnj • Student ID: 6767-0987', '/MoralMatrix/ccdu/pending_reports.php#v82', 82, '9090-9090', '2025-11-22 17:32:32', NULL),
(61, 'ccdu', NULL, 'warning', 'Violation reported by Security', 'ucyvuyihn fyvgubhnj • Student ID: 6767-0987', '/MoralMatrix/ccdu/pending_reports.php#v83', 83, '9090-9090', '2025-11-22 17:39:10', NULL),
(62, 'ccdu', NULL, 'warning', 'Violation reported by Security', 'Aaron Manalotlot • Student ID: 8472-8649', '/MoralMatrix/ccdu/pending_reports.php#v84', 84, '9090-9090', '2025-11-22 19:33:18', NULL),
(63, 'security', '9090-9090', 'success', 'Your violation report was approved', 'Student ID: 8472-8649 | Offense: civilian_attire', 'http://localhost/MoralMatrix/security/view_student.php?student_id=8472-8649#v84', 84, '7777-7777', '2025-11-22 19:35:40', NULL),
(64, 'ccdu', NULL, 'warning', 'Violation reported by Security', 'fmdnah nsysynny • Student ID: 5555-5555', '/MoralMatrix/ccdu/pending_reports.php#v85', 85, '9090-9090', '2025-11-22 20:59:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `security_account`
--

CREATE TABLE `security_account` (
  `record_id` int(11) NOT NULL,
  `security_id` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `change_pass` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `security_account`
--

INSERT INTO `security_account` (`record_id`, `security_id`, `first_name`, `last_name`, `mobile`, `email`, `photo`, `created_at`, `updated_at`, `change_pass`) VALUES
(1, '9090-9090', 'Geonna', 'Denola', '09834475348', 'security1@test.com', '1759424151_Kinich Wallpaper from \'Saurian Egg Adventures\' Web Event.jpg', '2025-10-02 16:55:51', '2025-10-02 16:55:51', 1),
(3, '7548-5438', 'Geonna', 'Angeles', '09457543658', 'security@test.com', '', '2025-10-05 07:32:11', '2025-10-05 07:32:11', 1),
(4, '0495-5453', 'wvefafb', 'g fgfdfbg', '09435434334', 'security12321@test.com', '1761166143_IMG_8137.JPG', '2025-10-22 20:49:04', '2025-10-22 20:49:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_account`
--

CREATE TABLE `student_account` (
  `record_id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `institute` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `section` varchar(50) DEFAULT NULL,
  `guardian` varchar(50) DEFAULT NULL,
  `guardian_mobile` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `change_pass` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_account`
--

INSERT INTO `student_account` (`record_id`, `student_id`, `first_name`, `middle_name`, `last_name`, `mobile`, `email`, `photo`, `institute`, `course`, `level`, `section`, `guardian`, `guardian_mobile`, `created_at`, `updated_at`, `change_pass`) VALUES
(3, '5555-5555', 'fmdnah', 'ndysrn', 'nsysynny', '09876535434', 'student3@test.com', '1757699508_5e046493-3797-440f-8c17-a3f9af780d37.jpg', 'IAS', 'ABH', 1, 'B', 'hgfhsga', '09876656555', '2025-09-12 17:51:48', '2025-09-12 17:51:48', 1),
(10, '6767-0987', 'ucyvuyihn', 'tfcvygbuhnij', 'fyvgubhnj', '09567875436', 'student99@test.com', '', 'IBCE', 'BSIT', 1, 'A', 'dtfyuuihiuj', '09976578679', '2025-09-13 02:13:29', '2025-09-13 02:13:29', 1),
(11, '9999-9999', 'ywibKJGW', 'AWWIRUR', 'CWEIUCE', '09875667854', 'student577@test.com', '', 'IBCE', 'BSIT', 2, 'A', 'jdcriu', '09765476879', '2025-09-13 15:56:55', '2025-09-13 15:56:55', 1),
(12, '1212-2323', 'trcyvgbhjk', 'ufhkvnjd', 'iufnv', '09894759745', 'stdent48t5@test.com', '', 'IAS', 'BSBIO', 4, 'A', 'kfdubveoivuo', '09784535347', '2025-09-13 17:13:35', '2025-09-13 17:13:35', 1),
(13, '7777-7777', 'gyurfihp', 'iuerghirug', 'wuhg', '09756756899', 'student43535@test.com', '', 'IAS', 'BSBIO', 3, 'B', 'ueyfiUQ', '09765456778', '2025-09-13 17:23:48', '2025-09-13 17:23:48', 1),
(14, '0808-0808', 'SYUDVHIUdwhv', 'disufh', 'douofghoreu', '09457354785', 'student9845@test.com', '', 'IBCE', 'BSIT', 1, 'C', 'sjdnfufnew', '09764523787', '2025-09-13 17:24:47', '2025-09-13 17:24:47', 1),
(15, '8472-8649', 'Aaron', 'Ken', 'Manalotlot', '09655456789', 'mainstudent1@test.com', '1759400007_6cc26574e468770a8b74a833082fc632_8305136916126025774.png', 'IBCE', 'BSIT', 4, 'A', 'Mommy', '09787459438', '2025-10-02 06:02:09', '2025-10-02 10:13:27', 1),
(16, '3444-3537', 'Geonna', 'Lyzzet', 'Denola', '09676343958', 'student5@test.com', '1759417113_368566555_1368981020356581_2333135039467267829_n.jpg', 'IBCE', 'BSIT', 4, 'A', 'uygiuhoejfp', '09745837454', '2025-10-02 14:58:33', '2025-10-02 14:58:33', 1),
(18, '4534-4545', 'Maria', 'Angelica', 'Enobio', '09775634234', 'student6@test.com', '1759418579_ua.png', 'IBCE', 'BSIT', 4, 'A', 'dkjvksdfh', '09354365544', '2025-10-02 15:22:59', '2025-10-02 15:22:59', 1),
(19, '9854-9556', 'Algernon', 'Cruz', 'Angeles', '09675637485', 'student7@test.com', '1759419895_6cc26574e468770a8b74a833082fc632_8305136916126025774.png', 'IBCE', 'BSIT', 4, 'A', 'igowijr', '09578459834', '2025-10-02 15:44:55', '2025-10-02 15:44:55', 1),
(21, '2223-0775', 'Geonna', 'Lyzzet', 'Denola', '09453211402', 'kuropm23@gmail.com', '1761166357_IMG_8202.JPG', 'IBCE', 'BSIT', 4, 'A', 'Mama', '09692004136', '2025-10-05 13:11:17', '2025-10-22 20:52:37', 1),
(29, '8989-8989', 'hbjknf', 'knrve', 'ksfjvbek', '09454667845', 'ascbi23@test.com', '', 'IBCE', 'BSIT', 2, 'A', 'hjwbifuwoe', '09864356768', '2025-10-27 02:10:44', '2025-10-27 02:10:44', 1),
(30, '1010-2020', 'ijujk', 'bnm', 'yihujnkm', '09876564356', 'ugvuds@test.com', '1761531960_IMG_9073.JPG', 'IBCE', 'BSIT', 1, 'B', 'khjdbvkwjb', '09876543245', '2025-10-27 02:26:00', '2025-10-27 02:26:00', 1),
(31, '3030-3030', 'qweregt', 'regtf', '3rewg', '09876543567', 'svfs@test.com', '', 'IHTM', 'BSTM', 2, 'A', 'ytguihkuj', '09876564324', '2025-10-27 02:29:10', '2025-10-27 02:29:10', 1),
(32, '4040-4040', 'fcfgvhbjknuih', 'wrghetgr', 'sregbrg', '09987545678', 'jvjd@test.com', '', 'IBCE', 'BSIT', 1, 'A', 'anhgsdfe', '09877543456', '2025-10-27 02:42:17', '2025-10-27 02:42:17', 1),
(33, '0101-0101', 'edfw', 'ergrg', 'werfef', '09878767564', 'djcbd@test.com', '', 'IBCE', 'BSIT', 4, 'B', 'dfwfwe', '09432456789', '2025-10-27 02:55:27', '2025-10-27 02:55:27', 1),
(34, '0202-0202', 'dvj', 'qferg', 'fergt', '09234344555', 'dfasd@test.com', '', 'IBCE', 'BSIT', 2, 'A', 'qwewrer', '09435678905', '2025-10-27 03:06:46', '2025-10-27 03:06:46', 1),
(35, '0303-0303', 'qeffeqf', 'dfjhewbfjk', 'ouhho', '09354567687', 'hjvbd@test.com', '', 'IHTM', 'BSTM', 3, 'B', 'gdxfchgyhu', '09566789767', '2025-10-27 03:09:01', '2025-10-27 03:09:01', 1),
(36, '0505-0505', 'efgdf', 'sfb', 'dgb', '09766543456', 'jhh@test.com', '', 'IBCE', 'BSIT', 1, 'B', 'jkyfutvgjhb', '09865435678', '2025-10-27 03:12:52', '2025-10-27 03:12:52', 1),
(37, '0606-0606', 'efsgsd', 'rg', 'svwr', '09734566789', 'fjkvnf@test.com', '', 'IBCE', 'BSIT', 2, 'A', 'jhbiyub', '09757575665', '2025-10-27 03:24:29', '2025-10-27 03:24:29', 1),
(38, '0707-0707', 'djfndjkf', 'sdfndjf', 'sjdfndjf', '09785787878', 'jdnf@test.com', '', 'IBCE', 'BSCA', 4, 'A', 'bdhbcdh', '09458548758', '2025-10-27 03:36:55', '2025-10-27 03:36:55', 1),
(41, '8888-8884', 'Algernon', 'Bacugan', 'Angeles', '09887677878', 'algernonangeles01@gmail.com', '1761625383_566536835_1156172479208997_8862523458833534014_n.jpg', 'IBCE', 'BSCA', 1, 'A', 'hgfhsga', '09912312312', '2025-10-28 04:23:03', '2025-10-28 04:23:03', 1),
(43, '0005-0005', 'ber', 'brr', 'grggbrg', '09745645354', 'fsvd@test.com', '1761803171_IMG_9403.JPG', 'IBCE', 'BSA', 1, 'A', 'defefef', '09786454423', '2025-10-30 05:46:11', '2025-10-30 05:46:11', 1),
(53, '3070-3070', 'fdvdvfv', 'vdfvdfv', 'vdvdfvd', '09875443454', 'sdDDV@test.com', '', 'IHTM', 'BSTM', 3, 'C', 'dsdsfs', '09955675757', '2025-10-30 06:52:17', '2025-10-30 06:52:17', 1),
(61, '4534-6334', 'TH', 'HMGJ', 'fhfjy', '09874475677', 'rgddg@test.com', '', 'IHTM', 'BSTM', 3, 'B', 'ecwfcecf', '09565767855', '2025-10-30 10:17:25', '2025-10-30 10:17:25', 1),
(65, '5656-7070', 'dfbg', 'dfdgb', 'ewrf', '09873476543', 'geonnadenola@gmail.com', '', 'IBCE', 'BSCA', 2, 'C', 'grhyjrg', '09778787878', '2025-10-30 12:53:08', '2025-10-30 12:53:08', 1),
(66, '0394-4365', 'fbgiurbg', 'iowgn', 'rgrgn', '09454354354', 'jnfe@test.com', '1763115995_IMG_9403.JPG', 'IBCE', 'BSCA', 2, 'C', 'hgfhsga', '09876543256', '2025-11-14 10:26:35', '2025-11-14 10:26:35', 1),
(67, '0459-0545', 'rwgrgrgergerg', 'regeg', 'erhreh', '09435435453', 'sdg@test.com', '1763117375_IMG_9396.JPG', 'IHTM', 'BSHM', 2, 'A', 'Mama', '09692004136', '2025-11-14 10:49:35', '2025-11-14 10:49:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_qr_keys`
--

CREATE TABLE `student_qr_keys` (
  `id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `qr_key` char(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `revoked` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_qr_keys`
--

INSERT INTO `student_qr_keys` (`id`, `student_id`, `qr_key`, `created_at`, `revoked`) VALUES
(5, '6767-0987', '978b4f05b1c0af7cbab66d2d578ec176ff428ca94d642e254153dc7ec9390db0', '2025-09-13 02:13:29', 0),
(6, '9999-9999', '5c968ffaeb563afa848d141942020881c5c1644a4dd07890de1500225912ba96', '2025-09-13 15:56:55', 0),
(7, '1212-2323', '710261578667aef88be464d42c525303ac9b6bbc1c078e1959979eb9497745cd', '2025-09-13 17:13:35', 0),
(8, '0808-0808', '97d98a3103cc37464c30fb518816c5bcd2309c43d6cedc7849084b6b37742a95', '2025-09-13 17:24:47', 0),
(9, '8472-8649', 'b457d6b87ed31ecb2997c376364a998dc39119daa46cb455ed97a3bd54cac815', '2025-10-02 06:02:09', 0),
(10, '3444-3537', '807611fc0645ce146f97b4ef6716d1a1dfcca1e6bf6063a4eb499e38d5d039d8', '2025-10-02 14:58:33', 0),
(12, '4534-4545', '1c2f9f33d16725ec4989c21e26c1945c97f18d8cfde491360541b836369852f2', '2025-10-02 15:22:59', 0),
(13, '9854-9556', '0f741bf7f1fba233baefe86c534a12b680b8d702eb880c8fb0ad94e211b1992c', '2025-10-02 15:44:55', 0),
(15, '2223-0775', '1040e9ddb4e9ace5df80bdb3f4eb2995733f34f53eb7a6921d1dad6874f71106', '2025-10-05 13:11:17', 0),
(23, '8989-8989', '40a6fb6fa02c55419917bba47a644239778f85b373716b27ca554c55bf09aed9', '2025-10-27 02:10:44', 0),
(24, '1010-2020', 'f041c93112854335d6faa4ddb7d3a6e88663f303adeb551ecdc1b1dd667c2a43', '2025-10-27 02:26:00', 0),
(25, '3030-3030', '7c97320a99567f740901432ab8bc24e0cf211c8180b16f0e6b04420ad9a8fd4d', '2025-10-27 02:29:10', 0),
(26, '4040-4040', '5ce4944c950ab86ec86bd477adac2e42086b8ee470968596cdf8a43da7d619ac', '2025-10-27 02:42:17', 0),
(27, '0101-0101', '9c1a209873d61cab7e8240d9eff423bb37adb984543cbfffc2cb0827784943d7', '2025-10-27 02:55:27', 0),
(28, '0202-0202', '21b7a0b753b106968ba958a405a8876b1e73cce68b30ab074c0b1b37f72b1b9b', '2025-10-27 03:06:46', 0),
(29, '0303-0303', 'a5572bdba4b33026c576b7e9fff054f55262879e7f8036f3793ef1f2fd2c1bb2', '2025-10-27 03:09:01', 0),
(30, '0505-0505', 'e2a556343df5d95679c5c3ecb300eafb9ceb0ddbc2e5f15af832e219208c07b9', '2025-10-27 03:12:52', 0),
(31, '0606-0606', 'd529c93f3ec067c246c6e3b8a02931330428800a47b30f29c7733e3859efe474', '2025-10-27 03:24:29', 0),
(32, '0707-0707', 'd624f29f3cd6632cf0915207821c007a6dd1bd4d30d95a2d57e6377ebf3cc55b', '2025-10-27 03:36:55', 0),
(35, '8888-8884', '9a3e7f4adf4da5d93c5b67e5b197ebda34b5215354ba0ca63ef6d8e4abc7bc8b', '2025-10-28 04:23:03', 0),
(37, '0005-0005', '9ab2c31e086e47ad7148a86b0a5358ccbd66e4308855ce9c66d797428034b0d5', '2025-10-30 05:46:11', 0),
(47, '3070-3070', 'e3830ba7a2f4c4aed41b167a64e736b5257236228540a6ea54a51a169eb7766c', '2025-10-30 06:52:17', 0),
(55, '4534-6334', '1ecdf091182ac02eb35580a184162c6606038be476becc551483712a611666b2', '2025-10-30 10:17:25', 0),
(56, '4534-6334', '416d57bd6ce287b4a137b153adc9021652cc93722f3cb27cc4df19ed6e540936', '2025-10-30 10:17:26', 0),
(60, '5656-7070', '2666513d637e3e4a01e193397f2007af44d5afbfbb518fb1aca6ef9fe496ccaa', '2025-10-30 12:53:08', 0),
(61, '0394-4365', '838ca174778f6fccc244f4f0625e8df4673d64999330a490f77cb38859d8227d', '2025-11-14 10:26:35', 0),
(62, '0459-0545', '6599231b78c3961579acd04ea5bc654d808549bb8266f3cc90c5911114984600', '2025-11-14 10:49:35', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_violation`
--

CREATE TABLE `student_violation` (
  `violation_id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `offense_category` enum('light','moderate','grave') NOT NULL,
  `offense_type` varchar(50) NOT NULL,
  `offense_details` text NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `evidence_files` text DEFAULT NULL,
  `reported_at` datetime DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `is_void` tinyint(1) NOT NULL DEFAULT 0,
  `void_reason` text DEFAULT NULL,
  `voided_by` varchar(50) DEFAULT NULL,
  `voided_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `submitted_by` varchar(50) NOT NULL,
  `submitted_role` enum('faculty','ccdu','security') NOT NULL,
  `reviewed_by` varchar(50) DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `review_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_violation`
--

INSERT INTO `student_violation` (`violation_id`, `student_id`, `offense_category`, `offense_type`, `offense_details`, `description`, `photo`, `evidence_files`, `reported_at`, `status`, `is_void`, `void_reason`, `voided_by`, `voided_at`, `updated_at`, `submitted_by`, `submitted_role`, `reviewed_by`, `reviewed_at`, `review_notes`) VALUES
(13, '5555-5555', 'light', 'uniform', '[\"skirt\"]', '', '1757949614_542753109_777680591472046_482913898270641425_n.jpg', NULL, '2025-09-15 23:20:14', 'rejected', 1, 'Voided by CCDU', '5', '2025-10-17 22:30:05', '2025-10-17 22:30:05', '4444-4444', 'faculty', NULL, NULL, NULL),
(14, '0808-0808', 'grave', 'integrity_dishonesty', '[\"forgery\"]', '', '', NULL, '2025-09-16 01:44:40', '', 1, '', NULL, '2025-10-17 22:37:37', NULL, '4444-4444', 'faculty', NULL, NULL, NULL),
(15, '5555-5555', 'grave', 'property_theft', '[\"destruction_of_property\"]', '', '', NULL, '2025-09-16 04:48:24', 'rejected', 1, 'Voided by CCDU', '5', '2025-10-17 22:29:08', '2025-10-17 22:29:08', '4444-4444', 'faculty', NULL, NULL, NULL),
(16, '5555-5555', 'light', 'id', '[\"borrowed\"]', '', '1758336909_IMG20250830163312.jpg', NULL, '2025-09-20 10:55:09', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'ccdu', NULL, NULL, NULL),
(17, '5555-5555', 'light', 'id', '[\"no_id\"]', 'vghjbkjnlk', '1758336936_IMG20250830163312.jpg', NULL, '2025-09-20 10:55:36', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'ccdu', NULL, NULL, NULL),
(18, '5555-5555', 'moderate', 'improper_conduct', '[\"vulgar\"]', 'bbkjl', '1758337039_IMG20250830163312.jpg', NULL, '2025-09-20 10:57:19', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'ccdu', NULL, NULL, NULL),
(19, '5555-5555', 'grave', 'integrity_dishonesty', '[\"forgery\"]', 'ifhuejiokd', '1758340657_Kinich Wallpaper from \'Saurian Egg Adventures\' Web Event.jpg', NULL, '2025-09-20 11:57:37', 'rejected', 1, 'Voided by CCDU', '5', '2025-10-17 22:26:35', '2025-10-17 22:26:35', '7777-7777', 'ccdu', NULL, NULL, NULL),
(20, '7777-7777', 'grave', 'integrity_dishonesty', '[\"forgery\"]', 'tarantado kasi', '1758806920_24e68a97-dd35-4d07-8378-2f4953d549d1.jpg', NULL, '2025-09-25 21:28:40', 'rejected', 1, 'Voided by CCDU', NULL, '2025-10-17 22:07:29', '2025-10-17 22:07:29', '7777-7777', 'ccdu', NULL, NULL, NULL),
(21, '8472-8649', 'light', 'id', '[\"no_id\"]', 'maitim', '1759390052_39-cabbage-png-image.png', NULL, '2025-10-02 15:27:32', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(22, '9854-9556', 'light', 'uniform', '[\"socks\"]', 'N/A', '', NULL, '2025-10-03 01:09:15', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'faculty', NULL, NULL, NULL),
(23, '9854-9556', 'moderate', 'improper_conduct', '[\"vulgar\"]', '', '', NULL, '2025-10-03 01:23:24', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', '', NULL, NULL, NULL),
(24, '5555-5555', 'moderate', 'improper_conduct', '[\"vulgar\"]', '', '', NULL, '2025-10-03 01:24:14', 'pending', 0, NULL, NULL, NULL, NULL, '0945-9485', 'faculty', NULL, NULL, NULL),
(25, '9854-9556', 'light', 'accessories', '[\"piercings\"]', '', '', NULL, '2025-10-03 01:58:18', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', '', NULL, NULL, NULL),
(26, '4534-4545', 'moderate', 'gadget_misuse', '[\"cp_classes\"]', 'maitim', '1759428109_39-cabbage-png-image.png', NULL, '2025-10-03 02:01:49', 'approved', 0, NULL, NULL, NULL, NULL, '0945-9485', 'faculty', NULL, NULL, NULL),
(27, '3444-3537', 'light', 'id', '[\"no_id\"]', '', '', NULL, '2025-10-03 02:21:15', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', '', NULL, NULL, NULL),
(28, '3444-3537', 'grave', 'substance_addiction', '[\"smoking\"]', '', '', NULL, '2025-10-03 02:31:38', 'rejected', 1, 'Voided by CCDU', NULL, '2025-10-17 22:12:17', '2025-10-17 22:12:17', '9090-9090', 'security', NULL, NULL, NULL),
(29, '9854-9556', 'moderate', 'gadget_misuse', '[\"gadgets_functions\"]', '', '', NULL, '2025-10-05 16:00:16', 'approved', 0, NULL, NULL, NULL, NULL, '9854-3458', 'faculty', NULL, NULL, NULL),
(30, '9854-9556', 'moderate', 'gadget_misuse', '[\"gadgets_functions\"]', '', '', NULL, '2025-10-05 16:45:09', 'approved', 0, NULL, NULL, NULL, NULL, '9854-3458', 'faculty', NULL, NULL, NULL),
(31, '9854-9556', 'light', 'accessories', '[\"skirt\",\"crop_top\",\"sando\",\"hair_color\"]', '', '', NULL, '2025-10-05 16:45:55', 'approved', 0, NULL, NULL, NULL, NULL, '9854-3458', 'faculty', NULL, NULL, NULL),
(32, '9854-9556', 'light', 'accessories', '[\"crop_top\",\"sando\",\"piercings\",\"hair_color\"]', '', '', NULL, '2025-10-05 17:20:48', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(33, '2223-0775', 'light', 'uniform', '[\"no_id\",\"socks\",\"skirt\"]', '', '1759670351_6cc26574e468770a8b74a833082fc632_8305136916126025774.png', NULL, '2025-10-05 21:19:11', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(34, '2223-0775', 'grave', 'property_theft', '[\"firearms\"]', '', '', NULL, '2025-10-08 23:33:13', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(35, '2223-0775', 'grave', 'threats_disrespect', '[\"hooliganism\",\"theft\"]', '', '', NULL, '2025-10-09 12:44:24', 'approved', 0, NULL, NULL, NULL, NULL, 'unknown', 'faculty', NULL, NULL, NULL),
(36, '9854-9556', 'light', 'uniform', '[\"socks\",\"skirt\"]', '', '', NULL, '2025-10-09 13:08:47', 'approved', 0, NULL, NULL, NULL, NULL, 'unknown', 'faculty', NULL, NULL, NULL),
(37, '9854-9556', 'light', 'uniform', '[\"socks\",\"skirt\"]', '', '', NULL, '2025-10-09 13:08:50', 'approved', 0, NULL, NULL, NULL, NULL, 'unknown', 'faculty', NULL, NULL, NULL),
(38, '9854-9556', 'light', 'uniform', '[\"socks\"]', '', '', NULL, '2025-10-09 14:17:24', '', 1, '', '5', '2025-10-17 22:45:53', NULL, '9090-9090', 'faculty', NULL, NULL, NULL),
(39, '2223-0775', 'light', 'id', '[\"borrowed\"]', '', '', NULL, '2025-10-16 00:14:43', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(40, '2223-0775', 'light', 'id', '[\"no_id\"]', '', '', NULL, '2025-10-16 00:28:17', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(41, '2223-0775', 'light', 'uniform', '[\"skirt\"]', '', '', NULL, '2025-10-16 02:28:30', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(42, '2223-0775', 'light', 'uniform', '[\"skirt\"]', '', '', NULL, '2025-10-16 02:35:49', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(43, '2223-0775', 'light', 'id', '[\"borrowed\"]', '', '', NULL, '2025-10-16 02:36:42', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(44, '2223-0775', 'moderate', 'improper_conduct', '[\"rough_behavior\"]', '', '', NULL, '2025-10-16 20:35:46', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(45, '2223-0775', 'light', 'accessories', '[\"piercings\"]', '', '', NULL, '2025-10-16 22:48:04', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(46, '2223-0775', 'light', 'civilian', '[\"sando\"]', '', '', NULL, '2025-10-17 22:59:01', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(47, '8472-8649', 'grave', 'substance_addiction', '[\"gambling\"]', '', '', NULL, '2025-10-19 21:07:59', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(48, '2223-0775', 'light', 'uniform', '[\"socks\"]', '', '', NULL, '2025-10-21 23:19:12', 'rejected', 0, NULL, NULL, NULL, NULL, '0945-9485', 'faculty', NULL, NULL, NULL),
(49, '2223-0775', 'light', 'uniform_policy', '[\"PE uniform in class\"]', '', '1761154531_356429796_1442233116574526_2869774209749062158_n.jpg', NULL, '2025-10-23 01:35:31', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(50, '2223-0775', 'light', 'id_policy', '[\"Failure to report lost ID\"]', '', '', NULL, '2025-10-23 01:53:33', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(51, '2223-0775', 'light', 'uniform_policy', '[\"PE uniform in class\"]', 'kjbnnvnowe', '1761322777_a8efd9b1-08c2-42bc-a04a-cb46a5cec859.jpg', NULL, '2025-10-25 00:19:37', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(52, '2223-0775', 'light', 'id_policy', '[\"Failure to report lost ID\"]', 'qg', '1761322901_310772a8-a066-4361-b13d-45d186c7baf9.jpg', NULL, '2025-10-25 00:21:41', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(53, '2223-0775', 'light', 'id_policy', '[\"Failure to report lost ID\"]', 'qg', '1761323245_310772a8-a066-4361-b13d-45d186c7baf9.jpg', NULL, '2025-10-25 00:27:25', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(54, '2223-0775', 'moderate', 'unauthorized_acts', '[\"Public display of affection\"]', 'Naglalampungan sa kalye', '1761323698_2597565c-b5bd-4175-bfe0-278f9e3db570.jpg', NULL, '2025-10-25 00:34:58', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(55, '4534-4545', 'grave', 'threats_disrespect', '[\"Blocking school entry\"]', 'Infoief', '1761324052_a8efd9b1-08c2-42bc-a04a-cb46a5cec859.jpg', NULL, '2025-10-25 00:40:52', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(56, '2223-0775', 'light', 'id_policy', '[\"No official ID lace\"]', 'jrngoeign', '1761324459_74cfa166-f8e5-4b5d-957e-b517cd265083.jpg', NULL, '2025-10-25 00:47:39', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(57, '2223-0775', 'light', 'civilian_attire', '[\"Indecent attire for women\"]', 'cfyvgbjhk', '1761325459_496511612_922926559914494_6220160567029430162_n.jpg', NULL, '2025-10-25 01:04:19', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(58, '2223-0775', 'light', 'id_policy', '[\"Borrowed or lent ID\"]', 'dfgchvbj', '1761326333_IMG_0399.JPG', NULL, '2025-10-25 01:18:53', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(59, '8472-8649', 'grave', 'cyber_reputation', '[]', 'dfdhfgf', 'ccdu/uploads/1761327039_fac53b9e-a833-4b70-85f3-ccdec79bd14e.jpg', NULL, '2025-10-25 01:30:39', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(60, '5555-5555', 'grave', 'substance_addiction', '[\"Smoking in uniform\"]', 'yosi boi', 'faculty/uploads/1761332183_5338cecd-af58-433a-a61c-2ae429dbd760.jpg', NULL, '2025-10-25 02:56:23', 'approved', 0, NULL, NULL, NULL, NULL, '0945-9485', 'faculty', NULL, NULL, NULL),
(61, '5555-5555', 'light', 'uniform_policy', '[\"Not wearing prescribed uniform\"]', '', '', NULL, '2025-10-25 11:40:55', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, '2025-10-25 12:03:52', NULL),
(62, '5555-5555', 'light', 'uniform_policy', '[\"Wearing slippers\"]', 'uhj', '', NULL, '2025-10-25 11:41:12', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, '2025-10-25 11:55:34', NULL),
(63, '5555-5555', 'light', 'uniform_policy', '[\"Incomplete uniform\"]', '', '', NULL, '2025-10-25 11:57:26', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, '2025-10-25 11:57:33', NULL),
(64, '5555-5555', 'light', 'id_policy', '[\"Failure to wear ID\"]', '', '', NULL, '2025-10-25 12:11:10', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, '2025-10-25 12:13:26', NULL),
(65, '5555-5555', 'light', 'id_policy', '[\"Failure to wear ID\"]', '', '', NULL, '2025-10-25 12:21:06', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(66, '5555-5555', 'light', 'uniform_policy', '[\"PE uniform in class\"]', '', '', NULL, '2025-10-25 13:38:20', 'approved', 0, NULL, NULL, NULL, NULL, '0945-9485', 'faculty', NULL, NULL, NULL),
(67, '5555-5555', 'moderate', 'improper_conduct', '[\"Roughness in behavior\"]', '', 'faculty/uploads/1761370810_446c9579-ddbe-4a5b-b592-afd5c7e03130.jpg', NULL, '2025-10-25 13:40:10', 'pending', 0, NULL, NULL, NULL, NULL, '0945-9485', 'faculty', NULL, NULL, NULL),
(68, '6767-0987', 'moderate', 'gadget_misuse', '[\"Using gadgets during functions\"]', 'uhhjkn', '', NULL, '2025-10-25 14:12:54', 'pending', 0, NULL, NULL, NULL, NULL, '0945-9485', 'faculty', NULL, NULL, NULL),
(69, '6767-0987', 'light', 'accessories_and_hair', '[\"Excessive accessories\",\"Dangling or large earrings\"]', '', 'faculty/uploads/1761372794_437ee5f7-5ec5-4a26-927c-073ce54b6e63.jpg', NULL, '2025-10-25 14:13:14', 'approved', 0, NULL, NULL, NULL, NULL, '0945-9485', 'faculty', NULL, NULL, NULL),
(70, '5555-5555', 'moderate', 'improper_conduct', '[\"Use of curses and vulgar words\"]', '', 'security/uploads/1761375086_e671de2a-fde7-48de-a722-c30bc611d379.jpg', NULL, '2025-10-25 14:51:26', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(71, '5555-5555', 'moderate', '3', '[]', 'fdfvrfrfr', '', NULL, '2025-10-31 16:28:54', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(72, '5555-5555', '', '4', '[]', 'luhhh', '', NULL, '2025-10-31 16:35:20', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(73, '3444-3537', 'light', 'id_policy', '[\"Failure to wear ID\"]', 'ieifjref ewfiewnfoewifnwoifnewofnewifnewiofnewfew flkwvw nvrnovnrwoivoiwvnwroivnirowv rwvwrivnrwonwrongfwroinv wefeifnwpiefneroinrg wefowrbnrwonoirbnoetibnprignpwf wefpewofjpewgjrpvbmroihwefpieqhgwprignweoifbqbe fweoiwrngrwlkgnweoihgfwef wefoiewfhwvoohgooew', '', NULL, '2025-11-07 22:01:10', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(74, '6767-0987', 'light', 'civilian_attire', '[\"Indecent attire for women\"]', 'mdknfrinfrfrfwvfrveuvtybhcwnjkdaefv erfbreiugerbigureuiger greiugbnreigneriugierngierbgr gerignreigneriugberiug erfirbugerigberigberibgier', '', NULL, '2025-11-10 16:49:51', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(75, '5555-5555', 'grave', 'substance_addiction', '[\"Smoking in uniform\"]', '', '', NULL, '2025-11-20 23:05:37', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(76, '5555-5555', 'light', 'uniform_policy', '[\"Incomplete uniform\"]', 'skcneeoe', 'ccdu/uploads/1763661116_0_Screenshot_2025-10-25_222551-removebg-preview2.png', '[\"ccdu\\/uploads\\/1763661116_0_Screenshot_2025-10-25_222551-removebg-preview2.png\",\"ccdu\\/uploads\\/1763661116_1_Screenshot_2025-10-25_222551-removebg-preview.png\",\"ccdu\\/uploads\\/1763661116_2_Screenshot_2025-10-25_222551.png\",\"ccdu\\/uploads\\/1763661116_3_Moral_Matrix.pdf\",\"ccdu\\/uploads\\/1763661116_4_Violation_Summary_Report_2025-10-25_024539.pdf\"]', '2025-11-21 01:51:56', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(77, '5555-5555', 'grave', 'violence_misconduct', '[\"Drunkenness\"]', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'ccdu/uploads/1763661683_0_Screenshot_2025-10-25_222551-removebg-preview.png', '[\"ccdu\\/uploads\\/1763661683_0_Screenshot_2025-10-25_222551-removebg-preview.png\",\"ccdu\\/uploads\\/1763661683_1_Screenshot_2025-10-25_222551.png\",\"ccdu\\/uploads\\/1763661683_2_Moral_Matrix.pdf\",\"ccdu\\/uploads\\/1763661683_3_Violation_Summary_Report_2025-10-25_024539.pdf\"]', '2025-11-21 02:01:23', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(78, '5555-5555', 'light', 'accessories_and_hair', '[\"Body piercings\"]', 'dcrlrmrmrogmrvmrvr', 'ccdu/uploads/1763668452_0_Brush-Stroke-PNG-Pic.png', '[\"ccdu\\/uploads\\/1763668452_0_Brush-Stroke-PNG-Pic.png\",\"ccdu\\/uploads\\/1763668452_1_Cabbage_PNG_Clip_Art-1523__1_.png\",\"ccdu\\/uploads\\/1763668452_2_colorful-shiny-wave-background_23-2148391022_1.jpg\",\"ccdu\\/uploads\\/1763668452_3_day-of-valor-silhouette-3meo4.jpg\",\"ccdu\\/uploads\\/1763668452_4_de145325-b733-4763-b3c3-6dfbf1a33234.jpg\"]', '2025-11-21 03:54:12', 'approved', 0, NULL, NULL, NULL, NULL, '7777-7777', 'faculty', NULL, NULL, NULL),
(79, '5555-5555', 'light', 'uniform_policy', '[\"Incomplete uniform\"]', 'rjrevnerovrev revoirevnroevnoirvner vreovrenoirenivornvorenvre vrejvnerjkvnwr wejv  rwjivwrjnwnver verjvnwdovnownv ercjewcjecnfeivnre vrjvnerjkvneriuver vuernvrevurnvurnw cdjcbewdncouvew vrewuvnewvbrwv ervbwuebvewonvwe wehvoweivneorviorev ruewneowifew fweonwc wejebwfbe fejbebce ceufbe eubiedvbudebv efue ew ewb', 'ccdu/uploads/1763801918_1_IMG20250830163256.jpg', '[\"ccdu\\/uploads\\/1763801918_0_Activity_4.docx\",\"ccdu\\/uploads\\/1763801918_1_IMG20250830163256.jpg\",\"ccdu\\/uploads\\/1763801918_2_IMG20250830163312.jpg\"]', '2025-11-22 16:58:38', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'faculty', NULL, NULL, NULL),
(80, '5555-5555', 'light', 'id_policy', '[\"Borrowed or lent ID\"]', '', 'security/uploads/1763803701_0_IMG_20250515_0004.jpg', '[\"security\\/uploads\\/1763803701_0_IMG_20250515_0004.jpg\",\"security\\/uploads\\/1763803701_1_IMG_20250515_0005.jpg\",\"security\\/uploads\\/1763803701_2_JUSTIFICATION_OF_CADET_GEONNA_LYZZET_BACUGAN_DEN__OLA.pdf\"]', '2025-11-22 17:28:21', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'faculty', NULL, NULL, NULL),
(81, '5555-5555', 'light', 'uniform_policy', '[\"Not wearing prescribed uniform\"]', 'Sana pagibig nalang ang isipin ng bawat isa sa mundo', '', '[]', '2025-11-22 17:30:40', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'faculty', NULL, NULL, NULL),
(82, '6767-0987', 'light', 'uniform_policy', '[\"Not wearing prescribed uniform\"]', 'mmninnininiininin', '', '[]', '2025-11-22 17:32:32', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'faculty', NULL, NULL, NULL),
(83, '6767-0987', 'light', 'uniform_policy', '[\"Marked absent due to improper uniform\"]', 'potpot ambaho ng pwet', '', '[]', '2025-11-22 17:39:10', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(84, '8472-8649', 'light', 'civilian_attire', '[\"Indecent attire for women\"]', '', 'security/uploads/1763811198_0_IMG_20250510_0011.jpg', '[\"security\\/uploads\\/1763811198_0_IMG_20250510_0011.jpg\",\"security\\/uploads\\/1763811198_1_IMG_20250510_0012.jpg\",\"security\\/uploads\\/1763811198_2_IMG_20250510_0013.jpg\"]', '2025-11-22 19:33:18', 'approved', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL),
(85, '5555-5555', 'light', 'uniform_policy', '[\"Marked absent due to improper uniform\"]', '', 'security/uploads/1763816381_0_IMG_20250320_0003.jpg', '[\"security\\/uploads\\/1763816381_0_IMG_20250320_0003.jpg\",\"security\\/uploads\\/1763816381_1_IMG_20250407_0001.jpg\",\"security\\/uploads\\/1763816381_2_IMG_20250407_0002.pdf\"]', '2025-11-22 20:59:41', 'pending', 0, NULL, NULL, NULL, NULL, '9090-9090', 'security', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `super_admin`
--

CREATE TABLE `super_admin` (
  `record_id` int(11) NOT NULL,
  `id_number` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `super_admin`
--

INSERT INTO `super_admin` (`record_id`, `id_number`, `first_name`, `last_name`, `mobile`, `email`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 'superadmin@test.com', '2025-09-12 17:11:33', '2025-09-12 17:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `validator_account`
--

CREATE TABLE `validator_account` (
  `validator_id` int(11) NOT NULL,
  `v_username` varchar(50) NOT NULL,
  `v_password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `expires_at` datetime NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `email` varchar(50) NOT NULL,
  `validator_type` enum('inside','outside') NOT NULL DEFAULT 'inside',
  `designation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `validator_account`
--

INSERT INTO `validator_account` (`validator_id`, `v_username`, `v_password`, `created_at`, `expires_at`, `active`, `email`, `validator_type`, `designation`) VALUES
(1, 'Geonna', '$2y$10$rf3FOycQMV5jtFvADS4GEO.CZpDmTk5sqjEUzTcdFvmdHvUjrQ906', '2025-09-15 04:57:09', '0000-00-00 00:00:00', 1, '', 'inside', NULL),
(2, 'Aaron Manaloto', '', '2025-09-15 04:59:47', '0000-00-00 00:00:00', 1, '', 'inside', NULL),
(3, 'Maria Angelica', '', '2025-09-15 05:00:14', '0000-00-00 00:00:00', 1, '', 'inside', NULL),
(4, 'Algernon Angeles', '2Z4y99FRBGSU', '2025-09-15 05:36:28', '0000-00-00 00:00:00', 1, '', 'inside', NULL),
(5, 'rtgrfwedw', '14*kwtU$JC', NULL, '0000-00-00 00:00:00', 1, 'ddrgs@test.com', 'inside', NULL),
(6, 'abrvjknlk', 'lIxxuqjQjPWD', '2025-09-18 03:30:37', '0000-00-00 00:00:00', 1, 'erbIUB@Ttest.com', 'inside', NULL),
(7, 'sduvhoisdh', '910PqsZ@Gp', '2025-09-18 03:43:46', '0000-00-00 00:00:00', 0, 'dsddinoi@test.com', 'outside', 'LIBRARY'),
(10, 'Lyzzet', '$2y$10$Mr1045stLBoPSK/Rtn4IyO45dcOPPjKPSo0u/q3OxVGfRIC0jRUhW', '2025-10-08 01:16:55', '0000-00-00 00:00:00', 1, 'kuropm23@gmail.com', 'inside', 'Maintenance');

-- --------------------------------------------------------

--
-- Table structure for table `validator_student_assignment`
--

CREATE TABLE `validator_student_assignment` (
  `assignment_id` int(11) NOT NULL,
  `validator_id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `starts_at` datetime NOT NULL DEFAULT current_timestamp(),
  `ends_at` datetime DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `assigned_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `validator_student_assignment`
--

INSERT INTO `validator_student_assignment` (`assignment_id`, `validator_id`, `student_id`, `starts_at`, `ends_at`, `notes`, `assigned_at`) VALUES
(13, 10, '5555-5555', '2025-10-09 02:28:24', NULL, NULL, '2025-10-19 19:38:45'),
(15, 2, '5555-5555', '2025-09-18 08:54:41', NULL, NULL, '2025-09-20 13:28:15'),
(18, 7, '5555-5555', '2025-09-20 13:27:55', NULL, NULL, '2025-09-20 13:35:06'),
(19, 5, '5555-5555', '2025-09-20 13:36:13', NULL, NULL, '2025-09-25 20:58:45'),
(20, 5, '7777-7777', '2025-09-25 21:28:58', NULL, NULL, '2025-09-25 21:28:58'),
(21, 10, '8472-8649', '2025-10-09 01:28:00', NULL, NULL, '2025-10-19 21:08:38'),
(23, 10, '9854-9556', '2025-10-08 20:55:11', NULL, NULL, '2025-10-09 02:20:06'),
(33, 10, '2223-0775', '2025-10-08 01:20:45', NULL, NULL, '2025-10-25 14:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `violation_category`
--

CREATE TABLE `violation_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `violation_category`
--

INSERT INTO `violation_category` (`category_id`, `category_name`, `description`, `sort_order`, `is_active`) VALUES
(2, 'Light', '', 0, 1),
(3, 'Moderate', '', 0, 1),
(4, 'Grave', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `violation_detail`
--

CREATE TABLE `violation_detail` (
  `detail_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `detail_name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `violation_detail`
--

INSERT INTO `violation_detail` (`detail_id`, `type_id`, `detail_name`, `description`, `sort_order`, `is_active`) VALUES
(1, 4, 'Smoking', '', 0, 1),
(2, 4, 'Gambling', '', 0, 1),
(3, 4, 'Drunkeness', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `violation_details`
--

CREATE TABLE `violation_details` (
  `detail_id` int(11) NOT NULL,
  `violation_id` int(11) NOT NULL,
  `offense_code` varchar(100) NOT NULL,
  `offense_label` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `violation_type`
--

CREATE TABLE `violation_type` (
  `type_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `type_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `violation_type`
--

INSERT INTO `violation_type` (`type_id`, `category_id`, `type_name`, `description`, `sort_order`, `is_active`) VALUES
(3, 2, 'Improper Uniform', '', 0, 1),
(4, 4, 'Substance and Addiction', '', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `id_number` (`id_number`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `admin_account`
--
ALTER TABLE `admin_account`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `ccdu_account`
--
ALTER TABLE `ccdu_account`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `community_service_entries`
--
ALTER TABLE `community_service_entries`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `violation_id` (`violation_id`),
  ADD KEY `validator_id` (`validator_id`),
  ADD KEY `service_date` (`service_date`);

--
-- Indexes for table `community_service_evidence`
--
ALTER TABLE `community_service_evidence`
  ADD PRIMARY KEY (`evidence_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `validator_id` (`validator_id`);

--
-- Indexes for table `faculty_account`
--
ALTER TABLE `faculty_account`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `gmrc_certificate_logs`
--
ALTER TABLE `gmrc_certificate_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmrc_requests`
--
ALTER TABLE `gmrc_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_target` (`target_role`,`target_user_id`,`read_at`,`created_at`),
  ADD KEY `idx_violation` (`violation_id`);

--
-- Indexes for table `security_account`
--
ALTER TABLE `security_account`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `student_account`
--
ALTER TABLE `student_account`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `student_qr_keys`
--
ALTER TABLE `student_qr_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `qr_key` (`qr_key`),
  ADD KEY `idx_qr_student_id` (`student_id`);

--
-- Indexes for table `student_violation`
--
ALTER TABLE `student_violation`
  ADD PRIMARY KEY (`violation_id`),
  ADD KEY `idx_violation_student` (`student_id`),
  ADD KEY `idx_violation_status` (`status`,`reported_at`),
  ADD KEY `idx_violation_student_status` (`student_id`,`status`),
  ADD KEY `idx_violation_submitter` (`submitted_by`,`status`),
  ADD KEY `idx_student_violation_isvoid` (`is_void`);

--
-- Indexes for table `super_admin`
--
ALTER TABLE `super_admin`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `validator_account`
--
ALTER TABLE `validator_account`
  ADD PRIMARY KEY (`validator_id`),
  ADD UNIQUE KEY `username` (`v_username`);

--
-- Indexes for table `validator_student_assignment`
--
ALTER TABLE `validator_student_assignment`
  ADD PRIMARY KEY (`assignment_id`),
  ADD UNIQUE KEY `uniq_validator_student` (`validator_id`,`student_id`),
  ADD KEY `idx_validator` (`validator_id`),
  ADD KEY `idx_student` (`student_id`);

--
-- Indexes for table `violation_category`
--
ALTER TABLE `violation_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `violation_detail`
--
ALTER TABLE `violation_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `violation_details`
--
ALTER TABLE `violation_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `fk_violation_details_violation` (`violation_id`);

--
-- Indexes for table `violation_type`
--
ALTER TABLE `violation_type`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `admin_account`
--
ALTER TABLE `admin_account`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ccdu_account`
--
ALTER TABLE `ccdu_account`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `community_service_entries`
--
ALTER TABLE `community_service_entries`
  MODIFY `entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `community_service_evidence`
--
ALTER TABLE `community_service_evidence`
  MODIFY `evidence_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty_account`
--
ALTER TABLE `faculty_account`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gmrc_certificate_logs`
--
ALTER TABLE `gmrc_certificate_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gmrc_requests`
--
ALTER TABLE `gmrc_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `security_account`
--
ALTER TABLE `security_account`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_account`
--
ALTER TABLE `student_account`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `student_qr_keys`
--
ALTER TABLE `student_qr_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `student_violation`
--
ALTER TABLE `student_violation`
  MODIFY `violation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `super_admin`
--
ALTER TABLE `super_admin`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `validator_account`
--
ALTER TABLE `validator_account`
  MODIFY `validator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `validator_student_assignment`
--
ALTER TABLE `validator_student_assignment`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `violation_category`
--
ALTER TABLE `violation_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `violation_detail`
--
ALTER TABLE `violation_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `violation_details`
--
ALTER TABLE `violation_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `violation_type`
--
ALTER TABLE `violation_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `community_service_evidence`
--
ALTER TABLE `community_service_evidence`
  ADD CONSTRAINT `community_service_evidence_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_account` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_service_evidence_ibfk_2` FOREIGN KEY (`validator_id`) REFERENCES `validator_account` (`validator_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_qr_keys`
--
ALTER TABLE `student_qr_keys`
  ADD CONSTRAINT `fk_qr_student` FOREIGN KEY (`student_id`) REFERENCES `student_account` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_violation`
--
ALTER TABLE `student_violation`
  ADD CONSTRAINT `fk_violation_student` FOREIGN KEY (`student_id`) REFERENCES `student_account` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `validator_student_assignment`
--
ALTER TABLE `validator_student_assignment`
  ADD CONSTRAINT `validator_student_assignment_ibfk_1` FOREIGN KEY (`validator_id`) REFERENCES `validator_account` (`validator_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `validator_student_assignment_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student_account` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `violation_detail`
--
ALTER TABLE `violation_detail`
  ADD CONSTRAINT `violation_detail_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `violation_type` (`type_id`) ON DELETE CASCADE;

--
-- Constraints for table `violation_details`
--
ALTER TABLE `violation_details`
  ADD CONSTRAINT `fk_violation_details_violation` FOREIGN KEY (`violation_id`) REFERENCES `student_violation` (`violation_id`) ON DELETE CASCADE;

--
-- Constraints for table `violation_type`
--
ALTER TABLE `violation_type`
  ADD CONSTRAINT `violation_type_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `violation_category` (`category_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
