-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2022 at 10:27 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recruitment_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `id` int(30) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `cover_letter` text NOT NULL,
  `position_id` int(30) NOT NULL,
  `resume_path` text NOT NULL,
  `process_id` tinyint(30) NOT NULL DEFAULT 0 COMMENT '0=for review\r\n',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `email`, `contact`, `address`, `cover_letter`, `position_id`, `resume_path`, `process_id`, `date_created`) VALUES
(2, 'John', 'C', 'Smith', 'Male', 'jsmith@sample.com', '+18456-5455-55', 'Sample Address', 'Good Day,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&amp;#x2019;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, '1601271300_sample.pdf', 0, '2020-09-28 13:35:38'),
(7, 'Thanh', 'Thị', 'Đào', 'Nữ', 'montapu20899@gmail.com', '0899506577', '119A, Cần Thơ', 'T&ocirc;i vừa tốt nghiệp mới ra trường. C&ograve;n thiếu kinh nghiệm nhưng sẽ nổ lực hơn. Mong qu&yacute; c&ocirc;ng ty x&eacute;t duyệt', 178, '1653460800_DAO-THI-THANH.pdf', 0, '2022-05-25 06:40:09');

-- --------------------------------------------------------

--
-- Table structure for table `recruiter`
--

CREATE TABLE `recruiter` (
  `id_user` int(10) NOT NULL,
  `name_user` varchar(50) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `name_login` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `position_user` text NOT NULL,
  `phone` int(20) NOT NULL,
  `email` text NOT NULL,
  `gender` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recruiter`
--

INSERT INTO `recruiter` (`id_user`, `name_user`, `birthday`, `name_login`, `pass`, `company_name`, `position_user`, `phone`, `email`, `gender`) VALUES
(4, 'Phương Thanh', '20/8/1999', 'thanh20899', '123', 'VNPT', 'HR', 123456, 'abc@gmail.com', 'Nữ'),
(5, 'Thanh Đào', '20/8/1999', 'thanh99', '123', 'FPT', 'HR', 123456, 'abc@gmail.com', 'Nữ'),
(6, 'Thanh Đào', '20/8/1999', 'thanh99', '123', 'FPT', 'HR', 123456, 'abc@gmail.com', 'Nữ'),
(7, 'Bình', '7/6/1992', 'binh92', '123', 'VNPT', 'HR', 123456, 'abc@gmail.com', 'Nữ');

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_status`
--

CREATE TABLE `recruitment_status` (
  `id` int(30) NOT NULL,
  `status_label` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recruitment_status`
--

INSERT INTO `recruitment_status` (`id`, `status_label`, `status`) VALUES
(1, 'For Initial Interview', 1),
(2, 'PASSED II', 1),
(3, 'FAILED II', 1),
(4, 'For Final Interview', 1),
(5, 'PASSED FI', 1),
(6, 'FAILED FI', 1),
(7, 'FOR POOLING', 1),
(8, 'Job Offer', 1),
(9, 'Hired', 1),
(10, 'Withdraw Application', 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Hệ thống tuyển dụng việc làm', 'ctu.edu@sample.com', '0292 3832 663', '1601264160_recruitment-cover.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span class=&quot;LrzXr&quot; style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;Khu II, Đ. 3/2, Xu&acirc;n Kh&aacute;nh, Ninh Kiều, Cần Thơ&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p class=&quot;wDYxhc&quot; data-attrid=&quot;kc:/location/location:hours&quot; data-md=&quot;1005&quot; lang=&quot;vi-VN&quot; data-hveid=&quot;CE8QAA&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQkCl6BAhPEAA&quot; style=&quot;clear: none; padding-left: 15px; padding-right: 15px;&quot;&gt;&lt;/p&gt;&lt;p jscontroller=&quot;ncqIyf&quot; class=&quot;zloOqf PZPZlf&quot; jsaction=&quot;rcuQ6b:npT2md&quot; style=&quot;text-align: center; margin-top: 7px;&quot;&gt;&lt;span class=&quot;w8qArf&quot; style=&quot;font-weight: bolder;&quot;&gt;&lt;a class=&quot;fl&quot; href=&quot;https://www.google.com/search?rlz=1C1CHWL_enVN990VN990&amp;amp;sxsrf=ALiCzsa5FwXNxDHd4gj5YeT4sEAhrcTtFA:1653459149661&amp;amp;q=tr%C6%B0%E1%BB%9Dng+%C4%91%E1%BA%A1i+h%E1%BB%8Dc+c%E1%BA%A7n+th%C6%A1+%C4%91i%E1%BB%87n+tho%E1%BA%A1i&amp;amp;ludocid=11346449839738934224&amp;amp;sa=X&amp;amp;ved=2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BN6BAhUEAI&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BN6BAhUEAI&quot; style=&quot;text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); outline: 0px; color: rgb(32, 33, 36) !important;&quot;&gt;Điện thoại&lt;/a&gt;:&amp;nbsp;&lt;/span&gt;&lt;span class=&quot;LrzXr zdqRlf kno-fv&quot; style=&quot;color: rgb(32, 33, 36);&quot;&gt;&lt;a data-dtype=&quot;d3ph&quot; data-local-attribute=&quot;d3ph&quot; jscontroller=&quot;LWZElb&quot; href=&quot;https://www.google.com/search?gs_ssp=eJzj4tLP1TcwKjIrz600YPTiTy4p1UtNKdUry1PIKCnMAQCE3gl0&amp;amp;q=ctu.edu.vn+htql&amp;amp;rlz=1C1CHWL_enVN990VN990&amp;amp;oq=ctu.ed&amp;amp;aqs=chrome.0.46i512j69i57j0i512l3j69i60l3.4930j0j7&amp;amp;sourceid=chrome&amp;amp;ie=UTF-8#&quot; jsdata=&quot;QKGTRc;_;Ajv6y0&quot; jsaction=&quot;rcuQ6b:npT2md;F75qrd&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQkAgoAHoECFQQAw&quot; style=&quot;color: rgb(26, 13, 171); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); outline: 0px;&quot;&gt;&lt;span aria-label=&quot;Gọi đến số điện thoại 0292 3832 663&quot;&gt;0292 3832 663&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;/p&gt;&lt;p class=&quot;TzHB6b cLjAic&quot; jscontroller=&quot;nPaQu&quot; jsaction=&quot;rcuQ6b:npT2md;jQLCKe:VimORe;&quot; jsdata=&quot;PhoHd;_;Ajv6yI&quot; data-hveid=&quot;CGcQAA&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ04gCKAB6BAhnEAA&quot; style=&quot;margin-bottom: 0px; color: rgb(32, 33, 36); font-family: arial, sans-serif;&quot;&gt;&lt;/p&gt;&lt;p jsname=&quot;xQjRM&quot;&gt;&lt;/p&gt;&lt;p class=&quot;sATSHe&quot;&gt;&lt;/p&gt;&lt;p class=&quot;LuVEUc B03h3d P6OZi V14nKc i8qq8b ptcLIOszQJu__wholepage-card wp-ms&quot; data-hveid=&quot;CGYQAA&quot;&gt;&lt;/p&gt;&lt;p class=&quot;UDZeY OTFaAf&quot;&gt;&lt;/p&gt;&lt;p class=&quot;noQ1ef Nhsae&quot;&gt;&lt;p class=&quot;wDYxhc&quot; data-attrid=&quot;ss:/webfacts:thanh_vien&quot; data-md=&quot;1001&quot; lang=&quot;vi-VN&quot; data-hveid=&quot;CGMQAA&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQkCl6BAhjEAA&quot; style=&quot;clear: none; padding-left: 15px; padding-right: 15px;&quot;&gt;&lt;p class=&quot;Z1hOCe&quot;&gt;&lt;p class=&quot;zloOqf PZPZlf&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQyxMoAHoECGMQAQ&quot; style=&quot;margin-top: 7px;&quot;&gt;&lt;p class=&quot;rVusze&quot;&gt;&lt;div style=&quot;text-align: center;&quot;&gt;&lt;span class=&quot;w8qArf&quot; style=&quot;font-weight: bolder;&quot;&gt;&lt;a class=&quot;fl&quot; href=&quot;https://www.google.com/search?rlz=1C1CHWL_enVN990VN990&amp;amp;sxsrf=ALiCzsa5FwXNxDHd4gj5YeT4sEAhrcTtFA:1653459149661&amp;amp;q=tr%C6%B0%E1%BB%9Dng+%C4%91%E1%BA%A1i+h%E1%BB%8Dc+c%E1%BA%A7n+th%C6%A1+th%C3%A0nh+vi%C3%AAn&amp;amp;sa=X&amp;amp;ved=2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECGMQAg&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECGMQAg&quot; style=&quot;text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); outline: 0px; color: rgb(32, 33, 36) !important;&quot;&gt;Th&agrave;nh vi&ecirc;n&lt;/a&gt;:&amp;nbsp;&lt;/span&gt;&lt;span class=&quot;LrzXr kno-fv wHYlTd z8gr9e&quot; style=&quot;font-family: arial, sans-serif; line-height: 22px; color: rgb(60, 64, 67);&quot;&gt;Ph&acirc;n hiệu&amp;nbsp;&lt;a class=&quot;fl&quot; href=&quot;https://www.google.com/search?rlz=1C1CHWL_enVN990VN990&amp;amp;sxsrf=ALiCzsa5FwXNxDHd4gj5YeT4sEAhrcTtFA:1653459149661&amp;amp;q=S%C3%B3c+Tr%C4%83ng&amp;amp;stick=H4sIAAAAAAAAAONgVuLUz9U3MM81MipaxModfHhzskJI0ZHmvHQAQ_A7lRsAAAA&amp;amp;sa=X&amp;amp;ved=2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQmxMoAXoECGMQAw&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQmxMoAXoECGMQAw&quot; style=&quot;color: rgb(26, 13, 171); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); outline: 0px;&quot;&gt;S&oacute;c Trăng&lt;/a&gt;&amp;nbsp;v&agrave;&amp;nbsp;&lt;a class=&quot;fl&quot; href=&quot;https://www.google.com/search?rlz=1C1CHWL_enVN990VN990&amp;amp;sxsrf=ALiCzsa5FwXNxDHd4gj5YeT4sEAhrcTtFA:1653459149661&amp;amp;q=H%C3%B2a+An&amp;amp;stick=H4sIAAAAAAAAAONgVuLRT9c3zEiKT4-vykpexMrucXhTooJjHgB_V9ufGgAAAA&amp;amp;sa=X&amp;amp;ved=2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQmxMoAnoECGMQBA&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQmxMoAnoECGMQBA&quot; style=&quot;color: rgb(26, 13, 171); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); outline: 0px;&quot;&gt;H&ograve;a An&lt;/a&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p class=&quot;noQ1ef Nhsae&quot;&gt;&lt;/p&gt;&lt;p class=&quot;wDYxhc&quot; data-attrid=&quot;kc:/organization/organization:founded&quot; data-md=&quot;1001&quot; lang=&quot;vi-VN&quot; data-hveid=&quot;CF8QAA&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQkCl6BAhfEAA&quot; style=&quot;clear: none; padding-left: 15px; padding-right: 15px;&quot;&gt;&lt;/p&gt;&lt;p class=&quot;Z1hOCe&quot;&gt;&lt;/p&gt;&lt;p class=&quot;zloOqf PZPZlf&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQyxMoAHoECF8QAQ&quot; style=&quot;margin-top: 7px;&quot;&gt;&lt;/p&gt;&lt;p class=&quot;rVusze&quot; style=&quot;text-align: center;&quot;&gt;&lt;span class=&quot;w8qArf&quot; style=&quot;font-weight: bolder;&quot;&gt;&lt;a class=&quot;fl&quot; href=&quot;https://www.google.com/search?rlz=1C1CHWL_enVN990VN990&amp;amp;sxsrf=ALiCzsa5FwXNxDHd4gj5YeT4sEAhrcTtFA:1653459149661&amp;amp;q=tr%C6%B0%E1%BB%9Dng+%C4%91%E1%BA%A1i+h%E1%BB%8Dc+c%E1%BA%A7n+th%C6%A1+ng%C3%A0y+th%C3%A0nh+l%E1%BA%ADp&amp;amp;stick=H4sIAAAAAAAAAOPgE-LSz9U3MCoyK8-t1FLNTrbSzy9KT8zLrEosyczPQ-FYpeWX5qWkpixiNSkpOrbh4e65eekKRyY-3LUwUyHj4e7eZIXkh7uW5ymUZBxbqJCXfnhBJZB5eEFehkLOw11rCwBA35nabAAAAA&amp;amp;sa=X&amp;amp;ved=2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECF8QAg&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECF8QAg&quot; style=&quot;text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); outline: 0px; color: rgb(32, 33, 36) !important;&quot;&gt;Ng&agrave;y th&agrave;nh lập&lt;/a&gt;:&amp;nbsp;&lt;/span&gt;&lt;span class=&quot;LrzXr kno-fv wHYlTd z8gr9e&quot; style=&quot;font-family: arial, sans-serif; line-height: 22px; color: rgb(60, 64, 67);&quot;&gt;31 th&aacute;ng 3, 1966&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p class=&quot;noQ1ef Nhsae&quot;&gt;&lt;/p&gt;&lt;p class=&quot;wDYxhc&quot; data-attrid=&quot;ss:/webfacts:giang_vien&quot; data-md=&quot;1001&quot; lang=&quot;vi-VN&quot; data-hveid=&quot;CF4QAA&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQkCl6BAheEAA&quot; style=&quot;clear: none; padding-left: 15px; padding-right: 15px;&quot;&gt;&lt;/p&gt;&lt;p class=&quot;Z1hOCe&quot;&gt;&lt;/p&gt;&lt;p class=&quot;zloOqf PZPZlf&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQyxMoAHoECF4QAQ&quot; style=&quot;margin-top: 7px;&quot;&gt;&lt;/p&gt;&lt;p class=&quot;rVusze&quot; style=&quot;text-align: center;&quot;&gt;&lt;span class=&quot;w8qArf&quot; style=&quot;font-weight: bolder;&quot;&gt;&lt;a class=&quot;fl&quot; href=&quot;https://www.google.com/search?rlz=1C1CHWL_enVN990VN990&amp;amp;sxsrf=ALiCzsa5FwXNxDHd4gj5YeT4sEAhrcTtFA:1653459149661&amp;amp;q=tr%C6%B0%E1%BB%9Dng+%C4%91%E1%BA%A1i+h%E1%BB%8Dc+c%E1%BA%A7n+th%C6%A1+gi%E1%BA%A3ng+vi%C3%AAn&amp;amp;sa=X&amp;amp;ved=2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECF4QAg&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECF4QAg&quot; style=&quot;text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); outline: 0px; color: rgb(32, 33, 36) !important;&quot;&gt;Giảng vi&ecirc;n&lt;/a&gt;:&amp;nbsp;&lt;/span&gt;&lt;span class=&quot;LrzXr kno-fv wHYlTd z8gr9e&quot; style=&quot;font-family: arial, sans-serif; line-height: 22px; color: rgb(60, 64, 67);&quot;&gt;1.130 người&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p class=&quot;noQ1ef Nhsae&quot;&gt;&lt;/p&gt;&lt;p class=&quot;wDYxhc&quot; data-attrid=&quot;ss:/webfacts:loai&quot; data-md=&quot;1001&quot; lang=&quot;vi-VN&quot; data-hveid=&quot;CGQQAA&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQkCl6BAhkEAA&quot; style=&quot;clear: none; padding-left: 15px; padding-right: 15px;&quot;&gt;&lt;/p&gt;&lt;p class=&quot;Z1hOCe&quot;&gt;&lt;/p&gt;&lt;p class=&quot;zloOqf PZPZlf&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQyxMoAHoECGQQAQ&quot; style=&quot;margin-top: 7px;&quot;&gt;&lt;/p&gt;&lt;p class=&quot;rVusze&quot; style=&quot;text-align: center;&quot;&gt;&lt;span class=&quot;w8qArf&quot; style=&quot;font-weight: bolder;&quot;&gt;&lt;a class=&quot;fl&quot; href=&quot;https://www.google.com/search?rlz=1C1CHWL_enVN990VN990&amp;amp;sxsrf=ALiCzsa5FwXNxDHd4gj5YeT4sEAhrcTtFA:1653459149661&amp;amp;q=tr%C6%B0%E1%BB%9Dng+%C4%91%E1%BA%A1i+h%E1%BB%8Dc+c%E1%BA%A7n+th%C6%A1+lo%E1%BA%A1i&amp;amp;sa=X&amp;amp;ved=2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECGQQAg&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECGQQAg&quot; style=&quot;text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); outline: 0px; color: rgb(32, 33, 36) !important;&quot;&gt;Loại&lt;/a&gt;:&amp;nbsp;&lt;/span&gt;&lt;span class=&quot;LrzXr kno-fv wHYlTd z8gr9e&quot; style=&quot;font-family: arial, sans-serif; line-height: 22px; color: rgb(60, 64, 67);&quot;&gt;Đại học đa ng&agrave;nh hệ c&ocirc;ng lập&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p class=&quot;noQ1ef Nhsae&quot;&gt;&lt;/p&gt;&lt;p class=&quot;wDYxhc&quot; data-attrid=&quot;hw:/collection/employers:academic staff&quot; data-md=&quot;1001&quot; lang=&quot;vi-VN&quot; data-hveid=&quot;CGEQAA&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQkCl6BAhhEAA&quot; style=&quot;clear: none; padding-left: 15px; padding-right: 15px;&quot;&gt;&lt;/p&gt;&lt;p class=&quot;Z1hOCe&quot;&gt;&lt;/p&gt;&lt;p class=&quot;zloOqf PZPZlf&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQyxMoAHoECGEQAQ&quot; style=&quot;margin-top: 7px;&quot;&gt;&lt;/p&gt;&lt;p class=&quot;rVusze&quot; style=&quot;text-align: center;&quot;&gt;&lt;span class=&quot;w8qArf&quot; style=&quot;font-weight: bolder;&quot;&gt;&lt;a class=&quot;fl&quot; href=&quot;https://www.google.com/search?rlz=1C1CHWL_enVN990VN990&amp;amp;sxsrf=ALiCzsa5FwXNxDHd4gj5YeT4sEAhrcTtFA:1653459149661&amp;amp;q=tr%C6%B0%E1%BB%9Dng+%C4%91%E1%BA%A1i+h%E1%BB%8Dc+c%E1%BA%A7n+th%C6%A1+nh%C3%A2n+vi%C3%AAn+gi%C3%A1o+v%E1%BB%A5&amp;amp;stick=H4sIAAAAAAAAAAFyAI3_CA4SCi9tLzAycjZ3bXkqJ2h3Oi9jb2xsZWN0aW9uL2VtcGxveWVyczphY2FkZW1pYyBzdGFmZqIFOHRyxrDhu51uZyDEkeG6oWkgaOG7jWMgY-G6p24gdGjGoSBuaMOibiB2acOqbiBnacOhbyB24bulBw3wQ3IAAAA&amp;amp;sa=X&amp;amp;ved=2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECGEQAg&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECGEQAg&quot; style=&quot;text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); outline: 0px; color: rgb(32, 33, 36) !important;&quot;&gt;Nh&acirc;n vi&ecirc;n gi&aacute;o vụ&lt;/a&gt;:&amp;nbsp;&lt;/span&gt;&lt;span class=&quot;LrzXr kno-fv wHYlTd z8gr9e&quot; style=&quot;font-family: arial, sans-serif; line-height: 22px; color: rgb(60, 64, 67);&quot;&gt;15&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p class=&quot;noQ1ef Nhsae&quot;&gt;&lt;/p&gt;&lt;p class=&quot;wDYxhc&quot; data-attrid=&quot;kc:/education/educational_institution:school type&quot; data-md=&quot;1001&quot; lang=&quot;vi-VN&quot; data-hveid=&quot;CGAQAA&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQkCl6BAhgEAA&quot; style=&quot;clear: none; padding-left: 15px; padding-right: 15px;&quot;&gt;&lt;/p&gt;&lt;p class=&quot;Z1hOCe&quot;&gt;&lt;/p&gt;&lt;p class=&quot;zloOqf PZPZlf&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQyxMoAHoECGAQAQ&quot; style=&quot;margin-top: 7px;&quot;&gt;&lt;/p&gt;&lt;p class=&quot;rVusze&quot; style=&quot;text-align: center;&quot;&gt;&lt;span class=&quot;w8qArf&quot; style=&quot;font-weight: bolder;&quot;&gt;&lt;a class=&quot;fl&quot; href=&quot;https://www.google.com/search?rlz=1C1CHWL_enVN990VN990&amp;amp;sxsrf=ALiCzsa5FwXNxDHd4gj5YeT4sEAhrcTtFA:1653459149661&amp;amp;q=tr%C6%B0%E1%BB%9Dng+%C4%91%E1%BA%A1i+h%E1%BB%8Dc+c%E1%BA%A7n+th%C6%A1+lo%E1%BA%A1i+tr%C6%B0%E1%BB%9Dng+h%E1%BB%8Dc&amp;amp;stick=H4sIAAAAAAAAAOPgE-LSz9U3MCoyK8-t1DLMTrbST00pTU4syczPQ7ASc-Iz84pLMktKQTyr4uSM_PwchZLKgtRFrBYlRcc2PNw9Ny9d4cjEh7sWZipkPNzdm6yQ_HDX8jyFkoxjCxVy8sHiCIVgFQAwRxZKfAAAAA&amp;amp;sa=X&amp;amp;ved=2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECGAQAg&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQ6BMoAHoECGAQAg&quot; style=&quot;text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); outline: 0px; color: rgb(32, 33, 36) !important;&quot;&gt;Loại trường học&lt;/a&gt;:&amp;nbsp;&lt;/span&gt;&lt;span class=&quot;LrzXr kno-fv wHYlTd z8gr9e&quot; style=&quot;font-family: arial, sans-serif; line-height: 22px; color: rgb(60, 64, 67);&quot;&gt;&lt;a class=&quot;fl&quot; href=&quot;https://www.google.com/search?rlz=1C1CHWL_enVN990VN990&amp;amp;sxsrf=ALiCzsa5FwXNxDHd4gj5YeT4sEAhrcTtFA:1653459149661&amp;amp;q=%C4%90%E1%BA%A1i+h%E1%BB%8Dc&amp;amp;stick=H4sIAAAAAAAAAOPgE-LSz9U3MCoyK8-tVOIAsc1L0iy0DLOTrfRTU0qTE0sy8_MQrMSc-My84pLMklIQz6o4OSM_P0ehpLIgdRErz5EJD3ctzFTIeLi7N3kHK-MudiYOBgAc03QGYgAAAA&amp;amp;sa=X&amp;amp;ved=2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQmxMoAXoECGAQAw&quot; data-ved=&quot;2ahUKEwiCgZCq__n3AhVjIbcAHZcHDWwQmxMoAXoECGAQAw&quot; style=&quot;color: rgb(26, 13, 171); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); outline: 0px;&quot;&gt;Đại học&lt;/a&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;/p&gt;&lt;/p&gt;&lt;/p&gt;&lt;/p&gt;&lt;/div&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'admin', 'admin123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vacancy`
--

CREATE TABLE `vacancy` (
  `id` int(30) NOT NULL,
  `position` varchar(200) NOT NULL,
  `availability` int(30) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `name_company` varchar(200) NOT NULL,
  `logo_company` varchar(200) NOT NULL,
  `time_company` time NOT NULL,
  `date_company` text NOT NULL,
  `address_company` varchar(200) NOT NULL,
  `email_company` text NOT NULL,
  `money` text NOT NULL,
  `fk_recruiter` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vacancy`
--

INSERT INTO `vacancy` (`id`, `position`, `availability`, `description`, `status`, `date_created`, `name_company`, `logo_company`, `time_company`, `date_company`, `address_company`, `email_company`, `money`, `fk_recruiter`) VALUES
(178, ' Kỹ thuật viên ', 2, '&lt;p&gt;&lt;strong&gt;&nbsp;1.&nbsp;&lt;/strong&gt;&lt;strong&gt;Vị tr&iacute;: Kỹ thuật vi&ecirc;n, Bộ m&ocirc;n Kỹ thuật nu&ocirc;i hải sản (01 người)&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;em&gt;* Y&ecirc;u cầu:&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tốt nghiệp Trung cấp ng&agrave;nh: Nu&ocirc;i trồng thủy sản;&lt;/p&gt;\r\n\r\n&lt;p&gt;- C&oacute; kinh nghiệm trong nu&ocirc;i t&ocirc;m;&lt;/p&gt;\r\n\r\n&lt;p&gt;- C&ocirc;ng việc dự kiến: Hỗ trợ thực hiện c&aacute;c đề t&agrave;i nghi&ecirc;n cứu khoa học v&agrave; triển khai c&aacute;c hoạt động thực nghiệm tại trại Vĩnh Ch&acirc;u.&lt;/p&gt;\r\n\r\n&lt;p&gt;* Dự kiến hợp đồng lao động c&oacute; thời hạn từ th&aacute;ng 6/2022 đến th&aacute;ng 6/2023, nguồn kinh ph&iacute; chi trả tiền lương từ Đề t&agrave;i: Ứng dụng sản phẩm microbe-lift trong ao nu&ocirc;i t&ocirc;m thẻ ch&acirc;n trắng, do PGS.TS. L&ecirc; Quốc Việt l&agrave;m chủ nhiệm.&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;strong&gt;2.&nbsp;Hồ sơ xin việc gồm c&oacute;:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Đơn xin việc l&agrave;m&nbsp;&lt;em&gt;(ngo&agrave;i b&igrave; hồ sơ ghi r&otilde; vị tr&iacute; dự tuyển, điện thoại, email nếu c&oacute;)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sơ yếu l&yacute; lịch c&oacute; d&aacute;n ảnh v&agrave; x&aacute;c nhận của ch&iacute;nh quyền địa phương;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Giấy kh&aacute;m sức khỏe;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Văn bằng, chứng chỉ, bảng điểm c&oacute; li&ecirc;n quan&nbsp;&lt;em&gt;(ứng vi&ecirc;n c&oacute; thể nộp bản sao từ sổ gốc, bản sao c&oacute; chứng thực hoặc nộp bản sao xuất tr&igrave;nh k&egrave;m bản ch&iacute;nh để đối chiếu)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;em&gt;(Hồ sơ xin việc c&oacute; b&aacute;n tại Ph&ograve;ng Tổ chức-C&aacute;n bộ,&nbsp; Trường Đại học Cần Thơ)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;*&lt;strong&gt;&nbsp;Thời hạn nhận hồ sơ:&lt;/strong&gt;&nbsp;Kể từ ng&agrave;y ra Th&ocirc;ng b&aacute;o đến hết ng&agrave;y&nbsp;&lt;strong&gt;11&lt;/strong&gt;&lt;strong&gt;/&lt;/strong&gt;&lt;strong&gt;6&lt;/strong&gt;&lt;strong&gt;/202&lt;/strong&gt;&lt;strong&gt;2&lt;/strong&gt;&lt;strong&gt;.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;*&lt;strong&gt;&nbsp;Địa chỉ li&ecirc;n hệ v&agrave; nộp hồ sơ:&lt;/strong&gt;&nbsp;Ph&ograve;ng Tổ chức-C&aacute;n bộ, Trường Đại học Cần Thơ (Lầu 2, Nh&agrave; Điều h&agrave;nh Trường Đại học Cần Thơ) khu II, đường 3/2, phường Xu&acirc;n Kh&aacute;nh, quận Ninh Kiều, TP.Cần Thơ. Ứng vi&ecirc;n c&oacute; thể nộp hồ sơ qua đường bưu điện.&lt;/p&gt;\r\n\r\n&lt;p&gt;&gt;&lt;/p&gt;\r\n', 1, '2022-05-25 05:27:29', 'Trung tâm Công nghệ Phần mềm đại học Cần Thơ', '1653499260_CTU.png', '19:00:00', 'Thứ hai - Thứ sáu', '3/2, phường Xuân Khánh, quận Ninh Kiều, TP.Cần Thơ', 'ctu.edu.vn', '10.000.000đ - 15.000.000đ', 6),
(181, 'Chuyên viên', 2, '&lt;p&gt;&lt;strong&gt;1.&nbsp;&lt;/strong&gt;&lt;strong&gt;Vị tr&iacute;: Kỹ thuật vi&ecirc;n, Bộ m&ocirc;n Kỹ thuật nu&ocirc;i hải sản (01 người)&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;em&gt;* Y&ecirc;u cầu:&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tốt nghiệp Trung cấp ng&agrave;nh: Nu&ocirc;i trồng thủy sản;&lt;/p&gt;\r\n\r\n&lt;p&gt;- C&oacute; kinh nghiệm trong nu&ocirc;i t&ocirc;m;&lt;/p&gt;\r\n\r\n&lt;p&gt;- C&ocirc;ng việc dự kiến: Hỗ trợ thực hiện c&aacute;c đề t&agrave;i nghi&ecirc;n cứu khoa học v&agrave; triển khai c&aacute;c hoạt động thực nghiệm tại trại Vĩnh Ch&acirc;u.&lt;/p&gt;\r\n\r\n&lt;p&gt;* Dự kiến hợp đồng lao động c&oacute; thời hạn từ th&aacute;ng 6/2022 đến th&aacute;ng 6/2023, nguồn kinh ph&iacute; chi trả tiền lương từ Đề t&agrave;i: Ứng dụng sản phẩm microbe-lift trong ao nu&ocirc;i t&ocirc;m thẻ ch&acirc;n trắng, do PGS.TS. L&ecirc; Quốc Việt l&agrave;m chủ nhiệm.&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;strong&gt;2.&nbsp;Hồ sơ xin việc gồm c&oacute;:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Đơn xin việc l&agrave;m&nbsp;&lt;em&gt;(ngo&agrave;i b&igrave; hồ sơ ghi r&otilde; vị tr&iacute; dự tuyển, điện thoại, email nếu c&oacute;)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sơ yếu l&yacute; lịch c&oacute; d&aacute;n ảnh v&agrave; x&aacute;c nhận của ch&iacute;nh quyền địa phương;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Giấy kh&aacute;m sức khỏe;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Văn bằng, chứng chỉ, bảng điểm c&oacute; li&ecirc;n quan&nbsp;&lt;em&gt;(ứng vi&ecirc;n c&oacute; thể nộp bản sao từ sổ gốc, bản sao c&oacute; chứng thực hoặc nộp bản sao xuất tr&igrave;nh k&egrave;m bản ch&iacute;nh để đối chiếu)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;em&gt;(Hồ sơ xin việc c&oacute; b&aacute;n tại Ph&ograve;ng Tổ chức-C&aacute;n bộ,&nbsp; Trường Đại học Cần Thơ)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;*&lt;strong&gt;&nbsp;Thời hạn nhận hồ sơ:&lt;/strong&gt;&nbsp;Kể từ ng&agrave;y ra Th&ocirc;ng b&aacute;o đến hết ng&agrave;y&nbsp;&lt;strong&gt;11&lt;/strong&gt;&lt;strong&gt;/&lt;/strong&gt;&lt;strong&gt;6&lt;/strong&gt;&lt;strong&gt;/202&lt;/strong&gt;&lt;strong&gt;2&lt;/strong&gt;&lt;strong&gt;.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;*&lt;strong&gt;&nbsp;Địa chỉ li&ecirc;n hệ v&agrave; nộp hồ sơ:&lt;/strong&gt;&nbsp;Ph&ograve;ng Tổ chức-C&aacute;n bộ, Trường Đại học Cần Thơ (Lầu 2, Nh&agrave; Điều h&agrave;nh Trường Đại học Cần Thơ) khu II, đường 3/2, phường Xu&acirc;n Kh&aacute;nh, quận Ninh Kiều, TP.Cần Thơ. Ứng vi&ecirc;n c&oacute; thể nộp hồ sơ qua đường bưu điện.&lt;/p&gt;\r\n', 1, '2022-05-25 05:43:08', 'Khoa thủy sản đại học Cần Thơ', '1653508380_1653499380_VNPT.jpg', '19:00:00', 'Thứ hai - Thứ sáu', '3/2, phường Xuân Khánh, quận Ninh Kiều, TP.Cần Thơ', 'ctu.edu.vn', '10.000.000đ - 15.000.000đ', 7),
(182, 'Web Frontend', 2, '&lt;p&gt;&lt;strong&gt;&nbsp;1.&nbsp;&lt;/strong&gt;&lt;strong&gt;Vị tr&iacute;: Kỹ thuật vi&ecirc;n, Bộ m&ocirc;n Kỹ thuật nu&ocirc;i hải sản (01 người)&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;em&gt;* Y&ecirc;u cầu:&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tốt nghiệp Trung cấp ng&agrave;nh: Nu&ocirc;i trồng thủy sản;&lt;/p&gt;\r\n\r\n&lt;p&gt;- C&oacute; kinh nghiệm trong nu&ocirc;i t&ocirc;m;&lt;/p&gt;\r\n\r\n&lt;p&gt;- C&ocirc;ng việc dự kiến: Hỗ trợ thực hiện c&aacute;c đề t&agrave;i nghi&ecirc;n cứu khoa học v&agrave; triển khai c&aacute;c hoạt động thực nghiệm tại trại Vĩnh Ch&acirc;u.&lt;/p&gt;\r\n\r\n&lt;p&gt;* Dự kiến hợp đồng lao động c&oacute; thời hạn từ th&aacute;ng 6/2022 đến th&aacute;ng 6/2023, nguồn kinh ph&iacute; chi trả tiền lương từ Đề t&agrave;i: Ứng dụng sản phẩm microbe-lift trong ao nu&ocirc;i t&ocirc;m thẻ ch&acirc;n trắng, do PGS.TS. L&ecirc; Quốc Việt l&agrave;m chủ nhiệm.&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;strong&gt;2.&nbsp;Hồ sơ xin việc gồm c&oacute;:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Đơn xin việc l&agrave;m&nbsp;&lt;em&gt;(ngo&agrave;i b&igrave; hồ sơ ghi r&otilde; vị tr&iacute; dự tuyển, điện thoại, email nếu c&oacute;)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sơ yếu l&yacute; lịch c&oacute; d&aacute;n ảnh v&agrave; x&aacute;c nhận của ch&iacute;nh quyền địa phương;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Giấy kh&aacute;m sức khỏe;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Văn bằng, chứng chỉ, bảng điểm c&oacute; li&ecirc;n quan&nbsp;&lt;em&gt;(ứng vi&ecirc;n c&oacute; thể nộp bản sao từ sổ gốc, bản sao c&oacute; chứng thực hoặc nộp bản sao xuất tr&igrave;nh k&egrave;m bản ch&iacute;nh để đối chiếu)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;em&gt;(Hồ sơ xin việc c&oacute; b&aacute;n tại Ph&ograve;ng Tổ chức-C&aacute;n bộ,&nbsp; Trường Đại học Cần Thơ)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;*&lt;strong&gt;&nbsp;Thời hạn nhận hồ sơ:&lt;/strong&gt;&nbsp;Kể từ ng&agrave;y ra Th&ocirc;ng b&aacute;o đến hết ng&agrave;y&nbsp;&lt;strong&gt;11&lt;/strong&gt;&lt;strong&gt;/&lt;/strong&gt;&lt;strong&gt;6&lt;/strong&gt;&lt;strong&gt;/202&lt;/strong&gt;&lt;strong&gt;2&lt;/strong&gt;&lt;strong&gt;.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;*&lt;strong&gt;&nbsp;Địa chỉ li&ecirc;n hệ v&agrave; nộp hồ sơ:&lt;/strong&gt;&nbsp;Ph&ograve;ng Tổ chức-C&aacute;n bộ, Trường Đại học Cần Thơ (Lầu 2, Nh&agrave; Điều h&agrave;nh Trường Đại học Cần Thơ) khu II, đường 3/2, phường Xu&acirc;n Kh&aacute;nh, quận Ninh Kiều, TP.Cần Thơ. Ứng vi&ecirc;n c&oacute; thể nộp hồ sơ qua đường bưu điện.&lt;/p&gt;\r\n\r\n&lt;p&gt;&gt;&lt;/p&gt;\r\n', 1, '2022-05-25 05:56:25', 'Trung tâm Công nghệ Phần mềm đại học Cần Thơ', '1653508380_1653499320_Teck.jpg', '19:00:00', 'Thứ hai - Thứ sáu', '3/2, phường Xuân Khánh, quận Ninh Kiều, TP.Cần Thơ', 'ctu.edu.vn', '10.000.000đ - 15.000.000đ', 7),
(183, 'Web Full Stack', 2, '&lt;p&gt;&lt;strong&gt;&nbsp;1.&nbsp;&lt;/strong&gt;&lt;strong&gt;Vị tr&iacute;: Kỹ thuật vi&ecirc;n, Bộ m&ocirc;n Kỹ thuật nu&ocirc;i hải sản (01 người)&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;em&gt;* Y&ecirc;u cầu:&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tốt nghiệp Trung cấp ng&agrave;nh: Nu&ocirc;i trồng thủy sản;&lt;/p&gt;\r\n\r\n&lt;p&gt;- C&oacute; kinh nghiệm trong nu&ocirc;i t&ocirc;m;&lt;/p&gt;\r\n\r\n&lt;p&gt;- C&ocirc;ng việc dự kiến: Hỗ trợ thực hiện c&aacute;c đề t&agrave;i nghi&ecirc;n cứu khoa học v&agrave; triển khai c&aacute;c hoạt động thực nghiệm tại trại Vĩnh Ch&acirc;u.&lt;/p&gt;\r\n\r\n&lt;p&gt;* Dự kiến hợp đồng lao động c&oacute; thời hạn từ th&aacute;ng 6/2022 đến th&aacute;ng 6/2023, nguồn kinh ph&iacute; chi trả tiền lương từ Đề t&agrave;i: Ứng dụng sản phẩm microbe-lift trong ao nu&ocirc;i t&ocirc;m thẻ ch&acirc;n trắng, do PGS.TS. L&ecirc; Quốc Việt l&agrave;m chủ nhiệm.&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;strong&gt;2.&nbsp;Hồ sơ xin việc gồm c&oacute;:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Đơn xin việc l&agrave;m&nbsp;&lt;em&gt;(ngo&agrave;i b&igrave; hồ sơ ghi r&otilde; vị tr&iacute; dự tuyển, điện thoại, email nếu c&oacute;)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sơ yếu l&yacute; lịch c&oacute; d&aacute;n ảnh v&agrave; x&aacute;c nhận của ch&iacute;nh quyền địa phương;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Giấy kh&aacute;m sức khỏe;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Văn bằng, chứng chỉ, bảng điểm c&oacute; li&ecirc;n quan&nbsp;&lt;em&gt;(ứng vi&ecirc;n c&oacute; thể nộp bản sao từ sổ gốc, bản sao c&oacute; chứng thực hoặc nộp bản sao xuất tr&igrave;nh k&egrave;m bản ch&iacute;nh để đối chiếu)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;em&gt;(Hồ sơ xin việc c&oacute; b&aacute;n tại Ph&ograve;ng Tổ chức-C&aacute;n bộ,&nbsp; Trường Đại học Cần Thơ)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;*&lt;strong&gt;&nbsp;Thời hạn nhận hồ sơ:&lt;/strong&gt;&nbsp;Kể từ ng&agrave;y ra Th&ocirc;ng b&aacute;o đến hết ng&agrave;y&nbsp;&lt;strong&gt;11&lt;/strong&gt;&lt;strong&gt;/&lt;/strong&gt;&lt;strong&gt;6&lt;/strong&gt;&lt;strong&gt;/202&lt;/strong&gt;&lt;strong&gt;2&lt;/strong&gt;&lt;strong&gt;.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;*&lt;strong&gt;&nbsp;Địa chỉ li&ecirc;n hệ v&agrave; nộp hồ sơ:&lt;/strong&gt;&nbsp;Ph&ograve;ng Tổ chức-C&aacute;n bộ, Trường Đại học Cần Thơ (Lầu 2, Nh&agrave; Điều h&agrave;nh Trường Đại học Cần Thơ) khu II, đường 3/2, phường Xu&acirc;n Kh&aacute;nh, quận Ninh Kiều, TP.Cần Thơ. Ứng vi&ecirc;n c&oacute; thể nộp hồ sơ qua đường bưu điện.&lt;/p&gt;\r\n\r\n&lt;p&gt;&gt;&lt;/p&gt;\r\n', 1, '2022-05-25 05:57:21', 'VNPT', '1653499380_VNPT.jpg', '19:00:00', 'Thứ hai - Thứ sáu', '3/2, phường Xuân Khánh, quận Ninh Kiều, TP.Cần Thơ', 'vnpt.vn', '10.000.000đ - 15.000.000đ', 7),
(184, 'Giao Dịch Viên', 2, '&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: &amp;quot;Open Sans&amp;quot;, sans-serif; font-size: 16px;&quot;&gt;- Thực hiện c&aacute;c giao dịch tiền mặt v&agrave; phi tiền mặt cho kh&aacute;ch h&agrave;ng theo đ&uacute;ng quy định Techcombank - Kiểm tra c&aacute;c giao dịch/chứng từ ph&aacute;t sinh trong ng&agrave;y - Tiếp nhận c&aacute;c y&ecirc;u cầu/khiếu nại của kh&aacute;ch h&agrave;ng &amp;amp; giải quyết y&ecirc;u cầu/khiếu nại theo đ&uacute;ng quy định của Techcombank&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-05-25 05:58:14', 'Techcombank', '1653500880_Teck.jpg', '19:00:00', 'Thứ hai - Thứ sáu', '3/2, phường Xuân Khánh, quận Ninh Kiều, TP.Cần Thơ', 'techcombank.com.vn', '5.000.000đ - 7.000.000đ', 7),
(185, 'WEB DEVELOPER', 2, '&lt;p&gt;Để tiếp tục mở rộng kế hoạch kinh doanh năm 2022, Tổng C&ocirc;ng ty Viễn th&ocirc;ng MobiFone chi&ecirc;u mộ nh&acirc;n t&agrave;i vị tr&iacute; Lập tr&igrave;nh l&agrave;m việc tại Ph&ograve;ng Dịch vụ kỹ thuật khối Văn ph&ograve;ng C&ocirc;ng ty, thực hiện c&aacute;c nhiệm vụ:&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Thiết kế, x&acirc;y dựng c&aacute;c ứng dụng CNTT tr&ecirc;n m&aacute;y t&iacute;nh (website, fanpage) v&agrave; thiết bị di động (app) &hellip;.;&lt;/li&gt;&lt;li&gt;X&acirc;y dựng c&aacute;c hệ thống b&aacute;o c&aacute;o; x&acirc;y dựng nguồn số liệu; cung cấp v&agrave; ph&acirc;n t&iacute;ch số liệu phục vụ sản xuất kinh doanh;&lt;/li&gt;&lt;li&gt;Quản trị hệ thống c&aacute;c m&aacute;y chủ ứng dụng, CSDL;&lt;/li&gt;&lt;li&gt;Quản l&yacute;, hỗ trợ nghiệp vụ c&aacute;c hệ thống CNTT.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Số lượng tuyển: 05 người&lt;/p&gt;&lt;h3&gt;Y&ecirc;u cầu&lt;/h3&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;1. Tr&igrave;nh độ:&lt;/span&gt;&lt;/p&gt;&lt;p&gt;- Tốt nghiệp đại học:&amp;nbsp;Ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin, chuy&ecirc;n ng&agrave;nh lập tr&igrave;nh, x&acirc;y dựng phần mềm; Biết sử dụng 01 trong c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh (C#, java, Python, reactjs, swift&hellip;)&lt;/p&gt;&lt;p&gt;- Tốt nghiệp hệ ch&iacute;nh quy c&aacute;c trường c&ocirc;ng lập hoặc trường ngo&agrave;i c&ocirc;ng lập trong nước thuộc nh&oacute;m 100 trường ĐH tốt nhất Việt Nam tại website webometrics.info hoặc c&aacute;c trường nước ngo&agrave;i thuộc nh&oacute;m 1000 trường đại học tốt nhất&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;2. Tuổi:&lt;/span&gt;&amp;nbsp;Kh&ocirc;ng qu&aacute; 35 tuổi.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;3. Ti&ecirc;́ng Anh:&lt;/span&gt;&amp;nbsp;tr&igrave;nh độ B trở l&ecirc;n, ưu ti&ecirc;n ứng vi&ecirc;n c&oacute; chứng chỉ tiếng Anh quốc tế: Toeic 450 hoặc tương đương trở l&ecirc;n.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;4. Tin học văn ph&ograve;ng&lt;/span&gt;: Sử dụng th&agrave;nh thạo tin học văn phòng, ưu ti&ecirc;n c&oacute; chứng chỉ tin học quốc tế.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;5. Hộ khẩu&lt;/span&gt;: Ưu ti&ecirc;n ứng vi&ecirc;n c&oacute; hộ khẩu thường tr&uacute; tại địa phương nơi đăng k&yacute; dự tuyển, ứng vi&ecirc;n sẵn s&agrave;ng l&agrave;m việc l&acirc;u d&agrave;i tại một trong c&aacute;c tỉnh th&agrave;nh n&ecirc;u tr&ecirc;n. Đối với th&iacute; sinh kh&ocirc;ng c&oacute; hộ khẩu thường tr&uacute; tại địa phương nơi đăng k&yacute; dự tuyển, y&ecirc;u cầu c&oacute; cam kết l&agrave;m việc l&acirc;u d&agrave;i tối thiểu 03 năm tại vị tr&iacute; đăng k&yacute;.&lt;/p&gt;&lt;h3&gt;Th&ocirc;ng tin kh&aacute;c&lt;/h3&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;1. Chế độ đ&atilde;i ngộ&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Mức lương cạnh tranh theo năng lực;&lt;/li&gt;&lt;li&gt;M&ocirc;i trường l&agrave;m việc: chuy&ecirc;n nghiệp, hiện đại, năng động;&lt;/li&gt;&lt;li&gt;Được đ&agrave;o tạo li&ecirc;n tục n&acirc;ng cao tr&igrave;nh độ, nghiệp vụ, kỹ năng; được hỗ trợ đ&agrave;o tạo v&agrave; thi chứng chỉ quốc tế.&lt;/li&gt;&lt;li&gt;Cơ hội thăng tiến, khẳng định v&agrave; ph&aacute;t triển năng lực, ph&aacute;t triển sự nghiệp;&lt;/li&gt;&lt;li&gt;Chế độ ph&uacute;c lợi hấp dẫn: Du lịch, du xu&acirc;n, nghỉ m&aacute;t h&egrave;; Ch&iacute;nh s&aacute;ch về bảo hiểm theo quy định của Nh&agrave; nước; G&oacute;i bảo hiểm sức khỏe đặc biệt cho c&aacute; nh&acirc;n v&agrave; gia đ&igrave;nh; Kh&aacute;m sức khỏe định kỳ; Trang bị đồng phục; Thưởng ho&agrave;n th&agrave;nh kế hoạch, thưởng c&aacute;c dịp Lễ, Tết, ng&agrave;y truyền thống, thưởng theo dự &aacute;n &hellip;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;2. H&igrave;nh thức thi tuyển&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;H&igrave;nh thức 1 - Phỏng vấn (Kh&ocirc;ng thi viết)&lt;/span&gt;: Ứng vi&ecirc;n: tốt nghiệp Đại học ch&iacute;nh quy C&ocirc;ng lập loại Giỏi; hoặc c&oacute; bằng Tiến sĩ; hoặc tốt nghiệp Đai học ch&iacute;nh quy C&ocirc;ng lập bằng Kh&aacute;, c&oacute; kinh nghiệm &ge; 2 năm theo quy định v&agrave; tốt nghiệp Thạc sỹ đ&uacute;ng chuy&ecirc;n ng&agrave;nh.&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;H&igrave;nh&lt;/span&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;&amp;nbsp;thức 2: Đối với c&aacute;c th&iacute; sinh c&ograve;n lại&lt;/span&gt;&lt;/li&gt;&lt;li&gt;Thi viết (01 m&ocirc;n Chuy&ecirc;n ng&agrave;nh)/ Test IQ, EQ&lt;/li&gt;&lt;li&gt;Phỏng vấn trực tiếp (đối với c&aacute;c th&iacute; sinh đ&atilde; được tuyển chọn sau v&ograve;ng thi viết)&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;3.&amp;nbsp;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Qu&lt;/span&gt;y định về nộp hồ sơ&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Nộp CV ứng tuyển theo Link:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://forms.gle/kV7FkVxh7p9Tczgq6&quot;&gt;https://forms.gle/kV7FkVxh7p9Tczgq6&lt;/a&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Nộp hồ sơ online:&amp;nbsp;&lt;/span&gt;gửi qua email:&amp;nbsp;&lt;a href=&quot;mailto:tuyendungcongty5@mobifone.vn&quot;&gt;tuyendungcongty5@mobifone.vn&lt;/a&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;;&amp;nbsp; gồm:&lt;/span&gt;&lt;ul&gt;&lt;li&gt;Đơn xin việc&lt;/li&gt;&lt;li&gt;Bản l&yacute; lịch tự thuật (CV) theo mẫu tr&ecirc;n&lt;/li&gt;&lt;li&gt;Bản scan hoặc bản chụp: Bằng Đại học; bảng điểm; chứng chỉ ngoại ngữ, tin học; chứng chỉ đ&agrave;o tạo nghiệp vụ kh&aacute;c (nếu c&oacute;).&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Hồ sơ bản cứng (bổ sung sau khi c&oacute; th&ocirc;ng b&aacute;o tr&uacute;ng tuyển)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Thời&lt;/span&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;&amp;nbsp;hạn nhận hồ sơ&lt;/span&gt;: đến hết ng&agrave;y&amp;nbsp;&lt;span style=&quot;font-weight: bolder;&quot;&gt;15/6/2022&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;​​4. Th&ocirc;ng tin li&ecirc;n hệ: Mrs Hằng - 0934328696 (Zalo, Viber)&lt;/span&gt;&lt;/p&gt;', 1, '2022-05-25 06:00:03', 'MobiFone', '1653500940_mobi.jpg', '19:00:00', 'Thứ hai - Thứ sáu', '3/2, phường Xuân Khánh, quận Ninh Kiều, TP.Cần Thơ', 'mobi.com', '10.000.000đ - 15.000.000đ', 7),
(186, 'Chuyên viên', 2, '&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;&lt;b&gt;&amp;nbsp;1.&amp;nbsp;&lt;/b&gt;&lt;b&gt;Vị tr&iacute;: Kỹ thuật vi&ecirc;n, Bộ m&ocirc;n Kỹ thuật nu&ocirc;i hải sản (01 người)&lt;/b&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;&lt;i&gt;* Y&ecirc;u cầu:&lt;/i&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;- Tốt nghiệp Trung cấp ng&agrave;nh: Nu&ocirc;i trồng thủy sản;&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;- C&oacute; kinh nghiệm trong nu&ocirc;i t&ocirc;m;&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;- C&ocirc;ng việc dự kiến: Hỗ trợ thực hiện c&aacute;c đề t&agrave;i nghi&ecirc;n cứu khoa học v&agrave; triển khai c&aacute;c hoạt động thực nghiệm tại trại Vĩnh Ch&acirc;u.&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;* Dự kiến hợp đồng lao động c&oacute; thời hạn từ th&aacute;ng 6/2022 đến th&aacute;ng 6/2023, nguồn kinh ph&iacute; chi trả tiền lương từ Đề t&agrave;i: Ứng dụng sản phẩm microbe-lift trong ao nu&ocirc;i t&ocirc;m thẻ ch&acirc;n trắng, do PGS.TS. L&ecirc; Quốc Việt l&agrave;m chủ nhiệm.&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;&amp;nbsp;&lt;b&gt;2.&amp;nbsp;Hồ sơ xin việc gồm c&oacute;:&lt;/b&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;- Đơn xin việc l&agrave;m&amp;nbsp;&lt;i&gt;(ngo&agrave;i b&igrave; hồ sơ ghi r&otilde; vị tr&iacute; dự tuyển, điện thoại, email nếu c&oacute;)&lt;/i&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;- Sơ yếu l&yacute; lịch c&oacute; d&aacute;n ảnh v&agrave; x&aacute;c nhận của ch&iacute;nh quyền địa phương;&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;- Giấy kh&aacute;m sức khỏe;&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;- Văn bằng, chứng chỉ, bảng điểm c&oacute; li&ecirc;n quan&amp;nbsp;&lt;i&gt;(ứng vi&ecirc;n c&oacute; thể nộp bản sao từ sổ gốc, bản sao c&oacute; chứng thực hoặc nộp bản sao xuất tr&igrave;nh k&egrave;m bản ch&iacute;nh để đối chiếu)&lt;/i&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;&lt;i&gt;(Hồ sơ xin việc c&oacute; b&aacute;n tại Ph&ograve;ng Tổ chức-C&aacute;n bộ,&amp;nbsp; Trường Đại học Cần Thơ)&lt;/i&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;*&lt;b&gt;&amp;nbsp;Thời hạn nhận hồ sơ:&lt;/b&gt;&amp;nbsp;Kể từ ng&agrave;y ra Th&ocirc;ng b&aacute;o đến hết ng&agrave;y&amp;nbsp;&lt;b&gt;&lt;u&gt;11&lt;/u&gt;&lt;/b&gt;&lt;b&gt;&lt;u&gt;/&lt;/u&gt;&lt;/b&gt;&lt;b&gt;&lt;u&gt;6&lt;/u&gt;&lt;/b&gt;&lt;b&gt;&lt;u&gt;/202&lt;/u&gt;&lt;/b&gt;&lt;b&gt;&lt;u&gt;2&lt;/u&gt;&lt;/b&gt;&lt;b&gt;.&lt;/b&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 13px; margin-bottom: 13px; padding: 0px; color: rgb(17, 20, 23); font-family: Arial, &amp;quot;Arial Unicode MS&amp;quot;, Helvetica, sans-serif; font-size: 13px;&quot;&gt;*&lt;b&gt;&amp;nbsp;Địa chỉ li&ecirc;n hệ v&agrave; nộp hồ sơ:&lt;/b&gt;&amp;nbsp;Ph&ograve;ng Tổ chức-C&aacute;n bộ, Trường Đại học Cần Thơ (Lầu 2, Nh&agrave; Điều h&agrave;nh Trường Đại học Cần Thơ) khu II, đường 3/2, phường Xu&acirc;n Kh&aacute;nh, quận Ninh Kiều, TP.Cần Thơ. Ứng vi&ecirc;n c&oacute; thể nộp hồ sơ qua đường bưu điện.&lt;/p&gt;', 1, '2022-05-25 06:05:05', 'Khoa thủy sản đại học Cần Thơ', '1653508440_1653499380_VNPT.jpg', '19:00:00', 'Thứ hai - Thứ sáu', '3/2, phường Xuân Khánh, quận Ninh Kiều, TP.Cần Thơ', 'ctu.edu.vn', '10.000.000đ - 15.000.000đ', 7),
(187, 'Lập trình di động', 2, '&lt;p&gt;Để tiếp tục mở rộng kế hoạch kinh doanh năm 2022, Tổng C&ocirc;ng ty Viễn th&ocirc;ng MobiFone chi&ecirc;u mộ nh&acirc;n t&agrave;i vị tr&iacute; Lập tr&igrave;nh l&agrave;m việc tại Ph&ograve;ng Dịch vụ kỹ thuật khối Văn ph&ograve;ng C&ocirc;ng ty, thực hiện c&aacute;c nhiệm vụ:&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Thiết kế, x&acirc;y dựng c&aacute;c ứng dụng CNTT tr&ecirc;n m&aacute;y t&iacute;nh (website, fanpage) v&agrave; thiết bị di động (app) &hellip;.;&lt;/li&gt;&lt;li&gt;X&acirc;y dựng c&aacute;c hệ thống b&aacute;o c&aacute;o; x&acirc;y dựng nguồn số liệu; cung cấp v&agrave; ph&acirc;n t&iacute;ch số liệu phục vụ sản xuất kinh doanh;&lt;/li&gt;&lt;li&gt;Quản trị hệ thống c&aacute;c m&aacute;y chủ ứng dụng, CSDL;&lt;/li&gt;&lt;li&gt;Quản l&yacute;, hỗ trợ nghiệp vụ c&aacute;c hệ thống CNTT.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Số lượng tuyển: 05 người&lt;/p&gt;&lt;h3&gt;Y&ecirc;u cầu&lt;/h3&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;1. Tr&igrave;nh độ:&lt;/span&gt;&lt;/p&gt;&lt;p&gt;- Tốt nghiệp đại học:&amp;nbsp;Ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin, chuy&ecirc;n ng&agrave;nh lập tr&igrave;nh, x&acirc;y dựng phần mềm; Biết sử dụng 01 trong c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh (C#, java, Python, reactjs, swift&hellip;)&lt;/p&gt;&lt;p&gt;- Tốt nghiệp hệ ch&iacute;nh quy c&aacute;c trường c&ocirc;ng lập hoặc trường ngo&agrave;i c&ocirc;ng lập trong nước thuộc nh&oacute;m 100 trường ĐH tốt nhất Việt Nam tại website webometrics.info hoặc c&aacute;c trường nước ngo&agrave;i thuộc nh&oacute;m 1000 trường đại học tốt nhất&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;2. Tuổi:&lt;/span&gt;&amp;nbsp;Kh&ocirc;ng qu&aacute; 35 tuổi.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;3. Ti&ecirc;́ng Anh:&lt;/span&gt;&amp;nbsp;tr&igrave;nh độ B trở l&ecirc;n, ưu ti&ecirc;n ứng vi&ecirc;n c&oacute; chứng chỉ tiếng Anh quốc tế: Toeic 450 hoặc tương đương trở l&ecirc;n.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;4. Tin học văn ph&ograve;ng&lt;/span&gt;: Sử dụng th&agrave;nh thạo tin học văn phòng, ưu ti&ecirc;n c&oacute; chứng chỉ tin học quốc tế.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;5. Hộ khẩu&lt;/span&gt;: Ưu ti&ecirc;n ứng vi&ecirc;n c&oacute; hộ khẩu thường tr&uacute; tại địa phương nơi đăng k&yacute; dự tuyển, ứng vi&ecirc;n sẵn s&agrave;ng l&agrave;m việc l&acirc;u d&agrave;i tại một trong c&aacute;c tỉnh th&agrave;nh n&ecirc;u tr&ecirc;n. Đối với th&iacute; sinh kh&ocirc;ng c&oacute; hộ khẩu thường tr&uacute; tại địa phương nơi đăng k&yacute; dự tuyển, y&ecirc;u cầu c&oacute; cam kết l&agrave;m việc l&acirc;u d&agrave;i tối thiểu 03 năm tại vị tr&iacute; đăng k&yacute;.&lt;/p&gt;&lt;h3&gt;Th&ocirc;ng tin kh&aacute;c&lt;/h3&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;1. Chế độ đ&atilde;i ngộ&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Mức lương cạnh tranh theo năng lực;&lt;/li&gt;&lt;li&gt;M&ocirc;i trường l&agrave;m việc: chuy&ecirc;n nghiệp, hiện đại, năng động;&lt;/li&gt;&lt;li&gt;Được đ&agrave;o tạo li&ecirc;n tục n&acirc;ng cao tr&igrave;nh độ, nghiệp vụ, kỹ năng; được hỗ trợ đ&agrave;o tạo v&agrave; thi chứng chỉ quốc tế.&lt;/li&gt;&lt;li&gt;Cơ hội thăng tiến, khẳng định v&agrave; ph&aacute;t triển năng lực, ph&aacute;t triển sự nghiệp;&lt;/li&gt;&lt;li&gt;Chế độ ph&uacute;c lợi hấp dẫn: Du lịch, du xu&acirc;n, nghỉ m&aacute;t h&egrave;; Ch&iacute;nh s&aacute;ch về bảo hiểm theo quy định của Nh&agrave; nước; G&oacute;i bảo hiểm sức khỏe đặc biệt cho c&aacute; nh&acirc;n v&agrave; gia đ&igrave;nh; Kh&aacute;m sức khỏe định kỳ; Trang bị đồng phục; Thưởng ho&agrave;n th&agrave;nh kế hoạch, thưởng c&aacute;c dịp Lễ, Tết, ng&agrave;y truyền thống, thưởng theo dự &aacute;n &hellip;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;2. H&igrave;nh thức thi tuyển&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;H&igrave;nh thức 1 - Phỏng vấn (Kh&ocirc;ng thi viết)&lt;/span&gt;: Ứng vi&ecirc;n: tốt nghiệp Đại học ch&iacute;nh quy C&ocirc;ng lập loại Giỏi; hoặc c&oacute; bằng Tiến sĩ; hoặc tốt nghiệp Đai học ch&iacute;nh quy C&ocirc;ng lập bằng Kh&aacute;, c&oacute; kinh nghiệm &ge; 2 năm theo quy định v&agrave; tốt nghiệp Thạc sỹ đ&uacute;ng chuy&ecirc;n ng&agrave;nh.&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;H&igrave;nh&lt;/span&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;&amp;nbsp;thức 2: Đối với c&aacute;c th&iacute; sinh c&ograve;n lại&lt;/span&gt;&lt;/li&gt;&lt;li&gt;Thi viết (01 m&ocirc;n Chuy&ecirc;n ng&agrave;nh)/ Test IQ, EQ&lt;/li&gt;&lt;li&gt;Phỏng vấn trực tiếp (đối với c&aacute;c th&iacute; sinh đ&atilde; được tuyển chọn sau v&ograve;ng thi viết)&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;3.&amp;nbsp;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Qu&lt;/span&gt;y định về nộp hồ sơ&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Nộp CV ứng tuyển theo Link:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://forms.gle/kV7FkVxh7p9Tczgq6&quot;&gt;https://forms.gle/kV7FkVxh7p9Tczgq6&lt;/a&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Nộp hồ sơ online:&amp;nbsp;&lt;/span&gt;gửi qua email:&amp;nbsp;&lt;a href=&quot;mailto:tuyendungcongty5@mobifone.vn&quot;&gt;tuyendungcongty5@mobifone.vn&lt;/a&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;;&amp;nbsp; gồm:&lt;/span&gt;&lt;ul&gt;&lt;li&gt;Đơn xin việc&lt;/li&gt;&lt;li&gt;Bản l&yacute; lịch tự thuật (CV) theo mẫu tr&ecirc;n&lt;/li&gt;&lt;li&gt;Bản scan hoặc bản chụp: Bằng Đại học; bảng điểm; chứng chỉ ngoại ngữ, tin học; chứng chỉ đ&agrave;o tạo nghiệp vụ kh&aacute;c (nếu c&oacute;).&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Hồ sơ bản cứng (bổ sung sau khi c&oacute; th&ocirc;ng b&aacute;o tr&uacute;ng tuyển)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Thời&lt;/span&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;&amp;nbsp;hạn nhận hồ sơ&lt;/span&gt;: đến hết ng&agrave;y&amp;nbsp;&lt;span style=&quot;font-weight: bolder;&quot;&gt;15/6/2022&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;​​4. Th&ocirc;ng tin li&ecirc;n hệ: Mrs Hằng - 0934328696 (Zalo, Viber)&lt;/span&gt;&lt;/p&gt;', 1, '2022-05-25 06:07:18', 'VNPT', '1653501060_1653499380_VNPT.jpg', '19:00:00', 'Thứ hai - Thứ sáu', '3/2, phường Xuân Khánh, quận Ninh Kiều, TP.Cần Thơ', 'ctu.edu.vn', '10.000.000đ - 15.000.000đ', 7),
(188, ' Kỹ thuật viên ', 2, '&lt;p&gt;&lt;strong&gt;&nbsp;1.&nbsp;&lt;/strong&gt;&lt;strong&gt;Vị tr&iacute;: Kỹ thuật vi&ecirc;n, Bộ m&ocirc;n Kỹ thuật nu&ocirc;i hải sản (01 người)&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;em&gt;* Y&ecirc;u cầu:&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tốt nghiệp Trung cấp ng&agrave;nh: Nu&ocirc;i trồng thủy sản;&lt;/p&gt;\r\n\r\n&lt;p&gt;- C&oacute; kinh nghiệm trong nu&ocirc;i t&ocirc;m;&lt;/p&gt;\r\n\r\n&lt;p&gt;- C&ocirc;ng việc dự kiến: Hỗ trợ thực hiện c&aacute;c đề t&agrave;i nghi&ecirc;n cứu khoa học v&agrave; triển khai c&aacute;c hoạt động thực nghiệm tại trại Vĩnh Ch&acirc;u.&lt;/p&gt;\r\n\r\n&lt;p&gt;* Dự kiến hợp đồng lao động c&oacute; thời hạn từ th&aacute;ng 6/2022 đến th&aacute;ng 6/2023, nguồn kinh ph&iacute; chi trả tiền lương từ Đề t&agrave;i: Ứng dụng sản phẩm microbe-lift trong ao nu&ocirc;i t&ocirc;m thẻ ch&acirc;n trắng, do PGS.TS. L&ecirc; Quốc Việt l&agrave;m chủ nhiệm.&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;strong&gt;2.&nbsp;Hồ sơ xin việc gồm c&oacute;:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Đơn xin việc l&agrave;m&nbsp;&lt;em&gt;(ngo&agrave;i b&igrave; hồ sơ ghi r&otilde; vị tr&iacute; dự tuyển, điện thoại, email nếu c&oacute;)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sơ yếu l&yacute; lịch c&oacute; d&aacute;n ảnh v&agrave; x&aacute;c nhận của ch&iacute;nh quyền địa phương;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Giấy kh&aacute;m sức khỏe;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Văn bằng, chứng chỉ, bảng điểm c&oacute; li&ecirc;n quan&nbsp;&lt;em&gt;(ứng vi&ecirc;n c&oacute; thể nộp bản sao từ sổ gốc, bản sao c&oacute; chứng thực hoặc nộp bản sao xuất tr&igrave;nh k&egrave;m bản ch&iacute;nh để đối chiếu)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;em&gt;(Hồ sơ xin việc c&oacute; b&aacute;n tại Ph&ograve;ng Tổ chức-C&aacute;n bộ,&nbsp; Trường Đại học Cần Thơ)&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;*&lt;strong&gt;&nbsp;Thời hạn nhận hồ sơ:&lt;/strong&gt;&nbsp;Kể từ ng&agrave;y ra Th&ocirc;ng b&aacute;o đến hết ng&agrave;y&nbsp;&lt;strong&gt;11&lt;/strong&gt;&lt;strong&gt;/&lt;/strong&gt;&lt;strong&gt;6&lt;/strong&gt;&lt;strong&gt;/202&lt;/strong&gt;&lt;strong&gt;2&lt;/strong&gt;&lt;strong&gt;.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;*&lt;strong&gt;&nbsp;Địa chỉ li&ecirc;n hệ v&agrave; nộp hồ sơ:&lt;/strong&gt;&nbsp;Ph&ograve;ng Tổ chức-C&aacute;n bộ, Trường Đại học Cần Thơ (Lầu 2, Nh&agrave; Điều h&agrave;nh Trường Đại học Cần Thơ) khu II, đường 3/2, phường Xu&acirc;n Kh&aacute;nh, quận Ninh Kiều, TP.Cần Thơ. Ứng vi&ecirc;n c&oacute; thể nộp hồ sơ qua đường bưu điện.&lt;/p&gt;\r\n\r\n&lt;p&gt;&gt;&lt;/p&gt;\r\n', 1, '2022-05-25 06:10:17', 'Đại học Cần Thơ', '1653508380_1653499380_VNPT.jpg', '19:00:00', 'Thứ hai - Thứ sáu', '3/2, phường Xuân Khánh, quận Ninh Kiều, TP.Cần Thơ', 'ctu.edu.vn', '10.000.000đ - 15.000.000đ', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recruiter`
--
ALTER TABLE `recruiter`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `recruitment_status`
--
ALTER TABLE `recruitment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_recruiter` (`fk_recruiter`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recruiter`
--
ALTER TABLE `recruiter`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recruitment_status`
--
ALTER TABLE `recruitment_status`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vacancy`
--
ALTER TABLE `vacancy`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD CONSTRAINT `vacancy_ibfk_1` FOREIGN KEY (`fk_recruiter`) REFERENCES `recruiter` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
