-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 10, 2020 at 08:37 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cosmoshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` varchar(20) NOT NULL,
  `address` longtext,
  `Zipcode` int(11) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `city_id_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address`, `Zipcode`, `is_delete`, `is_active`, `city_id_id`) VALUES
('Add_01', '101,Aanad Vihar Complex', 560040, 0, 1, 'City_11'),
('Add_02', '10, Anand Vilas Hub,Borivali', 456777, 0, 1, 'City_14'),
('Add_03', '30, Varachha Complex', 356778, 0, 1, 'City_07'),
('Add_04', '102,Icchanath Road, Soma Complex', 453338, 0, 1, 'City_13'),
('Add_05', '111, Malabar bay, Sarswati Lane', 657899, 0, 1, 'City_12'),
('Add_06', '', 0, 0, 1, 'City_01'),
('Add_07', '', 0, 0, 1, 'City_01'),
('Add_08', '', 0, 0, 1, 'City_01'),
('Add_09', '', 0, 0, 1, 'City_01'),
('Add_10', 'F-10,Somnath Mahadev Soc.,,B/H Sargam Shopping Centre,Parle Point', 395066, 0, 1, 'City_16'),
('Add_11', '', 0, 0, 1, 'City_01'),
('Add_12', '', 0, 0, 1, 'City_01'),
('Add_13', '', 0, 0, 1, 'City_01'),
('Add_14', 'SG Palya,NR Forum Mall', 7879799, 0, 1, 'City_11'),
('Add_15', 'Hello,hi', 700033, 0, 1, 'City_28'),
('Add_16', '', 0, 0, 1, 'City_01');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email_id` varchar(254) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `contact_no` bigint(20) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `role_id_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add address', 7, 'add_address'),
(26, 'Can change address', 7, 'change_address'),
(27, 'Can delete address', 7, 'delete_address'),
(28, 'Can view address', 7, 'view_address'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add coupon', 9, 'add_coupon'),
(34, 'Can change coupon', 9, 'change_coupon'),
(35, 'Can delete coupon', 9, 'delete_coupon'),
(36, 'Can view coupon', 9, 'view_coupon'),
(37, 'Can add customer', 10, 'add_customer'),
(38, 'Can change customer', 10, 'change_customer'),
(39, 'Can delete customer', 10, 'delete_customer'),
(40, 'Can view customer', 10, 'view_customer'),
(41, 'Can add customer_ order', 11, 'add_customer_order'),
(42, 'Can change customer_ order', 11, 'change_customer_order'),
(43, 'Can delete customer_ order', 11, 'delete_customer_order'),
(44, 'Can view customer_ order', 11, 'view_customer_order'),
(45, 'Can add help', 12, 'add_help'),
(46, 'Can change help', 12, 'change_help'),
(47, 'Can delete help', 12, 'delete_help'),
(48, 'Can view help', 12, 'view_help'),
(49, 'Can add payment_ type', 13, 'add_payment_type'),
(50, 'Can change payment_ type', 13, 'change_payment_type'),
(51, 'Can delete payment_ type', 13, 'delete_payment_type'),
(52, 'Can view payment_ type', 13, 'view_payment_type'),
(53, 'Can add product', 14, 'add_product'),
(54, 'Can change product', 14, 'change_product'),
(55, 'Can delete product', 14, 'delete_product'),
(56, 'Can view product', 14, 'view_product'),
(57, 'Can add product_ brand', 15, 'add_product_brand'),
(58, 'Can change product_ brand', 15, 'change_product_brand'),
(59, 'Can delete product_ brand', 15, 'delete_product_brand'),
(60, 'Can view product_ brand', 15, 'view_product_brand'),
(61, 'Can add product_ color', 16, 'add_product_color'),
(62, 'Can change product_ color', 16, 'change_product_color'),
(63, 'Can delete product_ color', 16, 'delete_product_color'),
(64, 'Can view product_ color', 16, 'view_product_color'),
(65, 'Can add role', 17, 'add_role'),
(66, 'Can change role', 17, 'change_role'),
(67, 'Can delete role', 17, 'delete_role'),
(68, 'Can view role', 17, 'view_role'),
(69, 'Can add skin_ survey', 18, 'add_skin_survey'),
(70, 'Can change skin_ survey', 18, 'change_skin_survey'),
(71, 'Can delete skin_ survey', 18, 'delete_skin_survey'),
(72, 'Can view skin_ survey', 18, 'view_skin_survey'),
(73, 'Can add state', 19, 'add_state'),
(74, 'Can change state', 19, 'change_state'),
(75, 'Can delete state', 19, 'delete_state'),
(76, 'Can view state', 19, 'view_state'),
(77, 'Can add sub_ category1', 20, 'add_sub_category1'),
(78, 'Can change sub_ category1', 20, 'change_sub_category1'),
(79, 'Can delete sub_ category1', 20, 'delete_sub_category1'),
(80, 'Can view sub_ category1', 20, 'view_sub_category1'),
(81, 'Can add supplier', 21, 'add_supplier'),
(82, 'Can change supplier', 21, 'change_supplier'),
(83, 'Can delete supplier', 21, 'delete_supplier'),
(84, 'Can view supplier', 21, 'view_supplier'),
(85, 'Can add sub_ category2', 22, 'add_sub_category2'),
(86, 'Can change sub_ category2', 22, 'change_sub_category2'),
(87, 'Can delete sub_ category2', 22, 'delete_sub_category2'),
(88, 'Can view sub_ category2', 22, 'view_sub_category2'),
(89, 'Can add review', 23, 'add_review'),
(90, 'Can change review', 23, 'change_review'),
(91, 'Can delete review', 23, 'delete_review'),
(92, 'Can view review', 23, 'view_review'),
(93, 'Can add payment', 24, 'add_payment'),
(94, 'Can change payment', 24, 'change_payment'),
(95, 'Can delete payment', 24, 'delete_payment'),
(96, 'Can view payment', 24, 'view_payment'),
(97, 'Can add order_ status', 25, 'add_order_status'),
(98, 'Can change order_ status', 25, 'change_order_status'),
(99, 'Can delete order_ status', 25, 'delete_order_status'),
(100, 'Can view order_ status', 25, 'view_order_status'),
(101, 'Can add city', 26, 'add_city'),
(102, 'Can change city', 26, 'change_city'),
(103, 'Can delete city', 26, 'delete_city'),
(104, 'Can view city', 26, 'view_city'),
(105, 'Can add admin', 27, 'add_admin'),
(106, 'Can change admin', 27, 'change_admin'),
(107, 'Can delete admin', 27, 'delete_admin'),
(108, 'Can view admin', 27, 'view_admin'),
(109, 'Can add contact_us', 28, 'add_contact_us'),
(110, 'Can change contact_us', 28, 'change_contact_us'),
(111, 'Can delete contact_us', 28, 'delete_contact_us'),
(112, 'Can view contact_us', 28, 'view_contact_us'),
(113, 'Can add newsletter', 29, 'add_newsletter'),
(114, 'Can change newsletter', 29, 'change_newsletter'),
(115, 'Can delete newsletter', 29, 'delete_newsletter'),
(116, 'Can view newsletter', 29, 'view_newsletter'),
(117, 'Can add blogpost', 30, 'add_blogpost'),
(118, 'Can change blogpost', 30, 'change_blogpost'),
(119, 'Can delete blogpost', 30, 'delete_blogpost'),
(120, 'Can view blogpost', 30, 'view_blogpost');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$yA0HUbEwZ5mB$tArWKR7jLnynjEpEEO+5JyJx07bL2Xo/rtCbrlEE1ng=', '2020-11-10 18:59:59.205195', 1, 'user1', '', '', 'kajal@gmail.com', 1, 1, '2020-10-26 16:01:25.453968');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blogpost`
--

