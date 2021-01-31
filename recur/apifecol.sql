-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-01-2021 a las 04:48:55
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apifecol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_billers`
--

CREATE TABLE `api_billers` (
  `id` int(12) NOT NULL,
  `profile_id` int(12) DEFAULT NULL,
  `name` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `identification_number` int(12) DEFAULT NULL,
  `dv` int(12) DEFAULT NULL,
  `language_id` int(12) DEFAULT NULL,
  `tax_id` int(12) DEFAULT NULL,
  `type_environment_id` int(12) DEFAULT NULL,
  `type_document_identification_id` int(12) DEFAULT NULL,
  `country_id` int(12) DEFAULT NULL,
  `type_currency_id` int(12) DEFAULT NULL,
  `type_organization_id` int(12) DEFAULT NULL,
  `type_regime_id` int(12) DEFAULT NULL,
  `type_liability_id` int(12) DEFAULT NULL,
  `municipality_id` int(12) DEFAULT NULL,
  `deparment_id` int(12) DEFAULT NULL,
  `bank_account_id` int(12) DEFAULT NULL,
  `bank_account_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `bank_account_number` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `merchant_registration` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `software_id` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `pin` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `test_id` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `printing_format` tinyint(2) DEFAULT NULL,
  `send_method` int(12) DEFAULT NULL,
  `address` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `certificate` text CHARACTER SET latin1,
  `certificate_password` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `certificate_validity` datetime DEFAULT NULL,
  `host_email` varchar(55) CHARACTER SET latin1 DEFAULT NULL,
  `host_username` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `host_password` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `host_port` int(2) DEFAULT NULL,
  `integrations` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `image` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='apifecol';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_packages`
--

CREATE TABLE `api_packages` (
  `id` int(12) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `billing_period` int(11) DEFAULT NULL,
  `documents_number` int(10) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='apifel';

--
-- Volcado de datos para la tabla `api_packages`
--

INSERT INTO `api_packages` (`id`, `name`, `price`, `billing_period`, `documents_number`, `created_at`, `updated_at`) VALUES
(1, 'starte', 59000, 0, 80, '2021-01-30 00:00:00', '2021-01-30 00:00:00'),
(2, 'Pyme', 150000, 1, 160, '2021-01-30 00:00:00', '2021-01-30 00:00:00'),
(3, 'Enterprise', 300000, 1, 240, '2021-01-30 00:00:00', '2021-01-30 00:00:00'),
(4, 'Gold', 600000, 1, 480, '2021-01-30 00:00:00', '2021-01-30 00:00:00'),
(5, 'Diamond', 1200000, 1, 960, '2021-01-30 00:00:00', '2021-01-30 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_profiles`
--

CREATE TABLE `api_profiles` (
  `id` int(12) NOT NULL,
  `company` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `phone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `regimen` int(1) NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `city_id` int(12) DEFAULT NULL,
  `country_id` int(12) DEFAULT NULL,
  `id_fiscal` int(12) DEFAULT NULL,
  `package_code` int(12) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `language_id` int(12) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `brand_logo` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `main_color` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `system_responsible` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `codpostal` varchar(10) CHARACTER SET latin1 DEFAULT '',
  `moneda` varchar(6) CHARACTER SET latin1 DEFAULT '',
  `doc` varchar(20) CHARACTER SET latin1 DEFAULT '0',
  `Adm` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `resolucion` varchar(15) CHARACTER SET latin1 DEFAULT '',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='apifecol';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `api_billers`
--
ALTER TABLE `api_billers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Profile` (`profile_id`);

--
-- Indices de la tabla `api_packages`
--
ALTER TABLE `api_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_profiles`
--
ALTER TABLE `api_profiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `api_packages`
--
ALTER TABLE `api_packages`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `api_profiles`
--
ALTER TABLE `api_profiles`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `api_billers`
--
ALTER TABLE `api_billers`
  ADD CONSTRAINT `Profile` FOREIGN KEY (`profile_id`) REFERENCES `api_profiles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
