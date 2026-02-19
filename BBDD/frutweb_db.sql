-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-02-2026 a las 17:56:35
-- Versión del servidor: 12.2.2-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `frutweb_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `u_creacion` int(11) DEFAULT NULL,
  `f_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `u_modificacion` int(11) DEFAULT NULL,
  `f_modificacion` datetime DEFAULT NULL,
  `estado` enum('pendiente','preparando','enviado','entregado') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`, `precio_unitario`, `u_creacion`, `f_creacion`, `u_modificacion`, `f_modificacion`, `estado`) VALUES
(1, 1, 1, 2, 12.00, 2, '2026-02-12 15:39:31', NULL, NULL, 'entregado'),
(2, 1, 6, 1, 3.00, 2, '2026-02-12 15:39:31', NULL, NULL, 'entregado'),
(3, 1, 4, 1, 3.50, 2, '2026-02-12 15:39:31', NULL, NULL, 'entregado'),
(4, 1, 10, 1, 2.50, 2, '2026-02-12 15:39:31', NULL, NULL, 'entregado'),
(5, 2, 1, 2, 12.00, 2, '2026-02-12 15:39:35', NULL, NULL, 'entregado'),
(6, 2, 6, 1, 3.00, 2, '2026-02-12 15:39:35', NULL, NULL, 'entregado'),
(7, 2, 4, 1, 3.50, 2, '2026-02-12 15:39:35', NULL, NULL, 'entregado'),
(8, 2, 10, 1, 2.50, 2, '2026-02-12 15:39:35', NULL, NULL, 'entregado'),
(9, 3, 1, 2, 12.00, 2, '2026-02-12 15:39:38', NULL, NULL, 'entregado'),
(10, 3, 6, 1, 3.00, 2, '2026-02-12 15:39:38', NULL, NULL, 'entregado'),
(11, 3, 4, 1, 3.50, 2, '2026-02-12 15:39:38', NULL, NULL, 'entregado'),
(12, 3, 10, 1, 2.50, 2, '2026-02-12 15:39:38', NULL, NULL, 'entregado'),
(13, 4, 1, 2, 12.00, 2, '2026-02-12 15:39:44', NULL, NULL, 'entregado'),
(14, 4, 4, 1, 3.50, 2, '2026-02-12 15:39:44', NULL, NULL, 'entregado'),
(15, 4, 6, 1, 3.00, 2, '2026-02-12 15:39:44', NULL, NULL, 'entregado'),
(16, 4, 10, 1, 2.50, 2, '2026-02-12 15:39:44', NULL, NULL, 'entregado'),
(17, 5, 1, 2, 12.00, 2, '2026-02-12 15:45:20', NULL, NULL, 'entregado'),
(18, 5, 6, 1, 3.00, 2, '2026-02-12 15:45:20', NULL, NULL, 'entregado'),
(19, 5, 4, 1, 3.50, 2, '2026-02-12 15:45:20', NULL, NULL, 'entregado'),
(20, 5, 5, 1, 4.00, 2, '2026-02-12 15:45:20', NULL, NULL, 'entregado'),
(21, 6, 5, 1, 4.00, 1, '2026-02-12 20:14:58', NULL, NULL, 'entregado'),
(22, 6, 10, 1, 2.50, 1, '2026-02-12 20:14:58', NULL, NULL, 'entregado'),
(23, 7, 5, 1, 4.00, 1, '2026-02-12 20:14:59', NULL, NULL, 'entregado'),
(24, 7, 10, 1, 2.50, 1, '2026-02-12 20:14:59', NULL, NULL, 'entregado'),
(25, 8, 4, 1, 3.50, 8, '2026-02-12 20:27:10', NULL, NULL, 'entregado'),
(26, 8, 5, 1, 4.00, 8, '2026-02-12 20:27:10', NULL, NULL, 'entregado'),
(27, 9, 4, 1, 3.50, 8, '2026-02-12 20:27:11', NULL, NULL, 'entregado'),
(28, 9, 5, 1, 4.00, 8, '2026-02-12 20:27:11', NULL, NULL, 'entregado'),
(29, 10, 4, 1, 3.50, 8, '2026-02-12 20:27:12', NULL, NULL, 'entregado'),
(30, 10, 5, 1, 4.00, 8, '2026-02-12 20:27:12', NULL, NULL, 'entregado'),
(31, 11, 4, 1, 3.50, 8, '2026-02-12 20:27:12', NULL, NULL, 'entregado'),
(32, 11, 5, 1, 4.00, 8, '2026-02-12 20:27:12', NULL, NULL, 'entregado'),
(33, 12, 4, 1, 3.50, 8, '2026-02-12 20:27:12', NULL, NULL, 'entregado'),
(34, 12, 5, 1, 4.00, 8, '2026-02-12 20:27:12', NULL, NULL, 'entregado'),
(35, 13, 4, 1, 3.50, 1, '2026-02-12 20:44:22', NULL, NULL, 'entregado'),
(36, 13, 5, 1, 4.00, 1, '2026-02-12 20:44:22', NULL, NULL, 'entregado'),
(37, 14, 4, 1, 3.50, 1, '2026-02-12 20:44:22', NULL, NULL, 'entregado'),
(38, 14, 5, 1, 4.00, 1, '2026-02-12 20:44:22', NULL, NULL, 'entregado'),
(39, 15, 4, 1, 3.50, 1, '2026-02-12 20:44:23', NULL, NULL, 'entregado'),
(40, 15, 5, 1, 4.00, 1, '2026-02-12 20:44:23', NULL, NULL, 'entregado'),
(41, 16, 4, 1, 3.50, 1, '2026-02-12 20:44:23', NULL, NULL, 'entregado'),
(42, 16, 5, 1, 4.00, 1, '2026-02-12 20:44:23', NULL, NULL, 'entregado'),
(43, 17, 4, 1, 3.50, 1, '2026-02-12 20:44:23', NULL, NULL, 'entregado'),
(44, 17, 5, 1, 4.00, 1, '2026-02-12 20:44:23', NULL, NULL, 'entregado'),
(45, 18, 4, 1, 3.50, 1, '2026-02-12 20:44:23', NULL, NULL, 'entregado'),
(46, 18, 5, 1, 4.00, 1, '2026-02-12 20:44:23', NULL, NULL, 'entregado'),
(47, 19, 4, 1, 3.50, 1, '2026-02-12 20:46:01', NULL, NULL, 'entregado'),
(48, 19, 5, 1, 4.00, 1, '2026-02-12 20:46:01', NULL, NULL, 'entregado'),
(49, 20, 8, 2, 2.00, 2, '2026-02-13 13:16:11', NULL, NULL, 'pendiente'),
(50, 20, 1, 1, 12.00, 2, '2026-02-13 13:16:11', NULL, NULL, 'pendiente'),
(51, 21, 8, 2, 2.00, 2, '2026-02-13 13:16:13', NULL, NULL, 'entregado'),
(52, 21, 1, 1, 12.00, 2, '2026-02-13 13:16:13', NULL, NULL, 'entregado'),
(53, 22, 8, 2, 2.00, 2, '2026-02-13 13:16:20', NULL, NULL, 'pendiente'),
(54, 22, 1, 1, 12.00, 2, '2026-02-13 13:16:20', NULL, NULL, 'pendiente'),
(55, 23, 8, 2, 2.00, 2, '2026-02-13 13:16:22', NULL, NULL, 'entregado'),
(56, 23, 1, 1, 12.00, 2, '2026-02-13 13:16:22', NULL, NULL, 'entregado'),
(57, 24, 5, 1, 4.00, 9, '2026-02-13 17:41:24', NULL, NULL, 'pendiente'),
(58, 24, 6, 1, 3.00, 9, '2026-02-13 17:41:24', NULL, NULL, 'pendiente'),
(59, 24, 7, 1, 1.50, 9, '2026-02-13 17:41:24', NULL, NULL, 'pendiente'),
(60, 24, 8, 2, 2.00, 9, '2026-02-13 17:41:24', NULL, NULL, 'pendiente'),
(61, 25, 5, 1, 4.00, 9, '2026-02-13 17:41:26', NULL, NULL, 'entregado'),
(62, 25, 6, 1, 3.00, 9, '2026-02-13 17:41:26', NULL, NULL, 'entregado'),
(63, 25, 8, 2, 2.00, 9, '2026-02-13 17:41:26', NULL, NULL, 'entregado'),
(64, 25, 7, 1, 1.50, 9, '2026-02-13 17:41:26', NULL, NULL, 'entregado'),
(65, 26, 5, 1, 4.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'pendiente'),
(66, 26, 6, 1, 3.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'pendiente'),
(67, 26, 7, 1, 1.50, 9, '2026-02-13 17:41:27', NULL, NULL, 'pendiente'),
(68, 26, 8, 2, 2.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'pendiente'),
(69, 27, 5, 1, 4.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'entregado'),
(70, 27, 6, 1, 3.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'entregado'),
(71, 27, 7, 1, 1.50, 9, '2026-02-13 17:41:27', NULL, NULL, 'entregado'),
(72, 27, 8, 2, 2.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'entregado'),
(73, 28, 5, 1, 4.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'pendiente'),
(74, 28, 7, 1, 1.50, 9, '2026-02-13 17:41:27', NULL, NULL, 'pendiente'),
(75, 28, 8, 2, 2.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'pendiente'),
(76, 28, 6, 1, 3.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'pendiente'),
(77, 29, 5, 1, 4.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'entregado'),
(78, 29, 7, 1, 1.50, 9, '2026-02-13 17:41:27', NULL, NULL, 'entregado'),
(79, 29, 6, 1, 3.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'entregado'),
(80, 29, 8, 2, 2.00, 9, '2026-02-13 17:41:27', NULL, NULL, 'entregado'),
(81, 30, 5, 1, 4.00, 9, '2026-02-13 17:41:39', NULL, NULL, 'pendiente'),
(82, 30, 6, 1, 3.00, 9, '2026-02-13 17:41:39', NULL, NULL, 'pendiente'),
(83, 30, 7, 1, 1.50, 9, '2026-02-13 17:41:39', NULL, NULL, 'pendiente'),
(84, 31, 5, 1, 4.00, 9, '2026-02-13 17:41:39', NULL, NULL, 'entregado'),
(85, 30, 8, 2, 2.00, 9, '2026-02-13 17:41:39', NULL, NULL, 'pendiente'),
(86, 31, 6, 1, 3.00, 9, '2026-02-13 17:41:39', NULL, NULL, 'entregado'),
(87, 31, 7, 1, 1.50, 9, '2026-02-13 17:41:39', NULL, NULL, 'entregado'),
(88, 31, 8, 2, 2.00, 9, '2026-02-13 17:41:39', NULL, NULL, 'entregado'),
(89, 32, 13, 1, 25.00, 1, '2026-02-16 16:25:15', NULL, NULL, 'pendiente'),
(90, 32, 8, 1, 2.00, 1, '2026-02-16 16:25:15', NULL, NULL, 'pendiente'),
(91, 32, 10, 1, 2.50, 1, '2026-02-16 16:25:15', NULL, NULL, 'pendiente'),
(92, 32, 17, 1, 1.20, 1, '2026-02-16 16:25:15', NULL, NULL, 'pendiente'),
(93, 33, 13, 1, 25.00, 1, '2026-02-16 16:25:21', NULL, NULL, 'entregado'),
(94, 33, 8, 1, 2.00, 1, '2026-02-16 16:25:21', NULL, NULL, 'entregado'),
(95, 33, 10, 1, 2.50, 1, '2026-02-16 16:25:21', NULL, NULL, 'entregado'),
(96, 33, 17, 1, 1.20, 1, '2026-02-16 16:25:21', NULL, NULL, 'entregado'),
(97, 34, 13, 1, 25.00, 1, '2026-02-16 16:34:22', NULL, NULL, 'pendiente'),
(98, 34, 8, 1, 2.00, 1, '2026-02-16 16:34:22', NULL, NULL, 'pendiente'),
(99, 34, 10, 1, 2.50, 1, '2026-02-16 16:34:22', NULL, NULL, 'pendiente'),
(100, 34, 17, 1, 1.20, 1, '2026-02-16 16:34:22', NULL, NULL, 'pendiente'),
(101, 35, 13, 1, 25.00, 1, '2026-02-16 16:34:23', NULL, NULL, 'entregado'),
(102, 35, 8, 1, 2.00, 1, '2026-02-16 16:34:23', NULL, NULL, 'entregado'),
(103, 35, 10, 1, 2.50, 1, '2026-02-16 16:34:23', NULL, NULL, 'entregado'),
(104, 35, 17, 1, 1.20, 1, '2026-02-16 16:34:23', NULL, NULL, 'entregado'),
(105, 36, 13, 1, 25.00, 1, '2026-02-16 16:34:23', NULL, NULL, 'pendiente'),
(106, 36, 8, 1, 2.00, 1, '2026-02-16 16:34:23', NULL, NULL, 'pendiente'),
(107, 36, 10, 1, 2.50, 1, '2026-02-16 16:34:23', NULL, NULL, 'pendiente'),
(108, 36, 17, 1, 1.20, 1, '2026-02-16 16:34:23', NULL, NULL, 'pendiente'),
(109, 37, 13, 1, 25.00, 1, '2026-02-16 16:34:23', NULL, NULL, 'entregado'),
(110, 37, 8, 1, 2.00, 1, '2026-02-16 16:34:23', NULL, NULL, 'entregado'),
(111, 37, 10, 1, 2.50, 1, '2026-02-16 16:34:23', NULL, NULL, 'entregado'),
(112, 37, 17, 1, 1.20, 1, '2026-02-16 16:34:23', NULL, NULL, 'entregado'),
(113, 38, 13, 1, 25.00, 1, '2026-02-16 16:34:27', NULL, NULL, 'pendiente'),
(114, 38, 8, 1, 2.00, 1, '2026-02-16 16:34:27', NULL, NULL, 'pendiente'),
(115, 38, 10, 1, 2.50, 1, '2026-02-16 16:34:27', NULL, NULL, 'pendiente'),
(116, 38, 17, 1, 1.20, 1, '2026-02-16 16:34:27', NULL, NULL, 'pendiente'),
(117, 39, 13, 1, 25.00, 1, '2026-02-16 16:34:27', NULL, NULL, 'entregado'),
(118, 39, 8, 1, 2.00, 1, '2026-02-16 16:34:27', NULL, NULL, 'entregado'),
(119, 39, 10, 1, 2.50, 1, '2026-02-16 16:34:27', NULL, NULL, 'entregado'),
(120, 39, 17, 1, 1.20, 1, '2026-02-16 16:34:27', NULL, NULL, 'entregado'),
(121, 40, 13, 1, 25.00, 1, '2026-02-16 16:37:08', NULL, NULL, 'pendiente'),
(122, 40, 8, 1, 2.00, 1, '2026-02-16 16:37:08', NULL, NULL, 'pendiente'),
(123, 41, 13, 1, 25.00, 1, '2026-02-16 16:37:08', NULL, NULL, 'entregado'),
(124, 42, 13, 1, 25.00, 1, '2026-02-16 16:37:08', NULL, NULL, 'pendiente'),
(125, 42, 10, 1, 2.50, 1, '2026-02-16 16:37:08', NULL, NULL, 'pendiente'),
(126, 42, 17, 1, 1.20, 1, '2026-02-16 16:37:08', NULL, NULL, 'pendiente'),
(127, 40, 17, 1, 1.20, 1, '2026-02-16 16:37:08', NULL, NULL, 'pendiente'),
(128, 40, 10, 1, 2.50, 1, '2026-02-16 16:37:08', NULL, NULL, 'pendiente'),
(129, 41, 8, 1, 2.00, 1, '2026-02-16 16:37:08', NULL, NULL, 'entregado'),
(130, 41, 10, 1, 2.50, 1, '2026-02-16 16:37:08', NULL, NULL, 'entregado'),
(131, 41, 17, 1, 1.20, 1, '2026-02-16 16:37:08', NULL, NULL, 'entregado'),
(132, 42, 8, 1, 2.00, 1, '2026-02-16 16:37:08', NULL, NULL, 'pendiente'),
(133, 43, 8, 1, 2.00, 1, '2026-02-16 16:46:52', NULL, NULL, 'entregado'),
(134, 43, 10, 1, 2.50, 1, '2026-02-16 16:46:52', NULL, NULL, 'entregado'),
(135, 43, 11, 1, 4.50, 1, '2026-02-16 16:46:52', NULL, NULL, 'entregado'),
(136, 43, 17, 1, 1.20, 1, '2026-02-16 16:46:52', NULL, NULL, 'entregado'),
(137, 44, 8, 1, 2.00, 1, '2026-02-16 16:47:38', NULL, NULL, 'entregado'),
(138, 44, 10, 1, 2.50, 1, '2026-02-16 16:47:38', NULL, NULL, 'entregado'),
(139, 44, 17, 1, 1.20, 1, '2026-02-16 16:47:38', NULL, NULL, 'entregado'),
(140, 44, 11, 1, 4.50, 1, '2026-02-16 16:47:38', NULL, NULL, 'entregado'),
(141, 45, 8, 1, 2.00, 1, '2026-02-16 16:47:51', NULL, NULL, 'entregado'),
(142, 45, 10, 1, 2.50, 1, '2026-02-16 16:47:51', NULL, NULL, 'entregado'),
(143, 45, 17, 1, 1.20, 1, '2026-02-16 16:47:51', NULL, NULL, 'entregado'),
(144, 45, 11, 1, 4.50, 1, '2026-02-16 16:47:51', NULL, NULL, 'entregado'),
(145, 46, 8, 1, 2.00, 1, '2026-02-16 16:47:51', NULL, NULL, 'entregado'),
(146, 46, 10, 1, 2.50, 1, '2026-02-16 16:47:51', NULL, NULL, 'entregado'),
(147, 46, 17, 1, 1.20, 1, '2026-02-16 16:47:51', NULL, NULL, 'entregado'),
(148, 46, 11, 1, 4.50, 1, '2026-02-16 16:47:51', NULL, NULL, 'entregado'),
(149, 47, 8, 1, 2.00, 1, '2026-02-16 16:52:55', NULL, NULL, 'entregado'),
(150, 47, 10, 1, 2.50, 1, '2026-02-16 16:52:55', NULL, NULL, 'entregado'),
(151, 47, 17, 1, 1.20, 1, '2026-02-16 16:52:55', NULL, NULL, 'entregado'),
(152, 47, 11, 1, 4.50, 1, '2026-02-16 16:52:55', NULL, NULL, 'entregado'),
(153, 48, 8, 1, 2.00, 1, '2026-02-16 16:52:56', NULL, NULL, 'entregado'),
(154, 48, 10, 1, 2.50, 1, '2026-02-16 16:52:56', NULL, NULL, 'entregado'),
(155, 48, 17, 1, 1.20, 1, '2026-02-16 16:52:56', NULL, NULL, 'entregado'),
(156, 48, 11, 1, 4.50, 1, '2026-02-16 16:52:56', NULL, NULL, 'entregado'),
(157, 49, 8, 1, 2.00, 1, '2026-02-16 16:52:56', NULL, NULL, 'entregado'),
(158, 49, 10, 1, 2.50, 1, '2026-02-16 16:52:56', NULL, NULL, 'entregado'),
(159, 49, 17, 1, 1.20, 1, '2026-02-16 16:52:56', NULL, NULL, 'entregado'),
(160, 49, 11, 1, 4.50, 1, '2026-02-16 16:52:56', NULL, NULL, 'entregado'),
(161, 50, 8, 1, 2.00, 1, '2026-02-16 16:56:52', NULL, NULL, 'entregado'),
(162, 50, 17, 1, 1.20, 1, '2026-02-16 16:56:52', NULL, NULL, 'entregado'),
(163, 50, 10, 1, 2.50, 1, '2026-02-16 16:56:52', NULL, NULL, 'entregado'),
(164, 51, 10, 1, 2.50, 2, '2026-02-16 16:57:31', NULL, NULL, 'entregado'),
(165, 51, 17, 1, 1.20, 2, '2026-02-16 16:57:31', NULL, NULL, 'entregado'),
(166, 51, 18, 1, 5.60, 2, '2026-02-16 16:57:31', NULL, NULL, 'entregado'),
(167, 52, 10, 1, 2.50, 2, '2026-02-16 16:57:32', NULL, NULL, 'pendiente'),
(168, 52, 17, 1, 1.20, 2, '2026-02-16 16:57:32', NULL, NULL, 'pendiente'),
(169, 52, 18, 1, 5.60, 2, '2026-02-16 16:57:32', NULL, NULL, 'pendiente'),
(170, 53, 10, 1, 2.50, 2, '2026-02-16 16:57:32', NULL, NULL, 'entregado'),
(171, 53, 17, 1, 1.20, 2, '2026-02-16 16:57:32', NULL, NULL, 'entregado'),
(172, 53, 18, 1, 5.60, 2, '2026-02-16 16:57:32', NULL, NULL, 'entregado'),
(173, 54, 10, 1, 2.50, 2, '2026-02-16 16:57:33', NULL, NULL, 'pendiente'),
(174, 54, 17, 1, 1.20, 2, '2026-02-16 16:57:33', NULL, NULL, 'pendiente'),
(175, 54, 18, 1, 5.60, 2, '2026-02-16 16:57:33', NULL, NULL, 'pendiente'),
(176, 55, 10, 1, 2.50, 2, '2026-02-16 16:57:33', NULL, NULL, 'pendiente'),
(177, 55, 17, 1, 1.20, 2, '2026-02-16 16:57:33', NULL, NULL, 'pendiente'),
(178, 55, 18, 1, 5.60, 2, '2026-02-16 16:57:33', NULL, NULL, 'pendiente'),
(179, 56, 10, 1, 2.50, 2, '2026-02-16 16:57:33', NULL, NULL, 'pendiente'),
(180, 56, 17, 1, 1.20, 2, '2026-02-16 16:57:33', NULL, NULL, 'pendiente'),
(181, 56, 18, 1, 5.60, 2, '2026-02-16 16:57:33', NULL, NULL, 'pendiente'),
(182, 57, 10, 1, 2.50, 2, '2026-02-16 17:02:23', NULL, NULL, 'pendiente'),
(183, 57, 17, 1, 1.20, 2, '2026-02-16 17:02:23', NULL, NULL, 'pendiente'),
(184, 57, 18, 1, 5.60, 2, '2026-02-16 17:02:23', NULL, NULL, 'pendiente'),
(185, 58, 13, 1, 25.00, 2, '2026-02-16 17:17:31', NULL, NULL, 'pendiente'),
(186, 59, 13, 1, 25.00, 2, '2026-02-16 17:20:34', NULL, NULL, 'pendiente'),
(187, 60, 13, 1, 25.00, 2, '2026-02-16 17:22:39', NULL, NULL, ''),
(188, 61, 13, 1, 25.00, 2, '2026-02-16 17:28:02', NULL, NULL, 'pendiente'),
(189, 62, 13, 1, 25.00, 2, '2026-02-16 17:28:12', NULL, NULL, 'pendiente'),
(190, 63, 13, 1, 25.00, 2, '2026-02-16 17:34:23', NULL, NULL, 'pendiente'),
(191, 64, 4, 1, 3.50, 2, '2026-02-16 17:35:23', NULL, NULL, 'pendiente'),
(192, 64, 19, 2, 1.20, 2, '2026-02-16 17:35:23', NULL, NULL, 'pendiente'),
(193, 64, 8, 1, 2.00, 2, '2026-02-16 17:35:23', NULL, NULL, 'pendiente'),
(194, 65, 4, 1, 3.50, 2, '2026-02-16 17:37:51', NULL, NULL, ''),
(195, 65, 8, 1, 2.00, 2, '2026-02-16 17:37:51', NULL, NULL, ''),
(196, 65, 19, 2, 1.20, 2, '2026-02-16 17:37:51', NULL, NULL, ''),
(197, 66, 4, 1, 3.50, 2, '2026-02-16 17:38:44', NULL, NULL, 'pendiente'),
(198, 67, 4, 1, 3.50, 2, '2026-02-16 17:40:00', NULL, NULL, 'entregado'),
(199, 68, 4, 1, 3.50, 2, '2026-02-16 17:40:00', NULL, NULL, 'preparando'),
(200, 69, 4, 1, 3.50, 2, '2026-02-16 17:40:02', NULL, NULL, 'entregado'),
(201, 70, 4, 1, 3.50, 2, '2026-02-16 17:40:48', NULL, NULL, 'preparando'),
(202, 70, 13, 1, 25.00, 2, '2026-02-16 17:40:48', NULL, NULL, 'preparando'),
(203, 71, 4, 1, 3.50, 2, '2026-02-16 17:40:59', NULL, NULL, 'entregado'),
(204, 71, 13, 1, 25.00, 2, '2026-02-16 17:40:59', NULL, NULL, 'entregado'),
(205, 72, 4, 1, 3.50, 2, '2026-02-16 17:43:17', NULL, NULL, 'preparando'),
(206, 72, 13, 1, 25.00, 2, '2026-02-16 17:43:17', NULL, NULL, 'preparando'),
(207, 73, 10, 1, 2.50, 12, '2026-02-17 09:03:04', NULL, NULL, 'entregado'),
(208, 73, 18, 1, 5.60, 12, '2026-02-17 09:03:04', NULL, NULL, 'entregado'),
(209, 73, 14, 2, 40.00, 12, '2026-02-17 09:03:04', NULL, NULL, 'entregado'),
(210, 74, 8, 1, 2.00, 1, '2026-02-17 12:35:23', NULL, NULL, 'pendiente'),
(211, 75, 10, 1, 2.50, 1, '2026-02-17 12:46:11', NULL, NULL, 'pendiente'),
(212, 75, 8, 1, 2.00, 1, '2026-02-17 12:46:11', NULL, NULL, 'pendiente'),
(213, 75, 11, 2, 4.50, 1, '2026-02-17 12:46:11', NULL, NULL, 'pendiente'),
(214, 75, 7, 1, 1.50, 1, '2026-02-17 12:46:11', NULL, NULL, 'pendiente'),
(215, 76, 13, 1, 25.00, 1, '2026-02-17 15:56:12', NULL, NULL, 'entregado'),
(216, 76, 10, 1, 2.50, 1, '2026-02-17 15:56:12', NULL, NULL, 'entregado'),
(217, 79, 13, 1, 25.00, 1, '2026-02-18 09:18:00', NULL, NULL, 'pendiente'),
(218, 80, 4, 10, 3.50, 2, '2026-02-18 10:32:58', NULL, NULL, 'pendiente'),
(219, 80, 5, 5, 4.00, 2, '2026-02-18 10:32:58', NULL, NULL, 'pendiente'),
(220, 81, 10, 1, 2.50, 1, '2026-02-18 11:09:53', NULL, NULL, 'pendiente');

--
-- Disparadores `detalle_pedido`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `estado` enum('pendiente','preparando','enviado','entregado') DEFAULT 'pendiente',
  `total` decimal(10,2) DEFAULT NULL,
  `u_creacion` int(11) DEFAULT NULL,
  `f_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `u_modificacion` int(11) DEFAULT NULL,
  `f_modificacion` datetime DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_usuario`, `fecha`, `estado`, `total`, `u_creacion`, `f_creacion`, `u_modificacion`, `f_modificacion`, `telefono`, `direccion`) VALUES
(1, 2, '2026-02-12 15:39:31', 'entregado', 33.00, 2, '2026-02-12 15:39:31', NULL, NULL, NULL, NULL),
(2, 2, '2026-02-12 15:39:35', 'entregado', 33.00, 2, '2026-02-12 15:39:35', NULL, NULL, NULL, NULL),
(3, 2, '2026-02-12 15:39:38', 'entregado', 33.00, 2, '2026-02-12 15:39:38', NULL, NULL, NULL, NULL),
(4, 2, '2026-02-12 15:39:44', 'entregado', 33.00, 2, '2026-02-12 15:39:44', NULL, NULL, NULL, NULL),
(5, 2, '2026-02-12 15:45:20', 'entregado', 34.50, 2, '2026-02-12 15:45:20', NULL, NULL, NULL, NULL),
(6, 1, '2026-02-12 20:14:58', 'entregado', 6.50, 1, '2026-02-12 20:14:58', NULL, NULL, NULL, NULL),
(7, 1, '2026-02-12 20:14:59', 'entregado', 6.50, 1, '2026-02-12 20:14:59', NULL, NULL, NULL, NULL),
(8, 8, '2026-02-12 20:27:10', 'entregado', 7.50, 8, '2026-02-12 20:27:10', NULL, NULL, NULL, NULL),
(9, 8, '2026-02-12 20:27:11', 'entregado', 7.50, 8, '2026-02-12 20:27:11', NULL, NULL, NULL, NULL),
(10, 8, '2026-02-12 20:27:12', 'entregado', 7.50, 8, '2026-02-12 20:27:12', NULL, NULL, NULL, NULL),
(11, 8, '2026-02-12 20:27:12', 'entregado', 7.50, 8, '2026-02-12 20:27:12', NULL, NULL, NULL, NULL),
(12, 8, '2026-02-12 20:27:12', 'entregado', 7.50, 8, '2026-02-12 20:27:12', NULL, NULL, NULL, NULL),
(13, 1, '2026-02-12 20:44:22', 'entregado', 7.50, 1, '2026-02-12 20:44:22', NULL, NULL, NULL, NULL),
(14, 1, '2026-02-12 20:44:22', 'entregado', 7.50, 1, '2026-02-12 20:44:22', NULL, NULL, NULL, NULL),
(15, 1, '2026-02-12 20:44:23', 'entregado', 7.50, 1, '2026-02-12 20:44:23', NULL, NULL, NULL, NULL),
(16, 1, '2026-02-12 20:44:23', 'entregado', 7.50, 1, '2026-02-12 20:44:23', NULL, NULL, NULL, NULL),
(17, 1, '2026-02-12 20:44:23', 'entregado', 7.50, 1, '2026-02-12 20:44:23', NULL, NULL, NULL, NULL),
(18, 1, '2026-02-12 20:44:23', 'entregado', 7.50, 1, '2026-02-12 20:44:23', NULL, NULL, NULL, NULL),
(19, 1, '2026-02-12 20:46:01', 'entregado', 7.50, 1, '2026-02-12 20:46:01', NULL, NULL, NULL, NULL),
(20, 2, '2026-02-13 13:16:11', 'pendiente', 16.00, 2, '2026-02-13 13:16:11', NULL, NULL, NULL, NULL),
(21, 2, '2026-02-13 13:16:13', 'entregado', 16.00, 2, '2026-02-13 13:16:13', NULL, NULL, NULL, NULL),
(22, 2, '2026-02-13 13:16:20', 'pendiente', 16.00, 2, '2026-02-13 13:16:20', NULL, NULL, NULL, NULL),
(23, 2, '2026-02-13 13:16:22', 'entregado', 16.00, 2, '2026-02-13 13:16:22', NULL, NULL, NULL, NULL),
(24, 9, '2026-02-13 17:41:24', 'pendiente', 12.50, 9, '2026-02-13 17:41:24', NULL, NULL, NULL, NULL),
(25, 9, '2026-02-13 17:41:26', 'entregado', 12.50, 9, '2026-02-13 17:41:26', NULL, NULL, NULL, NULL),
(26, 9, '2026-02-13 17:41:27', 'pendiente', 12.50, 9, '2026-02-13 17:41:27', NULL, NULL, NULL, NULL),
(27, 9, '2026-02-13 17:41:27', 'entregado', 12.50, 9, '2026-02-13 17:41:27', NULL, NULL, NULL, NULL),
(28, 9, '2026-02-13 17:41:27', 'pendiente', 12.50, 9, '2026-02-13 17:41:27', NULL, NULL, NULL, NULL),
(29, 9, '2026-02-13 17:41:27', 'entregado', 12.50, 9, '2026-02-13 17:41:27', NULL, NULL, NULL, NULL),
(30, 9, '2026-02-13 17:41:39', 'pendiente', 12.50, 9, '2026-02-13 17:41:39', NULL, NULL, NULL, NULL),
(31, 9, '2026-02-13 17:41:39', 'entregado', 12.50, 9, '2026-02-13 17:41:39', NULL, NULL, NULL, NULL),
(32, 1, '2026-02-16 16:25:15', 'pendiente', 30.70, 1, '2026-02-16 16:25:15', NULL, NULL, NULL, NULL),
(33, 1, '2026-02-16 16:25:21', 'entregado', 30.70, 1, '2026-02-16 16:25:21', NULL, NULL, NULL, NULL),
(34, 1, '2026-02-16 16:34:22', 'pendiente', 30.70, 1, '2026-02-16 16:34:22', NULL, NULL, NULL, NULL),
(35, 1, '2026-02-16 16:34:23', 'entregado', 30.70, 1, '2026-02-16 16:34:23', NULL, NULL, NULL, NULL),
(36, 1, '2026-02-16 16:34:23', 'pendiente', 30.70, 1, '2026-02-16 16:34:23', NULL, NULL, NULL, NULL),
(37, 1, '2026-02-16 16:34:23', 'entregado', 30.70, 1, '2026-02-16 16:34:23', NULL, NULL, NULL, NULL),
(38, 1, '2026-02-16 16:34:27', 'pendiente', 30.70, 1, '2026-02-16 16:34:27', NULL, NULL, NULL, NULL),
(39, 1, '2026-02-16 16:34:27', 'entregado', 30.70, 1, '2026-02-16 16:34:27', NULL, NULL, NULL, NULL),
(40, 1, '2026-02-16 16:37:08', 'pendiente', 30.70, 1, '2026-02-16 16:37:08', NULL, NULL, NULL, NULL),
(41, 1, '2026-02-16 16:37:08', 'entregado', 30.70, 1, '2026-02-16 16:37:08', NULL, NULL, NULL, NULL),
(42, 1, '2026-02-16 16:37:08', 'pendiente', 30.70, 1, '2026-02-16 16:37:08', NULL, NULL, NULL, NULL),
(43, 1, '2026-02-16 16:46:52', 'entregado', 10.20, 1, '2026-02-16 16:46:52', NULL, NULL, NULL, NULL),
(44, 1, '2026-02-16 16:47:38', 'entregado', 10.20, 1, '2026-02-16 16:47:38', NULL, NULL, NULL, NULL),
(45, 1, '2026-02-16 16:47:51', 'entregado', 10.20, 1, '2026-02-16 16:47:51', NULL, NULL, NULL, NULL),
(46, 1, '2026-02-16 16:47:51', 'entregado', 10.20, 1, '2026-02-16 16:47:51', NULL, NULL, NULL, NULL),
(47, 1, '2026-02-16 16:52:55', 'entregado', 10.20, 1, '2026-02-16 16:52:55', NULL, NULL, NULL, NULL),
(48, 1, '2026-02-16 16:52:56', 'entregado', 10.20, 1, '2026-02-16 16:52:56', NULL, NULL, NULL, NULL),
(49, 1, '2026-02-16 16:52:56', 'entregado', 10.20, 1, '2026-02-16 16:52:56', NULL, NULL, NULL, NULL),
(50, 1, '2026-02-16 16:56:52', 'entregado', 5.70, 1, '2026-02-16 16:56:52', NULL, NULL, NULL, NULL),
(51, 2, '2026-02-16 16:57:31', 'entregado', 9.30, 2, '2026-02-16 16:57:31', NULL, NULL, NULL, NULL),
(52, 2, '2026-02-16 16:57:32', 'pendiente', 9.30, 2, '2026-02-16 16:57:32', NULL, NULL, NULL, NULL),
(53, 2, '2026-02-16 16:57:32', 'entregado', 9.30, 2, '2026-02-16 16:57:32', NULL, NULL, NULL, NULL),
(54, 2, '2026-02-16 16:57:33', 'pendiente', 9.30, 2, '2026-02-16 16:57:33', NULL, NULL, NULL, NULL),
(55, 2, '2026-02-16 16:57:33', 'pendiente', 9.30, 2, '2026-02-16 16:57:33', NULL, NULL, NULL, NULL),
(56, 2, '2026-02-16 16:57:33', 'pendiente', 9.30, 2, '2026-02-16 16:57:33', NULL, NULL, NULL, NULL),
(57, 2, '2026-02-16 17:02:23', 'pendiente', 9.30, 2, '2026-02-16 17:02:23', NULL, NULL, NULL, NULL),
(58, 2, '2026-02-16 17:17:31', 'pendiente', 25.00, 2, '2026-02-16 17:17:31', NULL, NULL, NULL, NULL),
(59, 2, '2026-02-16 17:20:34', 'pendiente', 25.00, 2, '2026-02-16 17:20:34', NULL, NULL, NULL, NULL),
(60, 2, '2026-02-16 17:22:39', '', 25.00, 2, '2026-02-16 17:22:39', NULL, NULL, NULL, NULL),
(61, 2, '2026-02-16 17:28:02', 'pendiente', 25.00, 2, '2026-02-16 17:28:02', NULL, NULL, NULL, NULL),
(62, 2, '2026-02-16 17:28:12', 'pendiente', 25.00, 2, '2026-02-16 17:28:12', NULL, NULL, NULL, NULL),
(63, 2, '2026-02-16 17:34:23', 'pendiente', 25.00, 2, '2026-02-16 17:34:23', NULL, NULL, NULL, NULL),
(64, 2, '2026-02-16 17:35:23', 'pendiente', 7.90, 2, '2026-02-16 17:35:23', NULL, NULL, NULL, NULL),
(65, 2, '2026-02-16 17:37:51', '', 7.90, 2, '2026-02-16 17:37:51', NULL, NULL, NULL, NULL),
(66, 2, '2026-02-16 17:38:44', 'pendiente', 3.50, 2, '2026-02-16 17:38:44', NULL, NULL, NULL, NULL),
(67, 2, '2026-02-16 17:40:00', 'entregado', 3.50, 2, '2026-02-16 17:40:00', NULL, NULL, NULL, NULL),
(68, 2, '2026-02-16 17:40:00', 'preparando', 3.50, 2, '2026-02-16 17:40:00', NULL, NULL, NULL, NULL),
(69, 2, '2026-02-16 17:40:02', 'entregado', 3.50, 2, '2026-02-16 17:40:02', NULL, NULL, NULL, NULL),
(70, 2, '2026-02-16 17:40:48', 'preparando', 28.50, 2, '2026-02-16 17:40:48', NULL, NULL, NULL, NULL),
(71, 2, '2026-02-16 17:40:59', 'entregado', 28.50, 2, '2026-02-16 17:40:59', NULL, NULL, NULL, NULL),
(72, 2, '2026-02-16 17:43:17', 'preparando', 28.50, 2, '2026-02-16 17:43:17', NULL, NULL, NULL, NULL),
(73, 12, '2026-02-17 09:03:04', 'entregado', 88.10, 12, '2026-02-17 09:03:04', NULL, NULL, NULL, NULL),
(74, 1, '2026-02-17 12:35:23', 'pendiente', 2.00, 1, '2026-02-17 12:35:23', NULL, NULL, NULL, NULL),
(75, 1, '2026-02-17 12:46:11', 'pendiente', 15.00, 1, '2026-02-17 12:46:11', NULL, NULL, NULL, NULL),
(76, 1, '2026-02-17 15:56:12', 'entregado', 27.50, 1, '2026-02-17 15:56:12', NULL, NULL, NULL, NULL),
(79, 1, '2026-02-18 09:18:00', 'pendiente', 25.00, 1, '2026-02-18 09:18:00', NULL, NULL, NULL, NULL),
(80, 2, '2026-02-18 10:32:58', 'pendiente', 55.00, 2, '2026-02-18 10:32:58', NULL, NULL, '600123564', 'calle wenceslao , n 7, santa lucia'),
(81, 1, '2026-02-18 11:09:53', 'pendiente', 2.50, 1, '2026-02-18 11:09:53', NULL, NULL, '678987654', 'administrador, 12, 1, 35001, Las Palmas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `imagen_url` varchar(250) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `categoria` enum('fruta','verdura','combo') NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `u_creacion` int(11) DEFAULT NULL,
  `f_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `u_modificacion` int(11) DEFAULT NULL,
  `f_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `imagen_url`, `nombre`, `categoria`, `descripcion`, `precio`, `stock`, `u_creacion`, `f_creacion`, `u_modificacion`, `f_modificacion`) VALUES
(1, 'https://images.unsplash.com/photo-1587393855524-087f83d95bc9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZnJlc2FzfGVufDB8fDB8fHww', 'Fresa', 'fruta', 'Fresas de valsequillo 12€ \nlas mas frescas del mercado', 12.00, 15, 1, '2026-02-10 16:35:37', NULL, NULL),
(4, 'https://images.unsplash.com/photo-1770361515876-4cbcd2841f99?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGtpd2lzfGVufDB8fDB8fHww', 'Kiwis', 'fruta', 'Los Kiwis mas frescos', 3.50, 20, 1, '2026-02-11 16:15:39', NULL, NULL),
(5, 'https://images.unsplash.com/photo-1610397962076-02407a169a5b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWFuemFuYXN8ZW58MHx8MHx8fDA%3D', 'Manzanas', 'fruta', 'De km 0 ', 4.00, 45, 1, '2026-02-11 16:17:17', NULL, NULL),
(6, 'https://images.unsplash.com/photo-1631299106224-aae61c217164?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXZhc3xlbnwwfHwwfHx8MA%3D%3D', 'Uvas', 'fruta', 'De Lanzarote', 3.00, 45, 1, '2026-02-11 16:19:01', NULL, NULL),
(7, 'https://images.unsplash.com/photo-1590165482129-1b8b27698780?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGF0YXRhc3xlbnwwfHwwfHx8MA%3D%3D', 'Papas', 'verdura', 'Papas de la huerta canaria', 1.50, 456, 1, '2026-02-11 16:20:15', NULL, NULL),
(8, 'https://plus.unsplash.com/premium_photo-1668076517573-fa01307d87ad?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y2Vib2xsYXN8ZW58MHx8MHx8fDA%3D', 'Cebolla', 'verdura', 'Cebolla de Gáldar', 2.00, 345, 1, '2026-02-11 16:21:35', NULL, NULL),
(10, 'https://images.unsplash.com/photo-1730815048561-45df6f7f331d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmF0YXRhfGVufDB8fDB8fHww', 'Batata', 'verdura', 'De Km 0 para el puchero', 2.50, 343, 1, '2026-02-11 16:23:31', NULL, NULL),
(11, 'https://images.unsplash.com/photo-1566842600175-97dca489844f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29saWZsb3J8ZW58MHx8MHx8fDA%3D', 'Coliflor', 'verdura', 'Recién cosechada', 4.50, 23, 1, '2026-02-11 16:25:05', NULL, NULL),
(12, 'https://images.unsplash.com/photo-1753172433718-d0c2a99443d8?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Combo 2', 'combo', 'Nuestra muestra mas freshhh', 50.00, 4, 1, '2026-02-11 16:28:31', NULL, NULL),
(13, 'https://images.unsplash.com/photo-1635774855717-0aec182f92cc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGNlc3RhJTIwZnJ1dGFzfGVufDB8fDB8fHww', 'Combo frutas', 'combo', 'Selección de frutas de temporada ', 25.00, 0, 1, '2026-02-11 16:30:00', NULL, NULL),
(14, 'https://images.unsplash.com/photo-1579113800032-c38bd7635818?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dmVyZHVyYXN8ZW58MHx8MHx8fDA%3D', 'Combo pucherito', 'combo', 'El preferido', 40.00, 2, 1, '2026-02-11 16:31:53', NULL, NULL),
(15, 'https://images.unsplash.com/photo-1639588473831-dd9d014646ae?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bWVsb2NvdG9ufGVufDB8fDB8fHww', 'melocotón', 'fruta', 'Los más queridos en Tejeda ', 6.00, 2, 1, '2026-02-12 17:48:49', NULL, NULL),
(16, 'https://images.unsplash.com/photo-1587393855524-087f83d95bc9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZnJlc2FzfGVufDB8fDB8fHww', 'Combo 4', 'combo', 'Combo variado con frutas y verduras de km 0.', 50.00, 3, 1, '2026-02-12 20:31:46', NULL, NULL),
(17, 'https://images.unsplash.com/photo-1730202351667-a4599d13a92c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dmVyZHVyYSUyMGNhbGFiYWNpbnxlbnwwfHwwfHx8MA%3D%3D', 'Calabacín', 'verdura', 'Calabacines de Valleseco', 1.20, 150, 1, '2026-02-13 18:13:20', NULL, NULL),
(18, 'https://images.unsplash.com/photo-1601039641847-7857b994d704?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YWd1YWNhdGV8ZW58MHx8MHx8fDA%3D', 'Aguacate', 'fruta', 'Aguacate de Mogán', 5.60, 120, 1, '2026-02-13 18:19:25', NULL, NULL),
(19, 'https://plus.unsplash.com/premium_photo-1675040830227-9f18e88fd1f9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y29jb3N8ZW58MHx8MHx8fDA%3D', 'Coco', 'fruta', 'Están coconudos', 1.20, 12, 1, '2026-02-13 18:59:03', NULL, NULL),
(20, 'https://plus.unsplash.com/premium_photo-1667385010535-898d3d193c50?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGNhamElMjBkZSUyMGZydXRhc3xlbnwwfHwwfHx8MA%3D%3D', 'Combo frutas', 'combo', 'Toma tu dosis de vitaminas cada día', 25.00, 8, 1, '2026-02-18 16:52:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('admin','cliente') DEFAULT 'cliente',
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `u_creacion` int(11) DEFAULT NULL,
  `f_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `u_modificacion` int(11) DEFAULT NULL,
  `f_modificacion` datetime DEFAULT NULL,
  `consentimiento_datos` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_consentimiento` datetime DEFAULT NULL,
  `acepta_marketing` tinyint(1) NOT NULL DEFAULT 0,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `password`, `rol`, `direccion`, `telefono`, `ultimo_login`, `u_creacion`, `f_creacion`, `u_modificacion`, `f_modificacion`, `consentimiento_datos`, `fecha_consentimiento`, `acepta_marketing`, `estado`) VALUES
(1, 'Admin Frutweb', 'admin@frutweb.es', '$2b$10$jxIPIgMFoNyiQzLa7mXtcu0/PEx7P5EBRodPOUBKhvPtnQKCt73JG', 'admin', NULL, NULL, '2026-02-18 16:49:04', 0, '2026-02-06 16:28:30', NULL, NULL, 0, NULL, 0, 1),
(2, 'Marco', 'marco@h.com', '$2b$10$PnTalWCXCjVcgsE.9cg3HOEaf17gwoRJpUcsfGBSj2zeB9OdKWxvO', 'cliente', NULL, NULL, '2026-02-18 16:32:41', NULL, '2026-02-09 13:10:44', NULL, NULL, 1, '2026-02-09 13:10:44', 0, 1),
(7, 'Administrador', 'admin@frutweb.com', '$2b$10$GyuMlwj8txtWW3uLVolTNOZcZGPCKmLRNYrWQjzcVwgjNURYD7Y6S', 'admin', NULL, NULL, '2026-02-10 17:53:28', NULL, '2026-02-10 12:38:05', NULL, NULL, 1, '2026-02-10 12:38:05', 0, 1),
(8, 'Francisco ', 'fran@t.com', '$2b$10$3M5Bi.uzqlH70JJ9G8CPWuitok31iFW62HN.YNq/F70kyrHp.DxCq', 'cliente', NULL, NULL, '2026-02-12 20:24:45', NULL, '2026-02-12 20:22:49', NULL, NULL, 1, '2026-02-12 20:22:49', 0, 1),
(9, 'Kiran', 'Ki@kiran.com', '$2b$10$RpqR5zv9bc6y9hzPQePMZOC1OEAvKuAjtzFgFtUni4JI5hzE0KYye', 'cliente', NULL, NULL, '2026-02-13 18:27:48', NULL, '2026-02-13 17:38:47', NULL, NULL, 1, '2026-02-13 17:38:46', 0, 1),
(12, 'Francisco ', 'paco@paco.com', '$2b$10$bNNpAzRQ4Sm44awTL9ryr.W2yTxNQ0lsNyNZA4K0xUkeyKKVm6OiS', 'cliente', NULL, NULL, '2026-02-17 09:02:25', NULL, '2026-02-17 09:02:10', NULL, NULL, 1, '2026-02-17 09:02:10', 0, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `fk_detalle_pedido` (`id_pedido`),
  ADD KEY `fk_detalle_producto` (`id_producto`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedido_usuario` (`id_usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `fk_pedido_detalle` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_producto_detalle` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE SET NULL;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `fk_usuario_pedido` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