CREATE TABLE `blogpost` (
  `post_id` int(11) NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `head0` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `chead0` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `head1` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `chead1` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `head2` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `chead2` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `pub_date` date NOT NULL,
  `author` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `thumbnail` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `topic` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogpost`
--

INSERT INTO `blogpost` (`post_id`, `title`, `head0`, `chead0`, `head1`, `chead1`, `head2`, `chead2`, `pub_date`, `author`, `is_delete`, `is_active`, `thumbnail`, `topic`) VALUES
(1, 'Final Demonstration', 'Welcome to our First Blogpost', 'This is the first blog post', 'Trying out the functionality', 'The second blogpost should be in the same row as that of the first blog postt', 'Offers', 'Offeres are about to come', '2020-10-22', 'Cosmoshop Team', 0, 1, 'upload/images/butterfly.png', 'Feature'),
(2, 'Project', 'Presenting', 'This is the second blog post', 'Trying out the functionality', 'It goes by the tagline \'pamper yourself\'', 'Offers', 'On the final rounds of integration', '2020-10-21', 'Cosmoshop Team', 0, 1, 'upload/images/serum.png', 'Testing'),
(3, 'Cosmoshop Grand Diwali Sale', 'Cosmoshop-Fiesta', 'The Cosmoshop Sale is Back!', 'New Products New Offers', 'Check out our page everyday, for new offers and new products', 'Tones of Surprise gifts', 'Surprise gifts worth upto Rs. 5000/- may be won during this sale', '2020-11-09', 'Cosmoshop Team', 0, 1, 'upload/images/fireworks.png', 'Festival');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `is_delete`, `is_active`) VALUES
('Cat_01', 'Makeup', 0, 1),
('Cat_02', 'Skin', 0, 1),
('Cat_03', 'Hair', 0, 1),
('Cat_04', 'Mom & Baby', 0, 1),
('Cat_05', 'Men', 0, 1),
('Cat_06', 'Fragrance', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `state_id_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `name`, `is_delete`, `is_active`, `state_id_id`) VALUES
('City_01', 'Hyderabad', 0, 1, 'State_01'),
('City_02', 'Itanagar', 0, 1, 'State_02'),
('City_03', 'Dispur', 0, 1, 'State_03'),
('City_04', 'Patna', 0, 1, 'State_04'),
('City_05', 'Raipur', 0, 1, 'State_05'),
('City_06', 'Panaji', 0, 1, 'State_06'),
('City_07', 'Gandhinagar', 0, 1, 'State_07'),
('City_08', 'Chandigarh', 0, 1, 'State_08'),
('City_09', 'Shimla', 0, 1, 'State_09'),
('City_10', 'Ranchi', 0, 1, 'State_10'),
('City_11', 'Bangalore', 0, 1, 'State_11'),
('City_12', 'Thiruvananthapuram', 0, 1, 'State_12'),
('City_13', 'Bhopal', 0, 1, 'State_13'),
('City_14', 'Mumbai', 0, 1, 'State_14'),
('City_15', 'Imphal', 0, 1, 'State_15'),
('City_16', 'Shillong', 0, 1, 'State_16'),
('City_17', 'Aizawl', 0, 1, 'State_17'),
('City_18', 'Kohima', 0, 1, 'State_18'),
('City_19', 'Bhubaneswar', 0, 1, 'State_19'),
('City_20', 'Chandigarh', 0, 1, 'State_20'),
('City_21', 'Jaipur', 0, 1, 'State_21'),
('City_22', 'Gangtok', 0, 1, 'State_22'),
('City_23', 'Chennai', 0, 1, 'State_23'),
('City_24', 'Hyderabad', 0, 1, 'State_24'),
('City_25', 'Agartala', 0, 1, 'State_25'),
('City_26', 'Lucknow', 0, 1, 'State_26'),
('City_27', 'Dehradun', 0, 1, 'State_27'),
('City_28', 'Kolkata', 0, 1, 'State_28');

-- --------------------------------------------------------

--
-- Table structure for table `client_skin_survey`
--

CREATE TABLE `client_skin_survey` (
  `skin_survey_id` varchar(20) NOT NULL,
  `picture` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_skin_survey`
--

INSERT INTO `client_skin_survey` (`skin_survey_id`, `picture`) VALUES
('', 'survey_images/blusher_NKmkHXw.png');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email_id` varchar(254) DEFAULT NULL,
  `contact_no` bigint(20) DEFAULT NULL,
  `message` longtext,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`contact_id`, `name`, `email_id`, `contact_no`, `message`, `is_delete`, `is_active`) VALUES
('Contact_01', 'Nishi Shah', 'nishikshah27@gmail.com', 9106701981, 'Very Nice Functionalities..!', 0, 1),
('Contact_02', NULL, NULL, NULL, NULL, 0, 1),
('Contact_03', NULL, NULL, NULL, NULL, 0, 1),
('Contact_04', 'Kajal Chatterjee', 'kajal@gmail.com', 8797787879, 'Very Impressive Website..!', 0, 1),
('Contact_05', 'Kajal Chatterjee', 'kajal@gmail.com', 8797787879, 'Very Impressive Website..!', 0, 1),
('Contact_06', 'Rohini', 'rohini.v@christuniversity.in', 9106701981, 'hello', 0, 1),
('Contact_07', 'Kajal', 'kajal.chatterjee@cs.christuniversity.in', 123456789, 'Hi', 0, 1),
('Contact_08', 'Kajal', 'kajal.chatterjee@cs.christuniversity.in', 123456789, 'Heelo', 0, 1),
('Contact_09', 'Kajal', 'kajal.chatterjee@cs.christuniversity.in', 123456789, 'Hello', 0, 1),
('Contact_10', 'Kajal', 'kajal.chatterjee@cs.christuniversity.in', 123456789, 'Hello', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` varchar(20) NOT NULL,
  `coupon_code` varchar(20) DEFAULT NULL,
  `activation_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email_id` varchar(254) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `contact_no` bigint(20) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `address_id_id` varchar(20) NOT NULL,
  `role_id_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `email_id`, `password`, `contact_no`, `is_delete`, `is_active`, `address_id_id`, `role_id_id`) VALUES
('C_01', 'Nishi', 'nishi@gmail.com', 'nishi123', 7046436183, 0, 1, 'Add_02', 'Role_01'),
('C_02', 'Vaishali Shah', 'vkshah04@gmail.com', '202cb962ac59075b964b07152d234b70', 9106701981, 0, 1, 'Add_07', 'Role_01'),
('C_04', 'Nishi Shah', 'nishik@gmail.com', '202cb962ac59075b964b07152d234b70', 7046436183, 0, 1, 'Add_09', 'Role_01'),
('C_05', 'Nishi Shah', 'nishikshah27@gmail.com', '202cb962ac59075b964b07152d234b70', 9106701981, 0, 1, 'Add_10', 'Role_01'),
('C_07', 'Sarika', 'sarika.jha@cs.christuniversity.in', '202cb962ac59075b964b07152d234b70', 8782979994, 0, 1, 'Add_12', 'Role_01'),
('C_08', 'Rohini', 'rohini.v@christuniversity.in', '202cb962ac59075b964b07152d234b70', 9797737878, 0, 1, 'Add_14', 'Role_01'),
('C_09', 'Kajal', 'kajal.chatterjee@cs.christuniversity.in', 'e10adc3949ba59abbe56e057f20f883e', 123456789, 0, 1, 'Add_15', 'Role_01'),
('C_10', 'Sejal', 'kajal.chatterjee@cs.christuniversity.in', '01cfcd4f6b8770febfb40cb906715822', 123456789, 0, 1, 'Add_16', 'Role_01');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `customer_order_id` varchar(20) NOT NULL,
  `contact_no` bigint(20) DEFAULT NULL,
  `order_amount` double DEFAULT NULL,
  `is_successful` int(11) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `address_id_id` varchar(20) NOT NULL,
  `customer_id_id` varchar(20) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `productinfo` varchar(255) NOT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`customer_order_id`, `contact_no`, `order_amount`, `is_successful`, `is_delete`, `is_active`, `address_id_id`, `customer_id_id`, `status`, `productinfo`, `order_date`) VALUES
('Order_01', 9106701981, 2174, 1, 1, 1, 'Add_10', 'C_05', 'Placed', 'P_03,P_02,P_01', '2020-10-20'),
('Order_02', 9106701981, 2174, 1, 1, 1, 'Add_10', 'C_05', 'Placed', 'P_03,P_02,P_01', '2020-10-20'),
('Order_03', 7839729795, 2941, 1, 1, 1, 'Add_10', 'C_05', 'Placed', 'P_03,P_02,P_01,P_04', '2020-10-21'),
('Order_04', 9898078789, 1104.92, 1, 0, 1, 'Add_14', 'C_08', 'Placed', 'P_10,P_11', '2020-10-21'),
('Order_05', 123456789, 640, 1, 0, 1, 'Add_15', 'C_09', 'Placed', 'P_02', '2020-10-26'),
('Order_06', 123456789, 1700.82, 1, 0, 1, 'Add_15', 'C_09', 'Placed', 'P_01,P_07', '2020-10-26'),
('Order_07', 123456789, 1817.64, 1, 0, 1, 'Add_15', 'C_09', 'Placed', 'P_07,P_09', '2020-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-10-26 16:02:11.631157', '1', 'Blogpost object (1)', 1, '[{\"added\": {}}]', 30, 1),
(2, '2020-10-26 16:02:46.628420', '2', 'Blogpost object (2)', 1, '[{\"added\": {}}]', 30, 1),
(3, '2020-11-10 19:10:33.893347', '3', 'Blogpost object (3)', 1, '[{\"added\": {}}]', 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'Client', 'address'),
(27, 'Client', 'admin'),
(30, 'Client', 'blogpost'),
(8, 'Client', 'category'),
(26, 'Client', 'city'),
(28, 'Client', 'contact_us'),
(9, 'Client', 'coupon'),
(10, 'Client', 'customer'),
(11, 'Client', 'customer_order'),
(12, 'Client', 'help'),
(29, 'Client', 'newsletter'),
(25, 'Client', 'order_status'),
(24, 'Client', 'payment'),
(13, 'Client', 'payment_type'),
(14, 'Client', 'product'),
(15, 'Client', 'product_brand'),
(16, 'Client', 'product_color'),
(23, 'Client', 'review'),
(17, 'Client', 'role'),
(18, 'Client', 'skin_survey'),
(19, 'Client', 'state'),
(20, 'Client', 'sub_category1'),
(22, 'Client', 'sub_category2'),
(21, 'Client', 'supplier'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Client', '0001_initial', '2020-09-24 17:06:54.290750'),
(2, 'contenttypes', '0001_initial', '2020-09-24 17:07:20.800266'),
(3, 'auth', '0001_initial', '2020-09-24 17:07:22.849321'),
(4, 'admin', '0001_initial', '2020-09-24 17:07:32.591314'),
(5, 'admin', '0002_logentry_remove_auto_add', '2020-09-24 17:07:34.726903'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2020-09-24 17:07:34.788377'),
(7, 'contenttypes', '0002_remove_content_type_name', '2020-09-24 17:07:35.868045'),
(8, 'auth', '0002_alter_permission_name_max_length', '2020-09-24 17:07:37.157137'),
(9, 'auth', '0003_alter_user_email_max_length', '2020-09-24 17:07:38.924283'),
(10, 'auth', '0004_alter_user_username_opts', '2020-09-24 17:07:39.028289'),
(11, 'auth', '0005_alter_user_last_login_null', '2020-09-24 17:07:39.833304'),
(12, 'auth', '0006_require_contenttypes_0002', '2020-09-24 17:07:39.929149'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2020-09-24 17:07:39.991543'),
(14, 'auth', '0008_alter_user_username_max_length', '2020-09-24 17:07:40.934867'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2020-09-24 17:07:41.984758'),
(16, 'auth', '0010_alter_group_name_max_length', '2020-09-24 17:07:43.279027'),
(17, 'auth', '0011_update_proxy_permissions', '2020-09-24 17:07:43.372610'),
(18, 'sessions', '0001_initial', '2020-09-24 17:07:43.876408'),
(19, 'Client', '0002_auto_20200925_1323', '2020-09-25 07:53:20.131095'),
(20, 'Client', '0003_auto_20201002_2132', '2020-10-02 16:03:10.816629'),
(21, 'Client', '0004_auto_20201019_2157', '2020-10-19 16:27:16.647404'),
(22, 'Client', '0005_auto_20201020_1515', '2020-10-20 09:45:48.128204'),
(23, 'Client', '0006_customer_order_status', '2020-10-20 13:15:18.872012'),
(24, 'Client', '0007_auto_20201020_1952', '2020-10-20 14:22:11.168350'),
(25, 'Client', '0008_customer_order_productinfo', '2020-10-20 14:52:11.421853'),
(26, 'Client', '0009_remove_customer_order_order_date', '2020-10-20 15:59:00.925138'),
(27, 'Client', '0010_auto_20201020_2145', '2020-10-20 16:16:38.732684'),
(28, 'auth', '0012_alter_user_first_name_max_length', '2020-10-25 22:33:46.558246'),
(29, 'Client', '0002_blogpost', '2020-10-25 22:38:09.442975');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('l12adck0eppmvyobjcbi1eivtnl6a0zc', '.eJxdjktOxDAMhu-SNYraJtOkrHgsERsuEHlsD02nTaQkRUKIu5OowwJ29vc_7C-Bey5x4-Q8iXvx7LpJ3AnewK8HucICq8QZSuG0MD9grlvyuezBf3DKvnxKH2oowMY18NICdcUYCmBxIVbY9YPSp9HY1g5EiXM--h-JXH-qNMWVD_TWpq6vzMFeZrfn3_f-sTPglUMTaIHwHmW7mfxZNou8qVm-RuL16eb9UzBDnmsaaBxoGHnojLIacFSg1aS11awQ4GxQobogEE5ojTHdNFq0pOwF2AwI4vsHN_NrLQ:1kX4wC:lh0EM_VM-WvZ3Kl1xSTWZFy4frIxROoFsJBuaLQFOes', '2020-11-09 16:01:36.494038'),
('pm7axm3pfqfrxy3i6ljda4t65fqqrn2p', 'Zjc1MzdjM2FjNjMwMjI2YTBiN2RmMjYyZTE5ZGNhNmY2Njc5M2FlNjp7ImN1c3RvbWVyX2lkIjoiQ18wOCIsImVtYWlsX2lkIjoicm9oaW5pLnZAY3MuY2hyaXN0dW5pdmVyc2l0eS5pbiIsIm5hbWUiOiJSb2hpbmkiLCJjb250YWN0X25vIjoiOTg5ODA3ODc4OSIsImFkZHJlc3NfaWQiOiJBZGRfMTQiLCJyb2xlX2lkIjoiUm9sZV8wMSJ9', '2020-11-04 05:16:06.777202'),
('pvgmrt9lzmovnksncyaqjt500h93qoq5', '.eJwljM0KwjAQhN9lz6U0atX2pHj05guEJVkwNT-wuxVEfHdTcptvmG--4FbRkoht8DDDzQ4TdEAJQ2zNCxeMvXuiKvFCdHFSiYPomsObWIJ--pCrlDFRFe6bUNGVrOjU5gKz2e0P4_F0njpA75lE2vnVe2vGOuYSqVWPLQ0Gfn8VBzMb:1kcZBT:aU1Bb1j4aIuKpqJCX9fa9S_BrEaO90vTAfSqNyCWiwQ', '2020-11-24 19:20:03.061717');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `newsletter_id` varchar(20) NOT NULL,
  `email_id` varchar(254) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`newsletter_id`, `email_id`, `is_delete`, `is_active`) VALUES
('Newsletter_01', 'shah.kalpeshkumar@cs.christuniversity.in', 0, 1),
('Newsletter_02', 'rohini.v@christuniversity.in', 0, 1),
('Newsletter_03', 'kajal.chatterjee@cs.christuniversity.in', 0, 1),
('Newsletter_04', 'kajal.chatterjee@cs.christuniversity.in', 0, 1),
('Newsletter_05', 'kajal.chatterjee@cs.christuniversity.in', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` varchar(20) NOT NULL,
  `is_successful` int(11) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `customer_order_id_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `is_successful`, `is_delete`, `is_active`, `customer_order_id_id`) VALUES
('Payment_01', 1, 0, 1, 'Order_01'),
('Payment_02', 1, 0, 1, 'Order_02'),
('Payment_03', 1, 0, 1, 'Order_03'),
('Payment_04', 1, 0, 1, 'Order_04'),
('Payment_05', 1, 0, 1, 'Order_05'),
('Payment_06', 1, 0, 1, 'Order_06'),
('Payment_07', 1, 0, 1, 'Order_07');

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `payment_type_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`payment_type_id`, `name`, `is_delete`, `is_active`) VALUES
('PT_01', 'Card', 0, 1),
('PT_02', 'UPI', 0, 1),
('PT_03', 'PayTM', 0, 1),
('PT_04', 'Cash', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` longtext,
  `total_stock` int(11) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `product_size` varchar(100) DEFAULT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `brand_id_id` varchar(20) NOT NULL,
  `color_id_id` varchar(20) NOT NULL,
  `sub_category2_id_id` varchar(20) NOT NULL,
  `supplier_id_id` varchar(20) NOT NULL,
  `is_pimple_product` int(11) NOT NULL,
  `is_wrinkle_product` int(11) NOT NULL,
  `skintone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `description`, `total_stock`, `current_stock`, `price`, `rating`, `product_size`, `product_image`, `is_delete`, `is_active`, `brand_id_id`, `color_id_id`, `sub_category2_id_id`, `supplier_id_id`, `is_pimple_product`, `is_wrinkle_product`, `skintone`) VALUES
('P_01', 'Matte Liquid Lipstick', 'Sugar Matte Liquid 4.5 ML', 100, 90, 600, 4, '4.5 ML', 'Lipsticks/1.jpg', 0, 1, 'PB_01', 'PC_05', 'Sub_Cat2_21', 'Sup_01', 0, 0, 'all'),
('P_02', 'Creamy Matte Lipstick', 'Maybelline Newyork Creamy Matte Lipstick', 100, 80, 500, 4.5, '25 gm', 'Lipsticks/2.jpg', 0, 1, 'PB_02', 'PC_02', 'Sub_Cat2_21', 'Sub_03', 0, 0, 'all'),
('P_03', 'Matte Browny Lipstick', 'Faces Canada Matte Browny Lipstick', 100, 70, 700, 4, '15 gm', 'Lipsticks/3.jpg', 0, 1, 'PB_03', 'PC_15', 'Sub_Cat2_21', 'Sup_02', 0, 0, 'all'),
('P_04', 'Glossy Red Lipstick', 'L.A Girl Glossy Red', 100, 50, 650, 3.5, '20 gm', 'Lipsticks/4.jpg', 0, 1, 'PB_04', 'PC_07', 'Sub_Cat2_21', 'Sup_04', 0, 0, 'all'),
('P_05', 'Matte Bloom Lipstick', 'Nykaa Matte Bloom', 100, 67, 399, 4.5, '15 gm', 'Lipsticks/5.jpg ', 0, 1, 'PB_05', 'PC_03', 'Sub_Cat2_21', 'Sup_05', 0, 0, 'all'),
('P_06', 'Browny Matte Lipstick', 'Nyx Browny Matte', 100, 76, 799, 4, '15 gm', 'Lipsticks/6.jpg', 0, 1, 'PB_06', 'PC_12', 'Sub_Cat2_21', 'Sup_02', 0, 0, 'all'),
('P_07', 'Glowy Foundation Stick', 'Sugar Glowy Foundation Stick', 100, 60, 799, 4.5, '12 gm', 'Foundations/1.jpg', 0, 1, 'PB_01', 'PC_16', 'Sub_Cat2_03', 'Sup_04', 0, 0, 'Fair'),
('P_08', 'Super Stay Liquid Foundation', 'Maybelline Newyork Super Stay Liquid Foundation', 100, 77, 495, 3.5, '50 ml', 'Foundations/2.jpg ', 0, 1, 'PB_02', 'PC_17', 'Sub_Cat2_03', 'Sup_05', 0, 0, 'Wheatish'),
('P_09', 'Spotless Foundation', 'Faces Canada Spotless Foundation', 100, 60, 699, 4.7, '15 ml', 'Foundations/3.jpg', 0, 1, 'PB_03', 'PC_18', 'Sub_Cat2_03', 'Sup_02', 0, 0, 'Dark'),
('P_10', 'Phyto RX Pimple Cream ', 'Lotus Phyto RX Pimple Cream', 100, 89, 495, 4, '20 ml', 'Day Cream/Pimple Care/1.jpg', 0, 1, 'PB_15', 'PC_16', 'Sub_Cat2_51', 'Sup_02', 1, 0, 'all'),
('P_11', 'Ageing Cream', 'Olay Ageing Cream', 100, 88, 399, 3.5, '50 ml', 'Day Cream/Wrinkle Care/1.jpg', 0, 1, 'PB_16', 'PC_16', 'Sub_Cat2_51', 'Sup_02', 0, 1, 'all');

-- --------------------------------------------------------

--
-- Table structure for table `product_brand`
--

CREATE TABLE `product_brand` (
  `product_brand_id` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_brand`
--

INSERT INTO `product_brand` (`product_brand_id`, `name`, `is_delete`, `is_active`) VALUES
('PB_01', 'Sugar', 0, 1),
('PB_02', 'Maybelline Newyork', 0, 1),
('PB_03', 'Faces Canada', 0, 1),
('PB_04', 'L.A Girl', 0, 1),
('PB_05', 'Nykaa', 0, 1),
('PB_06', 'Plum', 0, 1),
('PB_07', 'Nyx', 0, 1),
('PB_08', 'Makeup Revolution', 0, 1),
('PB_09', 'Kay Beauty', 0, 1),
('PB_10', 'My Glam', 0, 1),
('PB_11', 'Kylie', 0, 1),
('PB_12', 'L\'oreal Paris', 0, 1),
('PB_13', 'Lakme', 0, 1),
('PB_14', 'Huda Beauty', 0, 1),
('PB_15', 'Lotus', 0, 1),
('PB_16', 'Olay', 0, 1),
('PB_17', 'Gillette', 0, 1),
('PB_18', 'Axe', 0, 1),
('PB_19', 'Fanatic', 0, 1),
('PB_20', 'M.A.C', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `product_color_id` varchar(20) NOT NULL,
  `shade_name` varchar(20) DEFAULT NULL,
  `color_code` varchar(20) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`product_color_id`, `shade_name`, `color_code`, `is_delete`, `is_active`) VALUES
('PC_01', 'Pink', 'Pink_01', 0, 1),
('PC_02', 'Pink', 'Pink_02', 0, 1),
('PC_03', 'Pink', 'Pink_03', 0, 1),
('PC_04', 'Pink', 'Pink_04', 0, 1),
('PC_05', 'Pink', 'Pink_05', 0, 1),
('PC_06', 'Red', 'Red_01', 0, 1),
('PC_07', 'Red', 'Red_02', 0, 1),
('PC_08', 'Red', 'Red_03', 0, 1),
('PC_09', 'Red', 'Red_04', 0, 1),
('PC_10', 'Red', 'Red_05', 0, 1),
('PC_11', 'Brown', 'Brown_01', 0, 1),
('PC_12', 'Brown', 'Brown_02', 0, 1),
('PC_13', 'Brown', 'Brown_03', 0, 1),
('PC_14', 'Brown', 'Brown_04', 0, 1),
('PC_15', 'Brown', 'Brown_05', 0, 1),
('PC_16', 'Skin', 'Fair', 0, 1),
('PC_17', 'Skin', 'Wheatish', 0, 1),
('PC_18', 'Skin', 'Dark', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` varchar(20) NOT NULL,
  `review_message` longtext,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `customer_id_id` varchar(20) NOT NULL,
  `product_id_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `review_message`, `is_delete`, `is_active`, `customer_id_id`, `product_id_id`) VALUES
('Review_01', 'Very Nice', 0, 1, 'C_01', 'P_06'),
('Review_02', 'Very Nice Product', 0, 1, 'C_01', 'P_06'),
('Review_03', 'Long-Lasting Lipstick :)', 0, 1, 'C_01', 'P_06'),
('Review_04', 'Amazing Product', 0, 1, 'C_01', 'P_01'),
('Review_05', 'Good Product', 0, 1, 'C_04', 'P_01');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` varchar(20) NOT NULL,
  `role_type` varchar(20) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_type`, `is_delete`, `is_active`) VALUES
('Role_01', 'Customer', 0, 1),
('Role_02', 'Admin', 0, 1),
('Role_03', 'Supplier', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `name`, `is_delete`, `is_active`) VALUES
('State_01', 'Andhra Pradesh', 0, 1),
('State_02', 'Arunachal Pradesh', 0, 1),
('State_03', 'Assam', 0, 1),
('State_04', 'Bihar', 0, 1),
('State_05', 'Chhattisgarh', 0, 1),
('State_06', 'Goa', 0, 1),
('State_07', 'Gujarat', 0, 1),
('State_08', 'Haryana', 0, 1),
('State_09', 'Himachal Pradesh', 0, 1),
('State_10', 'Jharkhand', 0, 1),
('State_11', 'Karnataka', 0, 1),
('State_12', 'Kerala', 0, 1),
('State_13', 'Madhya Pradesh', 0, 1),
('State_14', 'Maharashtra', 0, 1),
('State_15', 'Manipur', 0, 1),
('State_16', 'Meghalaya', 0, 1),
('State_17', 'Mizoram', 0, 1),
('State_18', 'Nagaland', 0, 1),
('State_19', 'Odisha', 0, 1),
('State_20', 'Punjab', 0, 1),
('State_21', 'Rajasthan', 0, 1),
('State_22', 'Sikkim', 0, 1),
('State_23', 'Tamil Nadu', 0, 1),
('State_24', 'Telangana', 0, 1),
('State_25', 'Tripura', 0, 1),
('State_26', 'Uttar Pradesh', 0, 1),
('State_27', 'Uttarakhand', 0, 1),
('State_28', 'West Bengal', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category1`
--

CREATE TABLE `sub_category1` (
  `sub_category1_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `category_id_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category1`
--

INSERT INTO `sub_category1` (`sub_category1_id`, `name`, `is_delete`, `is_active`, `category_id_id`) VALUES
('Sub_Cat_01', 'Face', 0, 1, 'Cat_01'),
('Sub_Cat_02', 'Eyes', 0, 1, 'Cat_01'),
('Sub_Cat_03', 'Lips', 0, 1, 'Cat_01'),
('Sub_Cat_04', 'Makeup Kits', 0, 1, 'Cat_01'),
('Sub_Cat_05', 'Nails', 0, 1, 'Cat_01'),
('Sub_Cat_06', 'Tools & Brushes', 0, 1, 'Cat_01'),
('Sub_Cat_07', 'Cleanser', 0, 1, 'Cat_02'),
('Sub_Cat_08', 'Toner', 0, 1, 'Cat_02'),
('Sub_Cat_09', 'Moisturizer', 0, 1, 'Cat_02'),
('Sub_Cat_10', 'Masks', 0, 1, 'Cat_02'),
('Sub_Cat_11', 'Eye Care', 0, 1, 'Cat_02'),
('Sub_Cat_12', 'Body Care', 0, 1, 'Cat_02'),
('Sub_Cat_13', 'Lip Care', 0, 1, 'Cat_02'),
('Sub_Cat_14', 'Sun Care', 0, 1, 'Cat_02'),
('Sub_Cat_15', 'Hair Care', 0, 1, 'Cat_03'),
('Sub_Cat_16', 'Tools & Accessories', 0, 1, 'Cat_03'),
('Sub_Cat_17', 'Hair Styling', 0, 1, 'Cat_03'),
('Sub_Cat_18', 'Baby Care', 0, 1, 'Cat_04'),
('Sub_Cat_19', 'Maternity care', 0, 1, 'Cat_04'),
('Sub_Cat_20', 'Shaving', 0, 1, 'Cat_05'),
('Sub_Cat_21', 'Beard Care', 0, 1, 'Cat_05'),
('Sub_Cat_22', 'Hair care', 0, 1, 'Cat_05'),
('Sub_Cat_23', 'Skin Care', 0, 1, 'Cat_05'),
('Sub_Cat_24', 'Bath & Body', 0, 1, 'Cat_05'),
('Sub_Cat_25', 'Fragrance', 0, 1, 'Cat_05'),
('Sub_Cat_26', 'Women', 0, 1, 'Cat_06'),
('Sub_Cat_27', 'Men', 0, 1, 'Cat_06');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category2`
--

CREATE TABLE `sub_category2` (
  `sub_category2_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `sub_category1_id_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category2`
--

INSERT INTO `sub_category2` (`sub_category2_id`, `name`, `is_delete`, `is_active`, `sub_category1_id_id`) VALUES
('Sub_Cat2_01', 'Face Primer', 0, 1, 'Sub_Cat_01'),
('Sub_Cat2_02', 'Concealer', 0, 1, 'Sub_Cat_01'),
('Sub_Cat2_03', 'Foundation', 0, 1, 'Sub_Cat_01'),
('Sub_Cat2_04', 'Compact', 0, 1, 'Sub_Cat_01'),
('Sub_Cat2_05', 'Contour', 0, 1, 'Sub_Cat_01'),
('Sub_Cat2_06', 'Loose Powder', 0, 1, 'Sub_Cat_01'),
('Sub_Cat2_07', 'Bronzer', 0, 1, 'Sub_Cat_01'),
('Sub_Cat2_08', 'BB & CC Cream', 0, 1, 'Sub_Cat_01'),
('Sub_Cat2_09', 'Highlighter', 0, 1, 'Sub_Cat_01'),
('Sub_Cat2_10', 'Setting Spray', 0, 1, 'Sub_Cat_01'),
('Sub_Cat2_100', 'Conditioner', 0, 1, 'Sub_Cat_22'),
('Sub_Cat2_101', 'Hair Oil', 0, 1, 'Sub_Cat_22'),
('Sub_Cat2_102', 'Hair Colour', 0, 1, 'Sub_Cat_22'),
('Sub_Cat2_105', 'Face Wash', 0, 1, 'Sub_Cat_23'),
('Sub_Cat2_106', 'Moisturizer', 0, 1, 'Sub_Cat_23'),
('Sub_Cat2_107', 'Sunscreen', 0, 1, 'Sub_Cat_23'),
('Sub_Cat2_108', 'Scrub & Exfoliator', 0, 1, 'Sub_Cat_23'),
('Sub_Cat2_109', 'Masks', 0, 1, 'Sub_Cat_23'),
('Sub_Cat2_11', 'Makeup Remover', 0, 1, 'Sub_Cat_01'),
('Sub_Cat2_110', 'Bath Gels', 0, 1, 'Sub_Cat_24'),
('Sub_Cat2_111', 'Soaps', 0, 1, 'Sub_Cat_24'),
('Sub_Cat2_112', 'Talc', 0, 1, 'Sub_Cat_24'),
('Sub_Cat2_113', 'Deodorants', 0, 1, 'Sub_Cat_26'),
('Sub_Cat2_114', 'Colognes', 0, 1, 'Sub_Cat_26'),
('Sub_Cat2_115', 'Luxe Fragrances', 0, 1, 'Sub_Cat_26'),
('Sub_Cat2_116', 'Deodorants', 0, 1, 'Sub_Cat_27'),
('Sub_Cat2_117', 'Body Mist', 0, 1, 'Sub_Cat_27'),
('Sub_Cat2_118', 'Perfumes', 0, 1, 'Sub_Cat_27'),
('Sub_Cat2_119', 'Deodorants', 0, 1, 'Sub_Cat_25'),
('Sub_Cat2_12', 'Kajal', 0, 1, 'Sub_Cat_02'),
('Sub_Cat2_120', 'Body Mist', 0, 1, 'Sub_Cat_25'),
('Sub_Cat2_121', 'Perfumes', 0, 1, 'Sub_Cat_25'),
('Sub_Cat2_13', 'Eyeliner', 0, 1, 'Sub_Cat_02'),
('Sub_Cat2_14', 'Mascara', 0, 1, 'Sub_Cat_02'),
('Sub_Cat2_15', 'Eyeshadow', 0, 1, 'Sub_Cat_02'),
('Sub_Cat2_16', 'Eyebrow Enhancer', 0, 1, 'Sub_Cat_02'),
('Sub_Cat2_17', 'Eye Primer', 0, 1, 'Sub_Cat_02'),
('Sub_Cat2_18', 'False Eye Lashes', 0, 1, 'Sub_Cat_02'),
('Sub_Cat2_19', 'Eye Makeup Remover', 0, 1, 'Sub_Cat_02'),
('Sub_Cat2_20', 'Under Eye Concealer', 0, 1, 'Sub_Cat_02'),
('Sub_Cat2_21', 'Lipstick', 0, 1, 'Sub_Cat_03'),
('Sub_Cat2_22', 'Liquid Lipstick', 0, 1, 'Sub_Cat_03'),
('Sub_Cat2_23', 'Lip Crayon', 0, 1, 'Sub_Cat_03'),
('Sub_Cat2_24', 'Lip Gloss', 0, 1, 'Sub_Cat_03'),
('Sub_Cat2_25', 'Lip Liner', 0, 1, 'Sub_Cat_03'),
('Sub_Cat2_26', 'Lip Balm', 0, 1, 'Sub_Cat_03'),
('Sub_Cat2_27', 'Eye Palettes', 0, 1, 'Sub_Cat_04'),
('Sub_Cat2_28', 'Face Palettes', 0, 1, 'Sub_Cat_04'),
('Sub_Cat2_29', 'Nail Polish', 0, 1, 'Sub_Cat_05'),
('Sub_Cat2_30', 'Nail Art Kits', 0, 1, 'Sub_Cat_05'),
('Sub_Cat2_31', 'Nail Polish Set', 0, 1, 'Sub_Cat_05'),
('Sub_Cat2_32', 'Nail Care', 0, 1, 'Sub_Cat_05'),
('Sub_Cat2_33', 'Nail Polish Remover', 0, 1, 'Sub_Cat_05'),
('Sub_Cat2_34', 'Manicure & Pedicure ', 0, 1, 'Sub_Cat_05'),
('Sub_Cat2_35', 'Face Brush', 0, 1, 'Sub_Cat_06'),
('Sub_Cat2_36', 'Eye Brush', 0, 1, 'Sub_Cat_06'),
('Sub_Cat2_37', 'Blush Brush', 0, 1, 'Sub_Cat_06'),
('Sub_Cat2_38', 'Lip Brush', 0, 1, 'Sub_Cat_06'),
('Sub_Cat2_39', 'Brush Set', 0, 1, 'Sub_Cat_06'),
('Sub_Cat2_40', 'Mirrors', 0, 1, 'Sub_Cat_06'),
('Sub_Cat2_41', 'Sharprners', 0, 1, 'Sub_Cat_06'),
('Sub_Cat2_42', 'Tweezers', 0, 1, 'Sub_Cat_06'),
('Sub_Cat2_43', 'Makeup Pouches', 0, 1, 'Sub_Cat_06'),
('Sub_Cat2_44', 'Sponge & Application', 0, 1, 'Sub_Cat_06'),
('Sub_Cat2_45', 'Face Wash', 0, 1, 'Sub_Cat_07'),
('Sub_Cat2_46', 'Cleanser', 0, 1, 'Sub_Cat_07'),
('Sub_Cat2_47', 'Scrub & Exfoliator', 0, 1, 'Sub_Cat_07'),
('Sub_Cat2_48', 'Facial Wipes', 0, 1, 'Sub_Cat_07'),
('Sub_Cat2_49', 'Makeup Remover', 0, 1, 'Sub_Cat_07'),
('Sub_Cat2_50', 'Toner & Mist', 0, 1, 'Sub_Cat_08'),
('Sub_Cat2_51', 'Day Cream', 0, 1, 'Sub_Cat_09'),
('Sub_Cat2_52', 'Night Cream', 0, 1, 'Sub_Cat_09'),
('Sub_Cat2_53', 'Serum & Essence', 0, 1, 'Sub_Cat_09'),
('Sub_Cat2_54', 'Face Oil', 0, 1, 'Sub_Cat_09'),
('Sub_Cat2_55', 'Masks & Peel', 0, 1, 'Sub_Cat_10'),
('Sub_Cat2_56', 'Sheet Masks', 0, 1, 'Sub_Cat_10'),
('Sub_Cat2_57', 'Under Eye Cream', 0, 1, 'Sub_Cat_11'),
('Sub_Cat2_58', 'Dark Circle/Wrinkle', 0, 1, 'Sub_Cat_11'),
('Sub_Cat2_59', 'Puffiness', 0, 1, 'Sub_Cat_11'),
('Sub_Cat2_60', 'Eye Mask', 0, 1, 'Sub_Cat_11'),
('Sub_Cat2_61', 'Body Butter', 0, 1, 'Sub_Cat_12'),
('Sub_Cat2_62', 'Lotions & Creams', 0, 1, 'Sub_Cat_12'),
('Sub_Cat2_63', 'Lip Balm', 0, 1, 'Sub_Cat_13'),
('Sub_Cat2_64', 'Lip Scrub', 0, 1, 'Sub_Cat_13'),
('Sub_Cat2_65', 'Lip Mask', 0, 1, 'Sub_Cat_13'),
('Sub_Cat2_66', 'Face Sun Care', 0, 1, 'Sub_Cat_14'),
('Sub_Cat2_67', 'Body Sun Care', 0, 1, 'Sub_Cat_14'),
('Sub_Cat2_68', 'Shampoo', 0, 1, 'Sub_Cat_15'),
('Sub_Cat2_69', 'Conditioner', 0, 1, 'Sub_Cat_15'),
('Sub_Cat2_70', 'Hair Oil', 0, 1, 'Sub_Cat_15'),
('Sub_Cat2_71', 'Hair Serum', 0, 1, 'Sub_Cat_15'),
('Sub_Cat2_72', 'Hair Cream & Oil', 0, 1, 'Sub_Cat_15'),
('Sub_Cat2_75', 'Hair Brush', 0, 1, 'Sub_Cat_16'),
('Sub_Cat2_76', 'Hair Comb', 0, 1, 'Sub_Cat_16'),
('Sub_Cat2_77', 'Hair Dryers', 0, 1, 'Sub_Cat_16'),
('Sub_Cat2_78', 'Hair Straightners', 0, 1, 'Sub_Cat_16'),
('Sub_Cat2_79', 'Rollers & Curlers', 0, 1, 'Sub_Cat_16'),
('Sub_Cat2_80', 'Hair Extensions', 0, 1, 'Sub_Cat_16'),
('Sub_Cat2_81', 'Hair Accessories', 0, 1, 'Sub_Cat_16'),
('Sub_Cat2_82', 'Hair Colours', 0, 1, 'Sub_Cat_17'),
('Sub_Cat2_83', 'Hair Spray', 0, 1, 'Sub_Cat_17'),
('Sub_Cat2_84', 'Hair Gels & Waxes', 0, 1, 'Sub_Cat_17'),
('Sub_Cat2_85', 'Bath Time', 0, 1, 'Sub_Cat_18'),
('Sub_Cat2_86', 'Rash Creams', 0, 1, 'Sub_Cat_18'),
('Sub_Cat2_87', 'Creams & Lotions', 0, 1, 'Sub_Cat_18'),
('Sub_Cat2_88', 'Oils', 0, 1, 'Sub_Cat_18'),
('Sub_Cat2_89', 'Stretch Marks Cream', 0, 1, 'Sub_Cat_19'),
('Sub_Cat2_90', 'Intimate Care', 0, 1, 'Sub_Cat_19'),
('Sub_Cat2_91', 'Razors', 0, 1, 'Sub_Cat_20'),
('Sub_Cat2_92', 'Shavers', 0, 1, 'Sub_Cat_20'),
('Sub_Cat2_93', 'Shaving Cream', 0, 1, 'Sub_Cat_20'),
('Sub_Cat2_94', 'Shaving Foam', 0, 1, 'Sub_Cat_20'),
('Sub_Cat2_95', 'Shaving Gel', 0, 1, 'Sub_Cat_20'),
('Sub_Cat2_96', 'Beard Oil', 0, 1, 'Sub_Cat_21'),
('Sub_Cat2_97', 'Beard Butter', 0, 1, 'Sub_Cat_21'),
('Sub_Cat2_98', 'Beard Wash', 0, 1, 'Sub_Cat_21'),
('Sub_Cat2_99', 'Shampoo', 0, 1, 'Sub_Cat_22');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` varchar(20) NOT NULL,
  `company_name` varchar(20) DEFAULT NULL,
  `contact_no` bigint(20) DEFAULT NULL,
  `email_id` varchar(254) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `partnership_date` date DEFAULT NULL,
  `latest_supply_date` date DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `address_id_id` varchar(20) NOT NULL,
  `payment_type_id_id` varchar(20) NOT NULL,
  `role_id_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `company_name`, `contact_no`, `email_id`, `password`, `partnership_date`, `latest_supply_date`, `is_delete`, `is_active`, `address_id_id`, `payment_type_id_id`, `role_id_id`) VALUES
('Sub_03', 'Beauty Center', 7854466777, 'beauty.center@gmail.com', 'beautycenter123', '2019-02-01', '2020-09-15', 0, 1, 'Add_03', 'PT_01', 'Role_03'),
('Sup_01', 'Beauty Hub', 9879779776, 'beauty.hub@gmail.com', 'beautyhub123', '2018-05-01', '2020-09-20', 0, 1, 'Add_01', 'PT_01', 'Role_03'),
('Sup_02', 'She Cosmetics', 789678555, 'she.cosmetics@gmail.com', 'shecosmetics123', '2016-01-01', '2020-09-05', 0, 1, 'Add_02', 'PT_01', 'Role_03'),
('Sup_04', 'Hey Beauty', 8866565678, 'hey.beauty@gmail.com', 'heybeauty123', '2019-05-01', '2020-08-31', 0, 1, 'Add_04', 'PT_01', 'Role_03'),
('Sup_05', 'Cosmo', 885567678, 'cosmo@gmail.com', 'cosmo123', '2018-09-01', '2020-09-22', 0, 1, 'Add_05', 'PT_01', 'Role_03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `Address_city_id_id_218bfef8_fk_City_city_id` (`city_id_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `Admin_role_id_id_b749ee30_fk_Role_role_id` (`role_id_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `blogpost`
--
ALTER TABLE `blogpost`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `City_state_id_id_a6c9a0e0_fk_State_state_id` (`state_id_id`);

--
-- Indexes for table `client_skin_survey`
--
ALTER TABLE `client_skin_survey`
  ADD PRIMARY KEY (`skin_survey_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `Customer_address_id_id_91d73f86_fk_Address_address_id` (`address_id_id`),
  ADD KEY `Customer_role_id_id_98d4939c_fk_Role_role_id` (`role_id_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`customer_order_id`),
  ADD KEY `Customer_Order_address_id_id_1101438c_fk_Address_address_id` (`address_id_id`),
  ADD KEY `Customer_Order_customer_id_id_30111c41_fk_Customer_customer_id` (`customer_id_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`newsletter_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `Payment_customer_order_id_id_11d57e25_fk_Customer_` (`customer_order_id_id`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`payment_type_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `Product_brand_id_id_ac3c2145_fk_Product_Brand_product_brand_id` (`brand_id_id`),
  ADD KEY `Product_color_id_id_f82362d9_fk_Product_Color_product_color_id` (`color_id_id`),
  ADD KEY `Product_sub_category2_id_id_fde73c6b_fk_Sub_Categ` (`sub_category2_id_id`),
  ADD KEY `Product_supplier_id_id_1d6294c4_fk_Supplier_supplier_id` (`supplier_id_id`);

--
-- Indexes for table `product_brand`
--
ALTER TABLE `product_brand`
  ADD PRIMARY KEY (`product_brand_id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`product_color_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `Review_customer_id_id_c5286eb9_fk_Customer_customer_id` (`customer_id_id`),
  ADD KEY `Review_product_id_id_008015c7_fk_Product_product_id` (`product_id_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `sub_category1`
--
ALTER TABLE `sub_category1`
  ADD PRIMARY KEY (`sub_category1_id`),
  ADD KEY `Sub_Category1_category_id_id_bc11f8fc_fk_Category_category_id` (`category_id_id`);

--
-- Indexes for table `sub_category2`
--
ALTER TABLE `sub_category2`
  ADD PRIMARY KEY (`sub_category2_id`),
  ADD KEY `Sub_Category2_sub_category1_id_id_fac8abf9_fk_Sub_Categ` (`sub_category1_id_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `Supplier_address_id_id_4d07c87e_fk_Address_address_id` (`address_id_id`),
  ADD KEY `Supplier_payment_type_id_id_686da4b4_fk_Payment_T` (`payment_type_id_id`),
  ADD KEY `Supplier_role_id_id_88890404_fk_Role_role_id` (`role_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogpost`
--
ALTER TABLE `blogpost`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `Address_city_id_id_218bfef8_fk_City_city_id` FOREIGN KEY (`city_id_id`) REFERENCES `city` (`city_id`);

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `Admin_role_id_id_b749ee30_fk_Role_role_id` FOREIGN KEY (`role_id_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `City_state_id_id_a6c9a0e0_fk_State_state_id` FOREIGN KEY (`state_id_id`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `Customer_address_id_id_91d73f86_fk_Address_address_id` FOREIGN KEY (`address_id_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `Customer_role_id_id_98d4939c_fk_Role_role_id` FOREIGN KEY (`role_id_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `Customer_Order_address_id_id_1101438c_fk_Address_address_id` FOREIGN KEY (`address_id_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `Customer_Order_customer_id_id_30111c41_fk_Customer_customer_id` FOREIGN KEY (`customer_id_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `Payment_customer_order_id_id_11d57e25_fk_Customer_` FOREIGN KEY (`customer_order_id_id`) REFERENCES `customer_order` (`customer_order_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Product_brand_id_id_ac3c2145_fk_Product_Brand_product_brand_id` FOREIGN KEY (`brand_id_id`) REFERENCES `product_brand` (`product_brand_id`),
  ADD CONSTRAINT `Product_color_id_id_f82362d9_fk_Product_Color_product_color_id` FOREIGN KEY (`color_id_id`) REFERENCES `product_color` (`product_color_id`),
  ADD CONSTRAINT `Product_sub_category2_id_id_fde73c6b_fk_Sub_Categ` FOREIGN KEY (`sub_category2_id_id`) REFERENCES `sub_category2` (`sub_category2_id`),
  ADD CONSTRAINT `Product_supplier_id_id_1d6294c4_fk_Supplier_supplier_id` FOREIGN KEY (`supplier_id_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `Review_customer_id_id_c5286eb9_fk_Customer_customer_id` FOREIGN KEY (`customer_id_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `Review_product_id_id_008015c7_fk_Product_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `sub_category1`
--
ALTER TABLE `sub_category1`
  ADD CONSTRAINT `Sub_Category1_category_id_id_bc11f8fc_fk_Category_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `sub_category2`
--
ALTER TABLE `sub_category2`
  ADD CONSTRAINT `Sub_Category2_sub_category1_id_id_fac8abf9_fk_Sub_Categ` FOREIGN KEY (`sub_category1_id_id`) REFERENCES `sub_category1` (`sub_category1_id`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `Supplier_address_id_id_4d07c87e_fk_Address_address_id` FOREIGN KEY (`address_id_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `Supplier_payment_type_id_id_686da4b4_fk_Payment_T` FOREIGN KEY (`payment_type_id_id`) REFERENCES `payment_type` (`payment_type_id`),
  ADD CONSTRAINT `Supplier_role_id_id_88890404_fk_Role_role_id` FOREIGN KEY (`role_id_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
