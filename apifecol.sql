-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-03-2021 a las 03:12:27
-- Versión del servidor: 5.7.33-0ubuntu0.18.04.1
-- Versión de PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `identification_number` varchar(255) DEFAULT NULL,
  `dv` int(12) DEFAULT NULL,
  `language_id` int(12) DEFAULT NULL,
  `tax_id` int(12) DEFAULT NULL,
  `type_environment_id` int(12) DEFAULT '2',
  `country_id` int(12) DEFAULT NULL,
  `type_currency_id` int(12) DEFAULT NULL,
  `type_organization_id` int(12) DEFAULT NULL,
  `type_regime_id` int(12) DEFAULT NULL,
  `liability_id` int(12) DEFAULT NULL,
  `nit_type_id` int(12) DEFAULT NULL,
  `municipality_id` int(12) DEFAULT NULL,
  `merchant_registration` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `software_id` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `pin` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `test_id` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `printing_format` tinyint(2) DEFAULT NULL,
  `send_method` int(12) DEFAULT NULL,
  `address` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `certificate` longblob,
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

--
-- Volcado de datos para la tabla `api_billers`
--

INSERT INTO `api_billers` (`id`, `profile_id`, `name`, `business_name`, `identification_number`, `dv`, `language_id`, `tax_id`, `type_environment_id`, `country_id`, `type_currency_id`, `type_organization_id`, `type_regime_id`, `liability_id`, `nit_type_id`, `municipality_id`, `merchant_registration`, `software_id`, `pin`, `test_id`, `printing_format`, `send_method`, `address`, `phone`, `email`, `certificate`, `certificate_password`, `certificate_validity`, `host_email`, `host_username`, `host_password`, `host_port`, `integrations`, `created_at`, `updated_at`, `status`, `image`) VALUES
(2, 1, 'PLENUSSERVICES SAS', 'Plenus Services', '901004305', NULL, 53, 1, 2, 52, 52, 1, 1, 1, 6, 111, 'A25asdfaf584542', NULL, NULL, NULL, NULL, 3, 'AV siempre viva 742', '94268952', 'correo@miempresa.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 18:49:30', 1, NULL),
(3, 1, 'Juan Bautista', 'Juan Bautista', '1054561218', NULL, 53, 1, 2, 52, 52, 1, 1, 1, 6, 111, 'A25asdfaf584542', NULL, NULL, NULL, NULL, 3, 'AV siempre viva 742', '94268952', 'correo@miempresa.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 18:49:30', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_countries`
--

CREATE TABLE `api_countries` (
  `id` int(11) NOT NULL,
  `code` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Listings';

--
-- Volcado de datos para la tabla `api_countries`
--

INSERT INTO `api_countries` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afganistán', NULL, NULL),
(2, 'AX', 'Islas Gland', NULL, NULL),
(3, 'AL', 'Albania', NULL, NULL),
(4, 'DE', 'Alemania', NULL, NULL),
(5, 'AD', 'Andorra', NULL, NULL),
(6, 'AO', 'Angola', NULL, NULL),
(7, 'AI', 'Anguilla', NULL, NULL),
(8, 'AQ', 'Antártida', NULL, NULL),
(9, 'AG', 'Antigua y Barbuda', NULL, NULL),
(10, 'AN', 'Antillas Holandesas', NULL, NULL),
(11, 'SA', 'Arabia Saudí', NULL, NULL),
(12, 'DZ', 'Argelia', NULL, NULL),
(13, 'AR', 'Argentina', NULL, NULL),
(14, 'AM', 'Armenia', NULL, NULL),
(15, 'AW', 'Aruba', NULL, NULL),
(16, 'AU', 'Australia', NULL, NULL),
(17, 'AT', 'Austria', NULL, NULL),
(18, 'AZ', 'Azerbaiyán', NULL, NULL),
(19, 'BS', 'Bahamas', NULL, NULL),
(20, 'BH', 'Bahréin', NULL, NULL),
(21, 'BD', 'Bangladesh', NULL, NULL),
(22, 'BB', 'Barbados', NULL, NULL),
(23, 'BY', 'Bielorrusia', NULL, NULL),
(24, 'BE', 'Bélgica', NULL, NULL),
(25, 'BZ', 'Belice', NULL, NULL),
(26, 'BJ', 'Benin', NULL, NULL),
(27, 'BM', 'Bermudas', NULL, NULL),
(28, 'BT', 'Bhután', NULL, NULL),
(29, 'BO', 'Bolivia', NULL, NULL),
(30, 'BA', 'Bosnia y Herzegovina', NULL, NULL),
(31, 'BW', 'Botsuana', NULL, NULL),
(32, 'BV', 'Isla Bouvet', NULL, NULL),
(33, 'BR', 'Brasil', NULL, NULL),
(34, 'BN', 'Brunéi', NULL, NULL),
(35, 'BG', 'Bulgaria', NULL, NULL),
(36, 'BF', 'Burkina Faso', NULL, NULL),
(37, 'BI', 'Burundi', NULL, NULL),
(38, 'CV', 'Cabo Verde', NULL, NULL),
(39, 'KY', 'Islas Caimán', NULL, NULL),
(40, 'KH', 'Camboya', NULL, NULL),
(41, 'CM', 'Camerún', NULL, NULL),
(42, 'CA', 'Canadá', NULL, NULL),
(43, 'CF', 'República Centroafricana', NULL, NULL),
(44, 'TD', 'Chad', NULL, NULL),
(45, 'CZ', 'República Checa', NULL, NULL),
(46, 'CL', 'Chile', NULL, NULL),
(47, 'CN', 'China', NULL, NULL),
(48, 'CY', 'Chipre', NULL, NULL),
(49, 'CX', 'Isla de Navidad', NULL, NULL),
(50, 'VA', 'Ciudad del Vaticano', NULL, NULL),
(51, 'CC', 'Islas Cocos', NULL, NULL),
(52, 'CO', 'Colombia', NULL, NULL),
(53, 'KM', 'Comoras', NULL, NULL),
(54, 'CD', 'República Democrática del Congo', NULL, NULL),
(55, 'CG', 'Congo', NULL, NULL),
(56, 'CK', 'Islas Cook', NULL, NULL),
(57, 'KP', 'Corea del Norte', NULL, NULL),
(58, 'KR', 'Corea del Sur', NULL, NULL),
(59, 'CI', 'Costa de Marfil', NULL, NULL),
(60, 'CR', 'Costa Rica', NULL, NULL),
(61, 'HR', 'Croacia', NULL, NULL),
(62, 'CU', 'Cuba', NULL, NULL),
(63, 'DK', 'Dinamarca', NULL, NULL),
(64, 'DM', 'Dominica', NULL, NULL),
(65, 'DO', 'República Dominicana', NULL, NULL),
(66, 'EC', 'Ecuador', NULL, NULL),
(67, 'EG', 'Egipto', NULL, NULL),
(68, 'SV', 'El Salvador', NULL, NULL),
(69, 'AE', 'Emiratos Árabes Unidos', NULL, NULL),
(70, 'ER', 'Eritrea', NULL, NULL),
(71, 'SK', 'Eslovaquia', NULL, NULL),
(72, 'SI', 'Eslovenia', NULL, NULL),
(73, 'ES', 'España', NULL, NULL),
(74, 'UM', 'Islas ultramarinas de Estados Unidos', NULL, NULL),
(75, 'US', 'Estados Unidos', NULL, NULL),
(76, 'EE', 'Estonia', NULL, NULL),
(77, 'ET', 'Etiopía', NULL, NULL),
(78, 'FO', 'Islas Feroe', NULL, NULL),
(79, 'PH', 'Filipinas', NULL, NULL),
(80, 'FI', 'Finlandia', NULL, NULL),
(81, 'FJ', 'Fiyi', NULL, NULL),
(82, 'FR', 'Francia', NULL, NULL),
(83, 'GA', 'Gabón', NULL, NULL),
(84, 'GM', 'Gambia', NULL, NULL),
(85, 'GE', 'Georgia', NULL, NULL),
(86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur', NULL, NULL),
(87, 'GH', 'Ghana', NULL, NULL),
(88, 'GI', 'Gibraltar', NULL, NULL),
(89, 'GD', 'Granada', NULL, NULL),
(90, 'GR', 'Grecia', NULL, NULL),
(91, 'GL', 'Groenlandia', NULL, NULL),
(92, 'GP', 'Guadalupe', NULL, NULL),
(93, 'GU', 'Guam', NULL, NULL),
(94, 'GT', 'Guatemala', NULL, NULL),
(95, 'GF', 'Guayana Francesa', NULL, NULL),
(96, 'GN', 'Guinea', NULL, NULL),
(97, 'GQ', 'Guinea Ecuatorial', NULL, NULL),
(98, 'GW', 'Guinea-Bissau', NULL, NULL),
(99, 'GY', 'Guyana', NULL, NULL),
(100, 'HT', 'Haití', NULL, NULL),
(101, 'HM', 'Islas Heard y McDonald', NULL, NULL),
(102, 'HN', 'Honduras', NULL, NULL),
(103, 'HK', 'Hong Kong', NULL, NULL),
(104, 'HU', 'Hungría', NULL, NULL),
(105, 'IN', 'India', NULL, NULL),
(106, '106', 'Indonesia', NULL, NULL),
(107, 'IR', 'Irán', NULL, NULL),
(108, 'IQ', 'Iraq', NULL, NULL),
(109, 'IE', 'Irlanda', NULL, NULL),
(110, 'IS', 'Islandia', NULL, NULL),
(111, 'IL', 'Israel', NULL, NULL),
(112, 'IT', 'Italia', NULL, NULL),
(113, 'JM', 'Jamaica', NULL, NULL),
(114, 'JP', 'Japón', NULL, NULL),
(115, 'JO', 'Jordania', NULL, NULL),
(116, 'KZ', 'Kazajstán', NULL, NULL),
(117, 'KE', 'Kenia', NULL, NULL),
(118, 'KG', 'Kirguistán', NULL, NULL),
(119, 'KI', 'Kiribati', NULL, NULL),
(120, 'KW', 'Kuwait', NULL, NULL),
(121, 'LA', 'Laos', NULL, NULL),
(122, 'LS', 'Lesotho', NULL, NULL),
(123, 'LV', 'Letonia', NULL, NULL),
(124, 'LB', 'Líbano', NULL, NULL),
(125, 'LR', 'Liberia', NULL, NULL),
(126, 'LY', 'Libia', NULL, NULL),
(127, 'LI', 'Liechtenstein', NULL, NULL),
(128, 'LT', 'Lituania', NULL, NULL),
(129, 'LU', 'Luxemburgo', NULL, NULL),
(130, 'MO', 'Macao', NULL, NULL),
(131, 'MK', 'ARY Macedonia', NULL, NULL),
(132, 'MG', 'Madagascar', NULL, NULL),
(133, 'MY', 'Malasia', NULL, NULL),
(134, 'MW', 'Malawi', NULL, NULL),
(135, 'MV', 'Maldivas', NULL, NULL),
(136, 'ML', 'Malí', NULL, NULL),
(137, 'MT', 'Malta', NULL, NULL),
(138, 'FK', 'Islas Malvinas', NULL, NULL),
(139, 'MP', 'Islas Marianas del Norte', NULL, NULL),
(140, 'MA', 'Marruecos', NULL, NULL),
(141, 'MH', 'Islas Marshall', NULL, NULL),
(142, 'MQ', 'Martinica', NULL, NULL),
(143, 'MU', 'Mauricio', NULL, NULL),
(144, 'MR', 'Mauritania', NULL, NULL),
(145, 'YT', 'Mayotte', NULL, NULL),
(146, 'MX', 'México', NULL, NULL),
(147, 'FM', 'Micronesia', NULL, NULL),
(148, 'MD', 'Moldavia', NULL, NULL),
(149, 'MC', 'Mónaco', NULL, NULL),
(150, 'MN', 'Mongolia', NULL, NULL),
(151, 'MS', 'Montserrat', NULL, NULL),
(152, 'MZ', 'Mozambique', NULL, NULL),
(153, 'MM', 'Myanmar', NULL, NULL),
(154, 'NA', 'Namibia', NULL, NULL),
(155, 'NR', 'Nauru', NULL, NULL),
(156, 'NP', 'Nepal', NULL, NULL),
(157, 'NI', 'Nicaragua', NULL, NULL),
(158, 'NE', 'Níger', NULL, NULL),
(159, 'NG', 'Nigeria', NULL, NULL),
(160, 'NU', 'Niue', NULL, NULL),
(161, 'NF', 'Isla Norfolk', NULL, NULL),
(162, 'NO', 'Noruega', NULL, NULL),
(163, 'NC', 'Nueva Caledonia', NULL, NULL),
(164, 'NZ', 'Nueva Zelanda', NULL, NULL),
(165, 'OM', 'Omán', NULL, NULL),
(166, 'NL', 'Países Bajos', NULL, NULL),
(167, 'PK', 'Pakistán', NULL, NULL),
(168, 'PW', 'Palau', NULL, NULL),
(169, 'PS', 'Palestina', NULL, NULL),
(170, 'PA', 'Panamá', NULL, NULL),
(171, 'PG', 'Papúa Nueva Guinea', NULL, NULL),
(172, 'PY', 'Paraguay', NULL, NULL),
(173, 'PE', 'Perú', NULL, NULL),
(174, 'PN', 'Islas Pitcairn', NULL, NULL),
(175, 'PF', 'Polinesia Francesa', NULL, NULL),
(176, 'PL', 'Polonia', NULL, NULL),
(177, 'PT', 'Portugal', NULL, NULL),
(178, 'PR', 'Puerto Rico', NULL, NULL),
(179, 'QA', 'Qatar', NULL, NULL),
(180, 'GB', 'Reino Unido', NULL, NULL),
(181, 'RE', 'Reunión', NULL, NULL),
(182, 'RW', 'Ruanda', NULL, NULL),
(183, 'RO', 'Rumania', NULL, NULL),
(184, 'RU', 'Rusia', NULL, NULL),
(185, 'EH', 'Sahara Occidental', NULL, NULL),
(186, 'SB', 'Islas Salomón', NULL, NULL),
(187, 'WS', 'Samoa', NULL, NULL),
(188, 'AS', 'Samoa Americana', NULL, NULL),
(189, 'KN', 'San Cristóbal y Nevis', NULL, NULL),
(190, 'SM', 'San Marino', NULL, NULL),
(191, 'PM', 'San Pedro y Miquelón', NULL, NULL),
(192, 'VC', 'San Vicente y las Granadinas', NULL, NULL),
(193, 'SH', 'Santa Helena', NULL, NULL),
(194, 'LC', 'Santa Lucía', NULL, NULL),
(195, 'ST', 'Santo Tomé y Príncipe', NULL, NULL),
(196, 'SN', 'Senegal', NULL, NULL),
(197, 'CS', 'Serbia y Montenegro', NULL, NULL),
(198, 'SC', 'Seychelles', NULL, NULL),
(199, 'SL', 'Sierra Leona', NULL, NULL),
(200, 'SG', 'Singapur', NULL, NULL),
(201, 'SY', 'Siria', NULL, NULL),
(202, 'SO', 'Somalia', NULL, NULL),
(203, 'LK', 'Sri Lanka', NULL, NULL),
(204, 'SZ', 'Suazilandia', NULL, NULL),
(205, 'ZA', 'Sudáfrica', NULL, NULL),
(206, 'SD', 'Sudán', NULL, NULL),
(207, 'SE', 'Suecia', NULL, NULL),
(208, 'CH', 'Suiza', NULL, NULL),
(209, 'SR', 'Surinam', NULL, NULL),
(210, 'SJ', 'Svalbard y Jan Mayen', NULL, NULL),
(211, 'TH', 'Tailandia', NULL, NULL),
(212, 'TW', 'Taiwán', NULL, NULL),
(213, 'TZ', 'Tanzania', NULL, NULL),
(214, 'TJ', 'Tayikistán', NULL, NULL),
(215, 'IO', 'Territorio Británico del Océano Índico', NULL, NULL),
(216, 'TF', 'Territorios Australes Franceses', NULL, NULL),
(217, 'TL', 'Timor Oriental', NULL, NULL),
(218, 'TG', 'Togo', NULL, NULL),
(219, 'TK', 'Tokelau', NULL, NULL),
(220, 'TO', 'Tonga', NULL, NULL),
(221, 'TT', 'Trinidad y Tobago', NULL, NULL),
(222, 'TN', 'Túnez', NULL, NULL),
(223, 'TC', 'Islas Turcas y Caicos', NULL, NULL),
(224, 'TM', 'Turkmenistán', NULL, NULL),
(225, 'TR', 'Turquía', NULL, NULL),
(226, 'TV', 'Tuvalu', NULL, NULL),
(227, 'UA', 'Ucrania', NULL, NULL),
(228, 'UG', 'Uganda', NULL, NULL),
(229, 'UY', 'Uruguay', NULL, NULL),
(230, 'UZ', 'Uzbekistán', NULL, NULL),
(231, 'VU', 'Vanuatu', NULL, NULL),
(232, 'VE', 'Venezuela', NULL, NULL),
(233, 'VN', 'Vietnam', NULL, NULL),
(234, 'VG', 'Islas Vírgenes Británicas', NULL, NULL),
(235, 'VI', 'Islas Vírgenes de los Estados Unidos', NULL, NULL),
(236, 'WF', 'Wallis y Futuna', NULL, NULL),
(237, 'YE', 'Yemen', NULL, NULL),
(238, 'DJ', 'Yibuti', NULL, NULL),
(239, 'ZM', 'Zambia', NULL, NULL),
(240, 'ZW', 'Zimbabue', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_delivery_company`
--

CREATE TABLE `api_delivery_company` (
  `id` int(12) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cifnif` varchar(255) DEFAULT NULL,
  `dv` varchar(25) DEFAULT NULL,
  `nit_type_id` int(12) DEFAULT NULL,
  `municipality_id` int(12) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_delivery_company`
--

INSERT INTO `api_delivery_company` (`id`, `name`, `cifnif`, `dv`, `nit_type_id`, `municipality_id`, `created_at`, `updated_at`) VALUES
(1, 'MC MENSAJERIA CONFIDENCIAL SA', '800162003', '9', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(2, 'DHL Express Colombia Ltda.', '860502609', '1', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(3, 'Pasar Express S.A.', '800210556', '6', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(4, 'EXPRESITO CARGA SAS', '830057882', '6', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(5, 'COOPERATIVA MULTIACTIVA GUASIMALES', '807000949', '1', 6, 264, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(6, 'SERVIREPARTO LTDA', '890208044', '8', 6, 121, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(7, 'SERVILLA', '890211132', '9', 6, 121, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(8, 'INTER SERVICIOS LTDA', '860529344', '0', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(9, 'DISTRIENVIOS LTDA', '800170229', '1', 6, 92, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(10, 'AMERICAN DELIVERY SERVICE ADS LTDA', '800228858', '4', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(11, 'ENTREGA INMEDIATA SEGURA S.A.', '800146314', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(12, 'COLVANES LTDA', '800185306', '4', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(13, 'GEMPSA GESTION EMPRESARIAL S.A.', '900268219', '1', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(14, 'VERCOURRIER SAS', '900204148', '2', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(15, 'SOMOS COURRIER EXPRESS S.A', '900039844', '3', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(16, 'Inter Rapidisimo S.A', '800251569', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(17, 'AEROVIAS DEL CONTINENTE AMERICANO S.A.', '890100577', '6', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(18, 'INELMA LIMITADA', '800095465', '0', 6, 179, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(19, 'INTERSERVICE S.A.', '830014567', '6', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(20, 'RURAL EXPRESS LTDA', '900251060', '3', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(21, 'CARGO ZONE ETC Y CIA LTDA.', '900129344', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(22, 'NEW EXPRESS MAIL LTDA', '830095676', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(23, 'Speed Net Courier Ltda', '830076004', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(24, 'WORLD COURIER DE COLOMBIA S.A.', '860504008', '2', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(25, 'DELIVERY SPECIAL S.A.S.', '900330470', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(26, 'GRUPO SERT LTDA', '830025582', '4', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(27, 'LETTER EXPRESS COURIER AND LOGISTICS', '900281413', '8', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(28, 'RED ESPECIALIZADA EN TRANSPORTE', '830038007', '7', 6, 595, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(29, 'POSTAL AEROFAST COLOMBIA S A', '832000432', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(30, 'APOYO LOGISTICO EN MENSAJERIA LTDA.', '900308686', '0', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(31, 'COOPERATIVA DE TRANSPORTADORES DE SAN', '890203507', '3', 6, 840, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(32, 'Metropolitan Express Ltda.', '830044348', '8', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(33, 'GRUPO EMPRESARIAL DE MENSAJERIA EXPRESA', '900318622', '2', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(34, 'MASSICE LTDA', '830130626', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(35, 'SERVICIOS INTEGRADOS DE INGENIERIA Y', '802010987', '6', 6, 92, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(36, 'lectura de contadores y servicios', '806003042', '7', 6, 177, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(37, 'THOMAS GREG EXPRESS S.A.', '800215592', '4', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(38, 'CARTER LIMITADA', '830509483', '1', 6, 92, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(39, 'COLOMBIANA DE ENVIOS Y SERVICIOS LTDA', '830049372', '8', 6, 545, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(40, 'GLOBAL MENSAJERIA S.A', '900053978', '1', 6, 560, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(41, 'MULTISERVICIOS GUAVIO LTDA', '832001364', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(42, 'DOMINA ENTREGA TOTAL S.A.S.', '800088155', '3', 6, 560, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(43, 'CALI EXPRESS LTDA', '890328281', '1', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(44, 'TIC LTDA', '890116243', '1', 6, 92, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(45, 'SERVIENTREGA S. A.', '860512330', '3', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(46, 'LANPOSTAL EXPRESS LTDA', '900031971', '4', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(47, 'UNO A DATA SERVICIOS SAS', '900311184', '6', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(48, 'JOSACA SERVICIOS MOTORIZADOS SAS', '800186695', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(49, 'AEROPOSTAL ALIANZA LOGISTICA NACIONAL', '900325188', '6', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(50, 'COORDINADORA MERCANTIL S.A.', '890904713', '2', 6, 560, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(51, 'SOINCO PROYECTOS LTDA', '800087501', '4', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(52, 'SERVICIOS POSTALES DE COLOMBIA LTDA -', '811047028', '0', 6, 560, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(53, 'MAR EXPRESS SAS', '900234514', '3', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(54, 'J&S CARGO LTDA', '830513646', '0', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(55, 'RED POSTAL COLOMBIA LTDA', '900280949', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(56, 'RECAUDOS Y TRIBUTOS S.A.', '802012463', '8', 6, 92, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(57, 'CARGO EXPRESO LIMITADA', '900262925', '6', 6, 282, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(58, 'MARATHON DISTRIBUCIONES S.A.S.', '900163046', '2', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(59, 'LOGISTICA GLOBAL COURRIER DE COLOMBIA', '900090117', '2', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(60, 'MUNDOEXPRESS SEGURIDAD EN SU ENVIO', '900190723', '5', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(61, 'Ups Servicios Expresos S.A.S', '900400551', '8', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(62, 'MEGACARGA EXPRESS LTDA', '830100365', '3', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(63, 'COLOMBIANA DE ENCOMIENDAS S.A.', '800209179', '0', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(64, 'COMPAÑIA DE SERVICIOS LOGISTICOS LTDA', '900145913', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(65, 'ALFA MENSAJES LIMITADA', '822002317', '0', 6, 1099, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(66, 'DATACOURRIER SAS', '900036548', '4', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(67, 'ABE CARGO EXPRESS LTDA', '805001203', '3', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(68, 'SPEEDWAY EXPRESS DE COLOMBIA LTDA', '800102527', '1', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(69, 'MENSAJERIA CONFIDENCIAL Y TRAMITES LTDA', '800205649', '2', 6, 588, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(70, 'TODAENTREGA LTDA', '900006328', '2', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(71, 'A1-ENTREGAS S.A.S.', '900385252', '6', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:56'),
(72, 'FEDERAL EXPRESS CORPORATION sucursal', '830017271', '5', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(73, 'SERVIENTREGA INTERNACIONAL S.A', '800179612', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(74, 'TEGO DELIVERY SAS', '900044397', '2', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(75, 'JET BOX S.A.S.', '800178193', '1', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(76, 'AEXPRESS S.A.', '830137513', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(77, 'INTERAMERICANA DE POSTALES S.A.S', '800222028', '0', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(78, 'COOPERATIVA DE TRANSPORTADORES', '890500446', '6', 6, 660, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(79, 'ZAI CARGO EU.', '830082601', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(80, 'AM CORPORATIVE SERVICES SAS', '900411553', '1', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(81, 'SERVICIOS POSTALES NACIONALES S.A.', '900062917', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(82, 'CADENA COURRIER S.A.S.', '830507412', '1', 6, 470, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(83, 'COMPAÑIA DE TAXIS VERDES S A', '860007701', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(84, 'OCS INTERNACIONAL LTDA', '830088684', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(85, 'SINTECO SAS', '805010748', '3', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(86, 'ENVIAMOS COMUNICACIONES S.A.S.', '900437186', '2', 6, 121, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(87, 'PRESTACION DE SERVICIOS Y TECNICOS EN GAS', '804008594', '6', 6, 121, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(88, 'ESM LOGISTICA S.A.S.', '900429481', '7', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(89, 'PRINTING DELIVERY S.A.', '900052755', '1', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(90, 'LOGISTICA TRANSPORTE Y DISTRIBUCION S.A.', '900014549', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(91, 'CENTAURUS MENSAJEROS S.A.', '860533311', '3', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(92, 'CES DEL LLANO Y ASOCIADOS S.A.S.', '900459109', '1', 6, 1099, '2020-09-15 21:12:45', '2020-09-15 21:12:45'),
(93, 'PUNTUAL CORREO URBANO SERVICIOS', '830048453', '1', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(94, 'LOGISTICA Y SERVICIOS CARREVAL S.A.S.', '900413522', '0', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(95, 'Metropolitana De Envios Ltda', '802007653', '0', 6, 92, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(96, 'COOPERATIVA SANTANDEREANA DE', '890200928', '7', 6, 121, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(97, 'PRONTO ENVIOS LOGISTICA SOCIEDAD POR', '900310856', '2', 6, 657, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(98, 'PAQUETES Y CARGA EXPRESS LTDA ¨PAQ', '800045942', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(99, 'A&V EXPRESS S.A.', '830055842', '2', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(100, 'AEROPOST COLOMBIA S.A.S.', '900076928', '0', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(101, 'BSI COLOMBIA SA', '800205227', '8', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(102, 'CALIDADTOTAL LTDA', '807008252', '3', 6, 264, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(103, 'TEMPO EXPRESS SAS', '806005329', '4', 6, 177, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(104, 'CORREOS ESPECIALIZADOS DE COLOMBIA -', '900067395', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(105, 'B LOGIC S.A.S.', '900168360', '3', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(106, 'MAKRO LOGISTICS GROUP S.A.S.', '900382791', '0', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(107, 'URBANO EXPRESS LOGISTICA Y MERCADEO LTDA', '900046728', '6', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(108, 'NEW EXPRESS MAIL LTDA.', '830095676', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(109, 'RED INTEGRADORA SAS', '900372963', '8', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(110, '24 EXPRESS S.A.', '900131312', '1', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(111, 'P Y G S.A.', '809005093', '2', 6, 433, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(112, 'POSTAL EXPRESS S.S. LTDA.', '830098513', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(113, 'INTERNATIONAL COURIER ON TIME S.A', '805019531', '3', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(114, 'EXPRESO BOLIVARIANO S.A. EN EJECUCION DEL', '860005108', '1', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(115, 'J&V TRADING GROUP S.A.S', '900148614', '3', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(116, 'SIACOMEXPRESS S.A.S', '900420517', '2', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(117, 'CARGO ZONE ETC Y CIA LTDA', '900129344', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(118, 'PRONTICOURIER EXPRESS SAS', '802004119', '5', 6, 92, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(119, 'REDEX S.A.S', '811034171', '1', 6, 560, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(120, 'SERVICIOS ASOCIADOS ESPECIALIZADOS EN', '860525367', '1', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(121, 'TRANSARMENIA CARGA S.A', '900065780', '0', 6, 68, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(122, 'PUBLIENTREGA S.A.S', '805007883', '9', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(123, 'SUPERENVIOS S.A.S', '900489067', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(124, 'CONEXIONES EMPRESARIALES S.A.', '900119968', '1', 6, 611, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(125, 'USA CO COLOMBIAN WORLDWIDE COURIER SAS', '830030549', '0', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(126, 'DOMESA DE COLOMBIA S.A.', '800101399', '9', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(127, 'CONTINENTAL BUS S.A.', '800227937', '3', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(128, 'COOPERATIVA DE TRANSPORTADORES FLOTA', '891800045', '7', 6, 951, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(129, 'COURIER SHOP LTDA', '900071016', '6', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(130, 'COOPERATIVA DE TRANSPORTADORES DE SAN', '890203507', '3', 6, 121, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(131, 'AMERICAN LOGISTICS DE COLOMBIA SAS', '830057762', '0', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(132, 'ASESORAMOS Y PROVEEMOS LTDA', '830039739', '4', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(133, 'J & G BUSINESS COURIER S.A', '805030045', '1', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(134, 'CONTINENTAL MAIL EXPRESS.CO SAS COMEXCO', '900136581', '7', 6, 153, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(135, 'SURENVIOS SAS', '813000298', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(136, 'V M CARGO SERVICES LTDA', '830036122', '7', 6, 111, '2020-09-15 21:12:45', '2020-09-15 21:23:57'),
(137, 'HORA CERO LOGÍSTICA Y TRANSPORTE S.A.', '900253546', '1', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(138, 'SURENVIOS SAS', '813000298', '7', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(139, 'S U EXPRESS INTERNACIONAL LTDA', '830025299', '4', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(140, 'CLICK MAIL SAS', '900506327', '0', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(141, 'TRANS INTERNATIONAL COURIER LTDA', '830033294', '1', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(142, 'AVIAEXPRESS LTDA', '900163042', '3', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(143, 'FLOTA OCCIDENTAL S.A.', '891400148', '0', 6, 680, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(144, 'INTEGRA CADENA DE SERVICIOS SAS', '900164363', '7', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(145, 'TELEPOSTAL EXPRESS LTDA', '830033117', '6', 6, 121, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(146, 'USA POSTAL S.A.', '830112988', '3', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(147, 'INCOLENVIOS S.A.', '900193214', '1', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(148, 'COLENTREGA S.A.S.', '800223879', '6', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(149, 'UNI EXPRESS S.A.S.', '800203792', '9', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(150, 'MECM PROFESIONALES CONTRATISTAS SAS', '830042976', '4', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(151, 'INVESTIGACIONES Y COBRANZAS EL LIBERTADOR', '860035977', '1', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(152, 'SERVIPOSTAL LOGISTICA NACIONAL S.A.S.', '900190458', '8', 6, 560, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(153, 'SEMCA SAS', '900065820', '7', 6, 1114, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(154, 'COOPERATIVA MULTIACTIVA DE TAXISTAS Y', '890200218', '6', 6, 121, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(155, 'RED INTEGRADORA S.A.S.', '830025142', '7', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(156, 'METROPOLITANA DE ENVIOS LTDA', '802007653', '0', 6, 92, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(157, 'TRANEXCO S.A.', '830045825', '4', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(158, 'CARVAJAL SOLUCIONES DE COMUNICACION', '800096812', '8', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(159, 'CADENA LOGÍSTICA INTEGRAL DE PRODUCTOS Y', '900535176', '9', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(160, 'LARS COURRIER S.A.', '830050525', '1', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(161, 'EXPRESO BRASILIA S.A', '890100531', '8', 6, 92, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(162, 'TRANSPORTES RAPIDO OCHOA S.A.', '890902875', '8', 6, 560, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(163, 'IRON MOUNTAIN COLOMBIA SERVICES S.A.S.', '900241753', '6', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(164, 'LOQUEQUIERACOLOMBIA.COM S.A.S', '900589652', '5', 6, 153, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(165, 'GEMPSA GESTION EMPRESARIAL S.A.', '900268219', '1', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(166, 'SENDEXPRESS SAS', '830120887', '1', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(167, 'SERVITEM LTDA. TRANSPORTE Y MENSAJERIA', '800177030', '3', 6, 669, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(168, 'EXTRA RAPIDO LOS MOTILONES S.A.', '890500466', '3', 6, 264, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(169, 'SERVICIOS LOGISTICOS DE COLOMBIA S.A. -', '810003951', '1', 6, 545, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(170, 'SERVIMOS OUTSOURCING LTDA', '800093190', '1', 6, 153, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(171, 'ENVIOS LOGISTICOS SAS', '900331846', '9', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(172, 'COOPERATIVA NACIONAL DE', '860020381', '7', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(173, 'TNC TERRITORIOS NACIONALES COURRIER LTDA', '900253570', '7', 6, 1114, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(174, 'COOPTMOTILON LTDA.', '800152028', '1', 6, 660, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(175, 'AM MENSAJES SAS', '900230715', '9', 6, 560, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(176, 'VUELO EXPRESS INTERNACIONAL SAS', '830046888', '2', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(177, 'DELTEC S.A.', '800166199', '1', 6, 153, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(178, 'HECC COURRIER EXPRESS LIMITADA', '830047700', '1', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(179, 'Servicios Postales Nacionales S.A.', '900062917', '9', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(180, 'EFECTIVO LTDA', '830131993', '1', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(181, 'SUPERGIROS S.A.', '900084777', '9', 6, 153, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(182, 'TRANZA SAS', '900392611', '6', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(183, 'L&D COLOMBIA LTDA', '830131802', '3', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(184, 'LIBERTAD WORLD EXPRESS S.A.S.', '900378817', '8', 6, 92, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(185, 'TOTAL SOLUCIONES EMPRESARIALES TSE', '900158410', '0', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(186, 'TOP EXPRESS SAS', '830127979', '2', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(187, 'D`UNA VEZ SAS', '900736837', '1', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:57'),
(188, 'AR EXPRESS SAS', '900358089', '7', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:58'),
(189, 'METROPOLITAN EXPRESS', '830044348', '8', 6, 111, '2020-09-15 21:12:46', '2020-09-15 21:23:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_delivery_terms`
--

CREATE TABLE `api_delivery_terms` (
  `id` int(12) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_delivery_terms`
--

INSERT INTO `api_delivery_terms` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'CFR', 'Costo y flete', '2020-09-15 00:00:00', '2020-09-15 00:00:00'),
(2, 'CIF', 'Costo, flete y seguro', '2020-09-15 00:00:00', '2020-09-15 00:00:00'),
(3, 'CPT', 'Transporte Pagado Hasta', '2020-09-15 00:00:00', '2020-09-15 00:00:00'),
(4, 'DAP', 'Entregado en un Lugar', '2020-09-15 00:00:00', '2020-09-15 00:00:00'),
(5, 'DAT', 'Entregado en Terminal', '2020-09-15 00:00:00', '2020-09-15 00:00:00'),
(6, 'DDP', 'Entregado con Pago de Derechos', '2020-09-15 00:00:00', '2020-09-15 00:00:00'),
(7, 'EXW', 'En Fábrica', '2020-09-15 00:00:00', '2020-09-15 00:00:00'),
(8, 'FAS', 'Franco al costado del buque', '2020-09-15 00:00:00', '2020-09-15 00:00:00'),
(9, 'FCA', 'Franco transportista', '2020-09-15 00:00:00', '2020-09-15 00:00:00'),
(10, 'FOB', 'Franco a bordo', '2020-09-15 00:00:00', '2020-09-15 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_departments`
--

CREATE TABLE `api_departments` (
  `id` int(12) NOT NULL,
  `country_id` int(12) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Facturacion';

--
-- Volcado de datos para la tabla `api_departments`
--

INSERT INTO `api_departments` (`id`, `country_id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 52, '05', 'ANTIOQUIA', NULL, NULL),
(2, 52, '08', 'ATLÁNTICO', NULL, NULL),
(3, 52, '11', 'BOGOTÁ, D.C.', NULL, NULL),
(4, 52, '13', 'BOLÍVAR', NULL, NULL),
(5, 52, '15', 'BOYACÁ', NULL, NULL),
(6, 52, '17', 'CALDAS', NULL, NULL),
(7, 52, '18', 'CAQUETÁ', NULL, NULL),
(8, 52, '19', 'CAUCA', NULL, NULL),
(9, 52, '20', 'CESAR', NULL, NULL),
(10, 52, '23', 'CÓRDOBA', NULL, NULL),
(11, 52, '25', 'CUNDINAMARCA', NULL, NULL),
(12, 52, '27', 'CHOCÓ', NULL, NULL),
(13, 52, '41', 'HUILA', NULL, NULL),
(14, 52, '44', 'LA GUAJIRA', NULL, NULL),
(15, 52, '47', 'MAGDALENA', NULL, NULL),
(16, 52, '50', 'META', NULL, NULL),
(17, 52, '52', 'NARIÑO', NULL, NULL),
(18, 52, '54', 'NORTE DE SANTANDER', NULL, NULL),
(19, 52, '63', 'QUINDIO', NULL, NULL),
(20, 52, '66', 'RISARALDA', NULL, NULL),
(21, 52, '68', 'SANTANDER', NULL, NULL),
(22, 52, '70', 'SUCRE', NULL, NULL),
(23, 52, '73', 'TOLIMA', NULL, NULL),
(24, 52, '76', 'VALLE DEL CAUCA', NULL, NULL),
(25, 52, '81', 'ARAUCA', NULL, NULL),
(26, 52, '85', 'CASANARE', NULL, NULL),
(27, 52, '86', 'PUTUMAYO', NULL, NULL),
(28, 52, '88', 'ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA', NULL, NULL),
(29, 52, '91', 'AMAZONAS', NULL, NULL),
(30, 52, '94', 'GUAINÍA', NULL, NULL),
(31, 52, '95', 'GUAVIARE', NULL, NULL),
(32, 52, '97', 'VAUPÉS', NULL, NULL),
(33, 52, '99', 'VICHADA', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_discounts`
--

CREATE TABLE `api_discounts` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(25) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_discounts`
--

INSERT INTO `api_discounts` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Descuento por impuesto asumido', '00', NULL, NULL),
(2, 'Pague uno lleve otro', '01', NULL, NULL),
(3, 'Descuentos contractulales', '02', NULL, NULL),
(4, 'Descuento por pronto pago', '03', NULL, NULL),
(5, 'Envío gratis', '04', NULL, NULL),
(6, 'Descuentos escpecíficos por inventarios', '05', NULL, NULL),
(7, 'Descuento por monto de compras', '06', NULL, NULL),
(8, 'Descuento de temporada', '07', NULL, NULL),
(9, 'Descuento por acturalización de productos / servicios', '08', NULL, NULL),
(10, 'Descuento general', '09', NULL, NULL),
(11, 'Descuento por volumen', '10', NULL, NULL),
(12, 'Otro descuento', '11', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_facturacion_bank_account_types`
--

CREATE TABLE `api_facturacion_bank_account_types` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_facturacion_bank_account_types`
--

INSERT INTO `api_facturacion_bank_account_types` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Cuenta Corriente', '01', '2020-08-04 00:00:00', '2020-08-04 00:00:00'),
(2, 'Cuenta De Ahorros', '02', '2020-08-04 00:00:00', '2020-08-04 00:00:00'),
(3, 'Cuenta de Nómina', '03', '2020-08-04 00:00:00', '2020-08-04 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_invoices_send_method`
--

CREATE TABLE `api_invoices_send_method` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_invoices_send_method`
--

INSERT INTO `api_invoices_send_method` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'SendBillSync', 'Recibir un ZIP con un UBL  de forma Sincróna', '2020-08-13 00:00:00', '2020-08-13 00:00:00'),
(2, 'SendBillAsync', 'Recibir un ZIP con un UBL  de forma Asincróna', '2020-08-13 00:00:00', '2020-08-13 00:00:00'),
(3, 'SendTestSetAsync', 'Recibir un ZIP con UBLs DE para pruebas de Habilitación de forma Asincróna', '2020-08-13 00:00:00', '2020-08-13 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_item_clasificator`
--

CREATE TABLE `api_item_clasificator` (
  `id` int(11) NOT NULL,
  `parent_code` varchar(3) NOT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `famili_code` varchar(5) NOT NULL,
  `famili_name` varchar(255) DEFAULT NULL,
  `class_code` varchar(8) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `product_code` varchar(10) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_item_clasificator`
--

INSERT INTO `api_item_clasificator` (`id`, `parent_code`, `parent_name`, `famili_code`, `famili_name`, `class_code`, `class_name`, `product_code`, `product_name`, `created_at`, `updated_at`) VALUES
(16, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811016', 'Ingeniería mecánica', '81101601', 'Dibujo mecánico', NULL, NULL),
(17, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811016', 'Ingeniería mecánica', '81101602', 'Diseño de envolturas de productos mecánicos', NULL, NULL),
(18, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811016', 'Ingeniería mecánica', '81101603', 'Diseño de máquinas herramientas', NULL, NULL),
(19, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811016', 'Ingeniería mecánica', '81101604', 'Diseño de transmisión de potencia', NULL, NULL),
(20, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811016', 'Ingeniería mecánica', '81101605', 'Servicios electromecánicos', NULL, NULL),
(21, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811017', 'Ingeniería eléctrica y electrónica', '81101701', 'Servicios de ingeniería eléctrica', NULL, NULL),
(22, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811017', 'Ingeniería eléctrica y electrónica', '81101702', 'Diseño de circuitos electrónicos', NULL, NULL),
(23, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811017', 'Ingeniería eléctrica y electrónica', '81101703', 'Servicios de pruebas técnicas ', NULL, NULL),
(24, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811017', 'Ingeniería eléctrica y electrónica', '81101706', 'Mantenimiento de equipos de laboratorio', NULL, NULL),
(25, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811017', 'Ingeniería eléctrica y electrónica', '81101707', 'Mantenimiento de equipos de impresión', NULL, NULL),
(26, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811017', 'Ingeniería eléctrica y electrónica', '81101710', 'Servicio de reclamación de wafers', NULL, NULL),
(27, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811017', 'Ingeniería eléctrica y electrónica', '81101711', 'Servicios de fabricación de componentes electrónicos', NULL, NULL),
(28, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811017', 'Ingeniería eléctrica y electrónica', '81101713', 'Servicio técnico y de diseño de instrumentos de medición y de registro electrónicos', NULL, NULL),
(29, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811018', 'Ingeniería química', '81101801', 'Ingeniería de plásticos', NULL, NULL),
(30, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811018', 'Ingeniería química', '81101802', 'Servicios de ingeniería de procesos químicos', NULL, NULL),
(31, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811019', 'Ingeniería de petróleos y gas', '81101902', 'Ingeniería de producción para petróleo o gas', NULL, NULL),
(32, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811020', 'Ingeniería de minas', '81102001', 'Minería hidráulica', NULL, NULL),
(33, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811021', 'Ingeniería de océanos', '81102101', 'Ingeniería de costas', NULL, NULL),
(34, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811022', 'Ingeniería de transporte', '81102201', 'Ingeniería de tráfico', NULL, NULL),
(35, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811022', 'Ingeniería de transporte', '81102202', 'red de transporte urbano', NULL, NULL),
(36, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811022', 'Ingeniería de transporte', '81102203', 'Vías de navegación interior', NULL, NULL),
(37, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811023', 'Ingeniería aeronáutica', '81102301', 'Diseño de aviónica', NULL, NULL),
(38, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811024', 'Ingeniería de transmisión de energía eléctrica', '81102401', 'Construcción de líneas de tendido aéreo de alto voltaje', NULL, NULL),
(39, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811024', 'Ingeniería de transmisión de energía eléctrica', '81102402', 'Mantenimiento y reparación  de líneas de tendido aéreo de alto voltaje', NULL, NULL),
(40, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811025', 'Servicios de permisos', '81102501', 'Servicio para obtener licencia en operación de minas', NULL, NULL),
(41, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811026', 'Servicios de muestreo', '81102601', 'Servicio de muestreo de carbón', NULL, NULL),
(42, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811027', 'Servicios de diseño e ingeniería de sistemas instrumentados de control', '81102701', 'Servicio de ingeniería para sistemas de control y monitoreo de incendios y gas', NULL, NULL),
(43, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8110', 'Servicios profesionales de ingeniería', '811027', 'Servicios de diseño e ingeniería de sistemas instrumentados de control', '81102702', 'Servicio de ingeniería y diseño para sistemas de control de procesos', NULL, NULL),
(44, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811115', 'Ingeniería de software o hardware', '81111501', 'Diseño de aplicaciones de software de la unidad central', NULL, NULL),
(45, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811115', 'Ingeniería de software o hardware', '81111502', 'Diseños de aplicaciones para computadores personales (pc)', NULL, NULL),
(46, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811115', 'Ingeniería de software o hardware', '81111503', 'Diseño de integración de sistemas', NULL, NULL),
(47, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811115', 'Ingeniería de software o hardware', '81111504', 'Servicios de programación de aplicaciones', NULL, NULL),
(48, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811115', 'Ingeniería de software o hardware', '81111505', 'Servicios de programación de sistemas operativos', NULL, NULL),
(49, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811115', 'Ingeniería de software o hardware', '81111506', 'Servicios de programación para clientes o servidores', NULL, NULL),
(50, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811115', 'Ingeniería de software o hardware', '81111507', 'Servicios de programación de aplicaciones de bases de datos (erp)', NULL, NULL),
(51, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811115', 'Ingeniería de software o hardware', '81111508', 'Servicios de implementación de aplicaciones', NULL, NULL),
(52, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811115', 'Ingeniería de software o hardware', '81111509', 'Servicios de desarrollo de aplicaciones para clientes de internet / intranet', NULL, NULL),
(53, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811115', 'Ingeniería de software o hardware', '81111510', 'Servicios de desarrollo de aplicaciones para servidores de internet / intranet', NULL, NULL),
(54, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111601', 'Programación para visual basic', NULL, NULL),
(55, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111602', 'Programación para java', NULL, NULL),
(56, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111603', 'Programación para html', NULL, NULL),
(57, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111604', 'Programación para algol', NULL, NULL),
(58, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111605', 'Programación para assembler', NULL, NULL),
(59, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111606', 'Programación para basic', NULL, NULL),
(60, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111607', 'Programación para c, c++', NULL, NULL),
(61, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111608', 'Programación para cobol', NULL, NULL),
(62, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111609', 'Programación para fortran', NULL, NULL),
(63, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111610', 'Programación para pascal', NULL, NULL),
(64, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111611', 'Programación para pl/1', NULL, NULL),
(65, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111612', 'Lenguajes de programación o de marca patentada', NULL, NULL),
(66, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811116', 'Programadores de computador', '81111613', 'Programación para perl', NULL, NULL),
(67, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811117', 'Sistemas de manejo de información MIS', '81111701', 'Diseño de comunicaciones por redes de cobertura amplia', NULL, NULL),
(68, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811117', 'Sistemas de manejo de información MIS', '81111702', 'Diseño de comunicaciones por redes de área local', NULL, NULL),
(69, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811117', 'Sistemas de manejo de información MIS', '81111703', 'Diseño del intercambio electrónico de datos (ied)', NULL, NULL),
(70, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811117', 'Sistemas de manejo de información MIS', '81111704', 'Diseño de bases de datos', NULL, NULL),
(71, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811117', 'Sistemas de manejo de información MIS', '81111705', 'Arquitectura de sistemas', NULL, NULL),
(72, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811117', 'Sistemas de manejo de información MIS', '81111706', 'Servicios de planificación de redes', NULL, NULL),
(73, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811117', 'Sistemas de manejo de información MIS', '81111707', 'Servicios de planificación de sistemas', NULL, NULL),
(74, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811117', 'Sistemas de manejo de información MIS', '81111708', 'Servicios de planificación de telecomunicaciones', NULL, NULL),
(75, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111801', 'Seguridad de los computadores, redes o internet', NULL, NULL),
(76, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111802', 'Servicios de administración de la unidad central', NULL, NULL),
(77, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111803', 'Mantenimiento o soporte de redes de área local (lan)', NULL, NULL),
(78, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111804', 'Mantenimiento o soporte de redes de cobertura amplia (wan)', NULL, NULL),
(79, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111805', 'Mantenimiento o soporte de sistemas patentados o autorizados', NULL, NULL),
(80, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111806', 'Servicio de análisis de bases de datos', NULL, NULL),
(81, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111808', 'Servicio de análisis de sistemas', NULL, NULL),
(82, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111809', 'Servicio de instalación de sistemas', NULL, NULL),
(83, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111810', 'Servicios de codificación de software ', NULL, NULL),
(84, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111811', 'Servicios de soporte técnico o de mesa de ayuda', NULL, NULL),
(85, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111812', 'Servicio de mantenimiento o soporte del hardware del computador', NULL, NULL),
(86, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111814', 'Servicio de colocación', NULL, NULL),
(87, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111818', 'Garantía de terceros', NULL, NULL),
(88, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111819', 'Servicios de garantía de calidad', NULL, NULL),
(89, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811118', 'Servicios de sistemas y administración de componentes de sistemas', '81111820', 'Servicios de funcionalidad del sistema', NULL, NULL),
(90, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811119', 'Sistemas de recuperación de información', '81111901', 'Recuperación de información de las bases de datos', NULL, NULL),
(91, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811119', 'Sistemas de recuperación de información', '81111902', 'Servicio de recuperación de información de las bases de datos en línea', NULL, NULL),
(92, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811120', 'Servicios de datos', '81112001', 'Servicio de procesamiento de datos en línea', NULL, NULL),
(93, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811120', 'Servicios de datos', '81112002', 'Servicios de procesamiento o preparación de datos ', NULL, NULL),
(94, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811120', 'Servicios de datos', '81112003', 'Servicios de centros de datos', NULL, NULL),
(95, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811120', 'Servicios de datos', '81112004', 'Servicios de recuperación de desastres', NULL, NULL),
(96, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811120', 'Servicios de datos', '81112005', 'Servicio de escaneo de documentos', NULL, NULL),
(97, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811120', 'Servicios de datos', '81112006', 'servicios de almacenamiento de datos', NULL, NULL),
(98, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811120', 'Servicios de datos', '81112007', 'Servicios de estandarización de datos o contenidos', NULL, NULL),
(99, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811120', 'Servicios de datos', '81112008', 'Servicios de generación de originales de cd-rom', NULL, NULL),
(100, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811120', 'Servicios de datos', '81112009', 'Servicios de clasificación de datos o contenidos', NULL, NULL),
(101, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811120', 'Servicios de datos', '81112010', 'Servicio de conversión de datos', NULL, NULL),
(102, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811121', 'Servicios de internet', '81112101', 'Proveedores de servicio de internet (psi)', NULL, NULL),
(103, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811121', 'Servicios de internet', '81112102', 'Proveedor de servicio de correo electrónico', NULL, NULL),
(104, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811121', 'Servicios de internet', '81112103', 'Servicios de diseño de sitios web www   ', NULL, NULL),
(105, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811121', 'Servicios de internet', '81112104', 'Proveedores de motores de búsqueda en la web', NULL, NULL),
(106, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811121', 'Servicios de internet', '81112105', 'Servicios de hospedaje de operación de sitios web', NULL, NULL),
(107, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811121', 'Servicios de internet', '81112106', 'Proveedores de servicios de aplicación', NULL, NULL),
(108, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811121', 'Servicios de internet', '81112107', 'Nombres de los dominio de internet', NULL, NULL),
(109, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112201', 'Tarifas de soporte o mantenimiento', NULL, NULL),
(110, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112202', 'Actualizaciones o parches de software', NULL, NULL),
(111, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112203', 'Servicio de actualización o parcheo de firmware', NULL, NULL),
(112, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112204', 'Mantenimiento de software de sistemas operativos', NULL, NULL),
(113, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112205', 'Mantenimiento de software de sistemas de gestión de bases de datos', NULL, NULL),
(114, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112206', 'Mantenimiento de software de búsqueda o recuperación de la información', NULL, NULL),
(115, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112207', 'Mantenimiento de software de videoconferencias', NULL, NULL),
(116, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112208', 'Mantenimiento de software de protección y seguridad', NULL, NULL),
(117, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112209', 'Mantenimiento de software de desarrollo', NULL, NULL),
(118, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112210', 'Mantenimiento de software de gestión de sistemas', NULL, NULL),
(119, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112211', 'Mantenimiento de software de planificación de recursos empresariales', NULL, NULL),
(120, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112212', 'Mantenimiento de software de administración de relaciones con el consumidor', NULL, NULL),
(121, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112213', 'Mantenimiento del software de contabilidad', NULL, NULL),
(122, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112214', 'Mantenimiento de software de autoría y edición de contenido', NULL, NULL),
(123, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112215', 'Mantenimiento de software de gestión del contenido', NULL, NULL),
(124, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112216', 'Mantenimiento de software de referencia o educativo', NULL, NULL),
(125, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112217', 'Mantenimiento de software específico de industrias', NULL, NULL),
(126, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112218', 'Aplicaciones para el mantenimiento de software.', NULL, NULL),
(127, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112219', 'Mantenimiento de software de juegos o entretenimiento de computador', NULL, NULL),
(128, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112220', 'Mantenimiento de software de servidores', NULL, NULL),
(129, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112221', 'Servicio de mantenimiento del software del punto de venta', NULL, NULL),
(130, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811122', 'Mantenimiento y soporte de software', '81112222', 'Mantenimiento de software de gestión mantenimiento y operación de las instalaciones', NULL, NULL),
(131, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811123', 'Mantenimiento y soporte de hardware de computador', '81112301', 'Mantenimiento de sistemas de almacenamiento de discos', NULL, NULL),
(132, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811123', 'Mantenimiento y soporte de hardware de computador', '81112302', 'Mantenimiento de sistemas de copias de seguridad o de nearline', NULL, NULL),
(133, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811123', 'Mantenimiento y soporte de hardware de computador', '81112303', 'Mantenimiento de computadores mainframe', NULL, NULL),
(134, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811123', 'Mantenimiento y soporte de hardware de computador', '81112304', 'Mantenimiento de servidores unix', NULL, NULL),
(135, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811123', 'Mantenimiento y soporte de hardware de computador', '81112305', 'Mantenimiento de servidores x86', NULL, NULL),
(136, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811123', 'Mantenimiento y soporte de hardware de computador', '81112306', 'Mantenimiento de impresoras', NULL, NULL),
(137, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811123', 'Mantenimiento y soporte de hardware de computador', '81112307', 'Mantenimiento de pc o puestos de trabajo o cuadernos', NULL, NULL),
(138, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811123', 'Mantenimiento y soporte de hardware de computador', '81112308', 'Servicio de soporte y mantenimiento de hardware de puntos de venta', NULL, NULL),
(139, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811123', 'Mantenimiento y soporte de hardware de computador', '81112309', 'Servicio de instalación o implementación de hardware de puntos de venta', NULL, NULL),
(140, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811124', 'Servicios de alquiler o arrendamiento de hardware de computador', '81112401', 'Alquiler de hardware de computadores', NULL, NULL),
(141, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811125', 'Servicios de alquiler o arrendamiento de licencias de software de computador', '81112501', 'Servicio de licencias del software del computador', NULL, NULL),
(142, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8111', 'Servicios informáticos', '811125', 'Servicios de alquiler o arrendamiento de licencias de software de computador', '81112502', 'Servicio de arriendo o leasing de software de computadores', NULL, NULL),
(143, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8112', 'Economía', '811215', 'Análisis económico', '81121501', 'Análisis macroeconómico', NULL, NULL),
(144, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8112', 'Economía', '811215', 'Análisis económico', '81121502', 'Análisis microeconómico', NULL, NULL),
(145, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8112', 'Economía', '811215', 'Análisis económico', '81121503', 'Econometría', NULL, NULL),
(146, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8112', 'Economía', '811215', 'Análisis económico', '81121504', 'Proyecciones económicas', NULL, NULL),
(147, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8112', 'Economía', '811216', 'Sistemas y emisiones monetarias', '81121601', 'Política monetaria', NULL, NULL),
(148, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8112', 'Economía', '811216', 'Sistemas y emisiones monetarias', '81121602', 'Sistemas monetarios', NULL, NULL),
(149, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8112', 'Economía', '811216', 'Sistemas y emisiones monetarias', '81121603', 'Análisis monetario', NULL, NULL),
(150, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8112', 'Economía', '811216', 'Sistemas y emisiones monetarias', '81121604', 'Liquidez monetaria', NULL, NULL),
(151, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8112', 'Economía', '811216', 'Sistemas y emisiones monetarias', '81121605', 'Reservas de metales preciosos', NULL, NULL),
(152, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8112', 'Economía', '811216', 'Sistemas y emisiones monetarias', '81121606', 'Control de cambio de divisas', NULL, NULL),
(153, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8112', 'Economía', '811216', 'Sistemas y emisiones monetarias', '81121607', 'Mercados cambio de divisas', NULL, NULL),
(154, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8113', 'Estadística', '811315', 'Metodología y Análisis', '81131501', 'Análisis de factores', NULL, NULL),
(155, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8113', 'Estadística', '811315', 'Metodología y Análisis', '81131502', 'Análisis multivariate', NULL, NULL),
(156, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8113', 'Estadística', '811315', 'Metodología y Análisis', '81131503', 'Análisis de regresión', NULL, NULL),
(157, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8113', 'Estadística', '811315', 'Metodología y Análisis', '81131504', 'Encuestas por muestreo', NULL, NULL),
(158, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8113', 'Estadística', '811315', 'Metodología y Análisis', '81131505', 'Análisis de series temporales', NULL, NULL),
(159, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811415', 'Control de calidad', '81141501', 'Ensayo de materiales', NULL, NULL),
(160, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811415', 'Control de calidad', '81141502', 'Síntesis de materiales', NULL, NULL),
(161, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811415', 'Control de calidad', '81141503', 'Inspección de materiales o productos', NULL, NULL),
(162, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811415', 'Control de calidad', '81141504', 'Reparación o calibración de pruebas de equipo', NULL, NULL),
(163, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811415', 'Control de calidad', '81141505', 'Desarrollo de estándares de producción', NULL, NULL),
(164, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811415', 'Control de calidad', '81141506', 'Ensayo de productos', NULL, NULL),
(165, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811416', 'Manejo de cadena de suministros', '81141601', 'Logística', NULL, NULL),
(166, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811416', 'Manejo de cadena de suministros', '81141602', 'Análisis de tránsito', NULL, NULL),
(167, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811416', 'Manejo de cadena de suministros', '81141603', 'Economía o finanzas del transporte', NULL, NULL),
(168, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811416', 'Manejo de cadena de suministros', '81141604', 'Facilitación del transporte', NULL, NULL),
(169, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811416', 'Manejo de cadena de suministros', '81141605', 'Infraestructura del transporte', NULL, NULL),
(170, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811416', 'Manejo de cadena de suministros', '81141606', 'Planificación del transporte', NULL, NULL),
(171, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811417', 'Planeación y control de producción', '81141701', 'Planificación de la producción', NULL, NULL),
(172, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811417', 'Planeación y control de producción', '81141702', 'Control de la producción', NULL, NULL),
(173, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811417', 'Planeación y control de producción', '81141703', 'Programación de la producción', NULL, NULL),
(174, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811417', 'Planeación y control de producción', '81141704', 'Servicios de análisis o recopilación de estadísticas de producción', NULL, NULL),
(175, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811418', 'Administración de instalaciones', '81141801', 'Análisis de riesgo o seguridad', NULL, NULL),
(176, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811418', 'Administración de instalaciones', '81141802', 'Higiene o ventilación industrial', NULL, NULL),
(177, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811418', 'Administración de instalaciones', '81141803', 'Control del ruido o de la acústica', NULL, NULL),
(178, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811418', 'Administración de instalaciones', '81141804', 'Servicio de inspección de equipos', NULL, NULL),
(179, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811418', 'Administración de instalaciones', '81141805', 'Servicio de inspección de edificios', NULL, NULL),
(180, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811418', 'Administración de instalaciones', '81141806', 'Servicios de inspección de líneas de energía eléctrica', NULL, NULL),
(181, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811418', 'Administración de instalaciones', '81141807', 'Servicios de inspección de plomería o alcantarillado', NULL, NULL),
(182, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811419', 'Servicios de investigación y desarrollo de tecnología manufacturera', '81141901', 'Servicio de investigación y desarrollo de productos', NULL, NULL),
(183, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8114', 'Tecnologías de fabricación', '811419', 'Servicios de investigación y desarrollo de tecnología manufacturera', '81141902', 'Servicio de investigación y desarrollo de aplicaciones o tecnología', NULL, NULL),
(184, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811515', 'Meteorología', '81151501', 'Climatología', NULL, NULL),
(185, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811515', 'Meteorología', '81151502', 'Servicios meteorológicos', NULL, NULL),
(186, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811515', 'Meteorología', '81151503', 'Hidrometeorología', NULL, NULL),
(187, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811516', 'Cartografía', '81151601', 'Cartografía', NULL, NULL),
(188, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811516', 'Cartografía', '81151602', 'Producción de mapas', NULL, NULL),
(189, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811516', 'Cartografía', '81151603', 'Fotogrametría', NULL, NULL),
(190, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811516', 'Cartografía', '81151604', 'Agrimensura', NULL, NULL),
(191, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811517', 'Geología', '81151701', 'Fotogeología', NULL, NULL),
(192, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811517', 'Geología', '81151702', 'Geología estratigráfica', NULL, NULL),
(193, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811517', 'Geología', '81151703', 'Estudios geológicos', NULL, NULL),
(194, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811517', 'Geología', '81151704', 'Exploración geológica', NULL, NULL),
(195, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811517', 'Geología', '81151705', 'Servicios arqueológicos', NULL, NULL),
(196, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811518', 'Oceanografía e hidrología', '81151801', 'Estudio oceanográfico', NULL, NULL),
(197, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811518', 'Oceanografía e hidrología', '81151802', 'Oceanografía estuarina', NULL, NULL),
(198, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811518', 'Oceanografía e hidrología', '81151803', 'Oceanografía física', NULL, NULL),
(199, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811518', 'Oceanografía e hidrología', '81151804', 'Estudios hidrológicos', NULL, NULL),
(200, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811518', 'Oceanografía e hidrología', '81151805', 'Estudios batimétricos', NULL, NULL),
(201, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811518', 'Oceanografía e hidrología', '81151806', 'Exploración submarina', NULL, NULL),
(202, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811519', 'Geofísica', '81151901', 'Estudios geofísicos', NULL, NULL),
(203, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811519', 'Geofísica', '81151902', 'Exploración geofísica', NULL, NULL),
(204, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811519', 'Geofísica', '81151903', 'Interpretación de fotografía geofísica', NULL, NULL),
(205, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8115', 'Servicios de pedología', '811519', 'Geofísica', '81151904', 'Geofísica aeromagnética', NULL, NULL),
(206, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811615', 'Servicios de administración de acceso', '81161501', 'Servicio de administración de aplicaciones de software', NULL, NULL),
(207, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811615', 'Servicios de administración de acceso', '81161502', 'Servicio de administración de cuentas en la red', NULL, NULL),
(208, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811615', 'Servicios de administración de acceso', '81161503', 'Servicio de administración de carpetas en la red', NULL, NULL),
(209, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811616', 'Servicios de correo electrónico y mensajería', '81161601', 'Servicio de administración de mensajería instantánea', NULL, NULL),
(210, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161701', 'Servicio de administración de fax', NULL, NULL),
(211, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161702', 'Servicio de soporte para fax', NULL, NULL),
(212, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161703', 'Servicio de administración de telefonía móvil', NULL, NULL),
(213, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161704', 'Servicio de soporte para telefonía móvil', NULL, NULL),
(214, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161705', 'Servicio de administración de radiobúsquedas', NULL, NULL),
(215, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161706', 'Servicio de soporte para radiobúsquedas', NULL, NULL),
(216, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161707', 'Servicio de administración telefónica', NULL, NULL),
(217, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161708', 'Servicio de soporte telefónico', NULL, NULL),
(218, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161709', 'Servicio de administración del correo de voz', NULL, NULL),
(219, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161710', 'Servicios de soporte del correo de voz', NULL, NULL),
(220, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161711', 'Servicio de videoconferencias', NULL, NULL),
(221, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811617', 'Servicios de telecomunicaciones', '81161712', 'Servicio de voz en la red', NULL, NULL),
(222, '81', 'Servicios Basados en Ingeniería, Investigación y Tecnología', '8116', 'Entrega de servicios de tecnología de información', '811618', 'Servicios de alquiler o arrendamiento de equipos o plataformas de voz y datos o multimedia', '81161801', 'Servicio de arriendo o leasing de plataformas o equipos de comunicación de datos', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_languages`
--

CREATE TABLE `api_languages` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_languages`
--

INSERT INTO `api_languages` (`id`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'árabe', NULL, NULL),
(2, 'ar_AE', 'árabe [Emiratos Árabes Unidos]', NULL, NULL),
(3, 'ar_BH', 'árabe [Bahráin]', NULL, NULL),
(4, 'ar_DZ', 'árabe [Argelia]', NULL, NULL),
(5, 'ar_EG', 'árabe [Egipto]', NULL, NULL),
(6, 'ar_IQ', 'árabe [Iraq]', NULL, NULL),
(7, 'ar_JO', 'árabe [Jordania]', NULL, NULL),
(8, 'ar_KW', 'árabe [Kuwait]', NULL, NULL),
(9, 'ar_LB', 'árabe [Líbano]', NULL, NULL),
(10, 'ar_LY', 'árabe [Libia]', NULL, NULL),
(11, 'ar_MA', 'árabe [Marruecos]', NULL, NULL),
(12, 'ar_OM', 'árabe [Omán]', NULL, NULL),
(13, 'ar_QA', 'árabe [Qatar]', NULL, NULL),
(14, 'ar_SA', 'árabe [Arabia Saudita]', NULL, NULL),
(15, 'ar_SD', 'árabe [Sudán]', NULL, NULL),
(16, 'ar_SY', 'árabe [Siria]', NULL, NULL),
(17, 'ar_TN', 'árabe [Túnez]', NULL, NULL),
(18, 'ar_YE', 'árabe [Yemen]', NULL, NULL),
(19, 'be', 'bielorruso', NULL, NULL),
(20, 'be_BY', 'bielorruso [Bielorrusia]', NULL, NULL),
(21, 'bg', 'búlgaro', NULL, NULL),
(22, 'bg_BG', 'búlgaro [Bulgaria]', NULL, NULL),
(23, 'ca', 'catalán', NULL, NULL),
(24, 'ca_ES', 'catalán [España]', NULL, NULL),
(25, 'cs', 'checo', NULL, NULL),
(26, 'cs_CZ', 'checo [Chequia]', NULL, NULL),
(27, 'da', 'danés', NULL, NULL),
(28, 'da_DK', 'danés [Dinamarca]', NULL, NULL),
(29, 'de', 'alemán', NULL, NULL),
(30, 'de_AT', 'alemán [Austria]', NULL, NULL),
(31, 'de_CH', 'alemán [Suiza]', NULL, NULL),
(32, 'de_DE', 'alemán [Alemania]', NULL, NULL),
(33, 'de_LU', 'alemán [Luxemburgo]', NULL, NULL),
(34, 'el', 'griego', NULL, NULL),
(35, 'el_CY', 'griego [Chipre]', NULL, NULL),
(36, 'el_GR', 'griego [Grecia]', NULL, NULL),
(37, 'en', 'inglés', NULL, NULL),
(38, 'en_AU', 'inglés [Australia]', NULL, NULL),
(39, 'en_CA', 'inglés [Canadá]', NULL, NULL),
(40, 'en_GB', 'inglés [Reino Unido]', NULL, NULL),
(41, 'en_IE', 'inglés [Irlanda]', NULL, NULL),
(42, 'en_IN', 'inglés [India]', NULL, NULL),
(43, 'en_MT', 'inglés [Malta]', NULL, NULL),
(44, 'en_NZ', 'inglés [Nueva Zelanda]', NULL, NULL),
(45, 'en_PH', 'inglés [Filipinas]', NULL, NULL),
(46, 'en_SG', 'inglés [Singapur]', NULL, NULL),
(47, 'en_US', 'inglés [Estados Unidos]', NULL, NULL),
(48, 'en_ZA', 'inglés [Sudáfrica]', NULL, NULL),
(49, 'es', 'español', NULL, NULL),
(50, 'es_AR', 'español [Argentina]', NULL, NULL),
(51, 'es_BO', 'español [Bolivia]', NULL, NULL),
(52, 'es_CL', 'español [Chile]', NULL, NULL),
(53, 'es', 'español [Colombia]', NULL, NULL),
(54, 'es_CR', 'español [Costa Rica]', NULL, NULL),
(55, 'es_DO', 'español [República Dominicana]', NULL, NULL),
(56, 'es_EC', 'español [Ecuador]', NULL, NULL),
(57, 'es_ES', 'español [España]', NULL, NULL),
(58, 'es_GT', 'español [Guatemala]', NULL, NULL),
(59, 'es_HN', 'español [Honduras]', NULL, NULL),
(60, 'es_MX', 'español [México]', NULL, NULL),
(61, 'es_NI', 'español [Nicaragua]', NULL, NULL),
(62, 'es_PA', 'español [Panamá]', NULL, NULL),
(63, 'es_PE', 'español [Perú]', NULL, NULL),
(64, 'es_PR', 'español [Puerto Rico]', NULL, NULL),
(65, 'es_PY', 'español [Paraguay]', NULL, NULL),
(66, 'es_SV', 'español [El Salvador]', NULL, NULL),
(67, 'es_US', 'español [Estados Unidos]', NULL, NULL),
(68, 'es_UY', 'español [Uruguay]', NULL, NULL),
(69, 'es_VE', 'español [Venezuela]', NULL, NULL),
(70, 'et', 'estonio', NULL, NULL),
(71, 'et_EE', 'estonio [Estonia]', NULL, NULL),
(72, 'fi', 'finés', NULL, NULL),
(73, 'fi_FI', 'finés [Finlandia]', NULL, NULL),
(74, 'fr', 'francés', NULL, NULL),
(75, 'fr_BE', 'francés [Bélgica]', NULL, NULL),
(76, 'fr_CA', 'francés [Canadá]', NULL, NULL),
(77, 'fr_CH', 'francés [Suiza]', NULL, NULL),
(78, 'fr_FR', 'francés [Francia]', NULL, NULL),
(79, 'fr_LU', 'francés [Luxemburgo]', NULL, NULL),
(80, 'ga', 'irlandés', NULL, NULL),
(81, 'ga_IE', 'irlandés [Irlanda]', NULL, NULL),
(82, 'hi_IN', 'hindú [India]', NULL, NULL),
(83, 'hr', 'croata', NULL, NULL),
(84, 'hr_HR', 'croata [Croacia]', NULL, NULL),
(85, 'hu', 'húngaro', NULL, NULL),
(86, 'hu_HU', 'húngaro [Hungría]', NULL, NULL),
(87, 'in', 'indonesio', NULL, NULL),
(88, 'in_ID', 'indonesio [Indonesia]', NULL, NULL),
(89, 'is', 'islandés', NULL, NULL),
(90, 'is_IS', 'islandés [Islandia]', NULL, NULL),
(91, 'it', 'italiano', NULL, NULL),
(92, 'it_CH', 'italiano [Suiza]', NULL, NULL),
(93, 'it_IT', 'italiano [Italia]', NULL, NULL),
(94, 'iw', 'hebreo', NULL, NULL),
(95, 'iw_IL', 'hebreo [Israel]', NULL, NULL),
(96, 'ja', 'japonés', NULL, NULL),
(97, 'ja_JP', 'japonés [Japón]', NULL, NULL),
(99, 'ko', 'coreano', NULL, NULL),
(100, 'ko_KR', 'coreano [Corea del Sur]', NULL, NULL),
(101, 'lt', 'lituano', NULL, NULL),
(102, 'lt_LT', 'lituano [Lituania]', NULL, NULL),
(103, 'lv', 'letón', NULL, NULL),
(104, 'lv_LV', 'letón [Letonia]', NULL, NULL),
(105, 'mk', 'macedonio', NULL, NULL),
(106, 'mk_MK', 'macedonio [Macedonia]', NULL, NULL),
(107, 'ms', 'malayo', NULL, NULL),
(108, 'ms_MY', 'malayo [Malasia]', NULL, NULL),
(109, 'mt', 'maltés', NULL, NULL),
(110, 'mt_MT', 'maltés [Malta]', NULL, NULL),
(111, 'nl', 'neerlandés', NULL, NULL),
(112, 'nl_BE', 'neerlandés [Bélgica]', NULL, NULL),
(113, 'nl_NL', 'neerlandés [Holanda]', NULL, NULL),
(114, 'no', 'noruego', NULL, NULL),
(115, 'no_NO', 'noruego [Noruega]', NULL, NULL),
(117, 'pl', 'polaco', NULL, NULL),
(118, 'pl_PL', 'polaco [Polonia]', NULL, NULL),
(119, 'pt', 'portugués', NULL, NULL),
(120, 'pt_BR', 'portugués [Brasil]', NULL, NULL),
(121, 'pt_PT', 'portugués [Portugal]', NULL, NULL),
(122, 'ro', 'rumano', NULL, NULL),
(123, 'ro_RO', 'rumano [Rumania]', NULL, NULL),
(124, 'ru', 'ruso', NULL, NULL),
(125, 'ru_RU', 'ruso [Rusia]', NULL, NULL),
(126, 'sk', 'eslovaco', NULL, NULL),
(127, 'sk_SK', 'eslovaco [Eslovaquia]', NULL, NULL),
(128, 'sl', 'eslovenio', NULL, NULL),
(129, 'sl_SI', 'eslovenio [Eslovenia]', NULL, NULL),
(130, 'sq', 'albanés', NULL, NULL),
(131, 'sq_AL', 'albanés [Albania]', NULL, NULL),
(132, 'sr', 'serbio', NULL, NULL),
(133, 'sr_BA', 'serbio [Bosnia y Hercegovina]', NULL, NULL),
(134, 'sr_CS', 'serbio [Serbia y Montenegro]', NULL, NULL),
(135, 'sr_ME', 'serbio [Montenegro]', NULL, NULL),
(136, 'sr_RS', 'serbio [Serbia]', NULL, NULL),
(137, 'sv', 'sueco', NULL, NULL),
(138, 'sv_SE', 'sueco [Suecia]', NULL, NULL),
(139, 'th', 'tailandés', NULL, NULL),
(140, 'th_TH', 'tailandés [Tailandia]', NULL, NULL),
(142, 'tr', 'turco', NULL, NULL),
(143, 'tr_TR', 'turco [Turquía]', NULL, NULL),
(144, 'uk', 'ucranio', NULL, NULL),
(145, 'uk_UA', 'ucranio [Ucrania]', NULL, NULL),
(146, 'vi', 'vietnamita', NULL, NULL),
(147, 'vi_VN', 'vietnamita [Vietnam]', NULL, NULL),
(148, 'zh', 'chino', NULL, NULL),
(149, 'zh_CN', 'chino [China]', NULL, NULL),
(150, 'zh_HK', 'chino [Hong Kong]', NULL, NULL),
(151, 'zh_SG', 'chino [Singapur]', NULL, NULL),
(152, 'zh_TW', 'chino [Taiwán]', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_municipalities`
--

CREATE TABLE `api_municipalities` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `department` varchar(255) NOT NULL,
  `department_id` int(12) NOT NULL,
  `department_code` varchar(266) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Facturacion';

--
-- Volcado de datos para la tabla `api_municipalities`
--

INSERT INTO `api_municipalities` (`id`, `name`, `department`, `department_id`, `department_code`, `code`, `created_at`, `updated_at`) VALUES
(1, 'ABEJORRAL', 'Antioquia', 1, '05', '002', NULL, NULL),
(2, 'ABREGO', 'Norte de Santander', 18, '54', '003', NULL, NULL),
(3, 'ABRIAQUÍ', 'Antioquia', 1, '05', '004', NULL, NULL),
(4, 'ACACÍAS', 'Meta', 16, '50', '006', NULL, NULL),
(5, 'ACANDÍ', 'Chocó', 12, '27', '006', NULL, NULL),
(6, 'ACEVEDO', 'Huila', 13, '41', '006', NULL, NULL),
(7, 'ACHÍ', 'Bolívar', 4, '13', '006', NULL, NULL),
(8, 'AGRADO', 'Huila', 13, '41', '013', NULL, NULL),
(9, 'AGUA DE DIOS', 'Cundinamarca', 11, '25', '001', NULL, NULL),
(10, 'AGUACHICA', 'Cesar', 9, '20', '011', NULL, NULL),
(11, 'AGUADA', 'Santander', 21, '68', '013', NULL, NULL),
(12, 'AGUADAS', 'Caldas', 6, '17', '013', NULL, NULL),
(13, 'AGUAZUL', 'Casanare', 26, '85', '010', NULL, NULL),
(14, 'AGUSTÍN CODAZZI', 'Cesar', 9, '20', '013', NULL, NULL),
(15, 'AIPE', 'Huila', 13, '41', '016', NULL, NULL),
(16, 'ALBÁN', 'Cundinamarca', 11, '25', '019', NULL, NULL),
(17, 'ALBÁN', 'Nariño', 17, '52', '019', NULL, NULL),
(18, 'ALBANIA', 'Caquetá', 7, '18', '029', NULL, NULL),
(19, 'ALBANIA', 'La Guajira', 14, '44', '035', NULL, NULL),
(20, 'ALBANIA', 'Santander', 21, '68', '020', NULL, NULL),
(21, 'ALCALÁ', 'Valle del Cauca', 24, '76', '020', NULL, NULL),
(22, 'ALDANA', 'Nariño', 17, '52', '022', NULL, NULL),
(23, 'ALEJANDRÍA', 'Antioquia', 1, '05', '021', NULL, NULL),
(24, 'ALGARROBO', 'Magdalena', 15, '47', '030', NULL, NULL),
(25, 'ALGECIRAS', 'Huila', 13, '41', '020', NULL, NULL),
(26, 'ALMAGUER', 'Cauca', 8, '19', '022', NULL, NULL),
(27, 'ALMEIDA', 'Boyacá', 5, '15', '022', NULL, NULL),
(28, 'ALPUJARRA', 'Tolima', 23, '73', '024', NULL, NULL),
(29, 'ALTAMIRA', 'Huila', 13, '41', '026', NULL, NULL),
(30, 'ALTO BAUDO', 'Chocó', 12, '27', '025', NULL, NULL),
(31, 'ALTOS DEL ROSARIO', 'Bolívar', 4, '13', '030', NULL, NULL),
(32, 'ALVARADO', 'Tolima', 23, '73', '026', NULL, NULL),
(33, 'AMAGÁ', 'Antioquia', 1, '05', '030', NULL, NULL),
(34, 'AMALFI', 'Antioquia', 1, '05', '031', NULL, NULL),
(35, 'AMBALEMA', 'Tolima', 23, '73', '030', NULL, NULL),
(36, 'ANAPOIMA', 'Cundinamarca', 11, '25', '035', NULL, NULL),
(37, 'ANCUYÁ', 'Nariño', 17, '52', '036', NULL, NULL),
(38, 'ANDALUCÍA', 'Valle del Cauca', 24, '76', '036', NULL, NULL),
(39, 'ANDES', 'Antioquia', 1, '05', '034', NULL, NULL),
(40, 'ANGELÓPOLIS', 'Antioquia', 1, '05', '036', NULL, NULL),
(41, 'ANGOSTURA', 'Antioquia', 1, '05', '038', NULL, NULL),
(42, 'ANOLAIMA', 'Cundinamarca', 11, '25', '040', NULL, NULL),
(43, 'ANORÍ', 'Antioquia', 1, '05', '040', NULL, NULL),
(44, 'ANSERMA', 'Caldas', 6, '17', '042', NULL, NULL),
(45, 'ANSERMANUEVO', 'Valle del Cauca', 24, '76', '041', NULL, NULL),
(46, 'ANZA', 'Antioquia', 1, '05', '044', NULL, NULL),
(47, 'ANZOÁTEGUI', 'Tolima', 23, '73', '043', NULL, NULL),
(48, 'APARTADÓ', 'Antioquia', 1, '05', '045', NULL, NULL),
(49, 'APÍA', 'Risaralda', 20, '66', '045', NULL, NULL),
(50, 'APULO', 'Cundinamarca', 11, '25', '599', NULL, NULL),
(51, 'AQUITANIA', 'Boyacá', 5, '15', '047', NULL, NULL),
(52, 'ARACATACA', 'Magdalena', 15, '47', '053', NULL, NULL),
(53, 'ARANZAZU', 'Caldas', 6, '17', '050', NULL, NULL),
(54, 'ARATOCA', 'Santander', 21, '68', '051', NULL, NULL),
(55, 'ARAUCA', 'Arauca', 25, '81', '001', NULL, NULL),
(56, 'ARAUQUITA', 'Arauca', 25, '81', '065', NULL, NULL),
(57, 'ARBELÁEZ', 'Cundinamarca', 11, '25', '053', NULL, NULL),
(58, 'ARBOLEDA', 'Nariño', 17, '52', '051', NULL, NULL),
(59, 'ARBOLEDAS', 'Norte de Santander', 18, '54', '051', NULL, NULL),
(60, 'ARBOLETES', 'Antioquia', 1, '05', '051', NULL, NULL),
(61, 'ARCABUCO', 'Boyacá', 5, '15', '051', NULL, NULL),
(62, 'ARENAL', 'Bolívar', 4, '13', '042', NULL, NULL),
(63, 'ARGELIA', 'Antioquia', 1, '05', '055', NULL, NULL),
(64, 'ARGELIA', 'Cauca', 8, '19', '050', NULL, NULL),
(65, 'ARGELIA', 'Valle del Cauca', 24, '76', '054', NULL, NULL),
(66, 'ARIGUANÍ', 'Magdalena', 15, '47', '058', NULL, NULL),
(67, 'ARJONA', 'Bolívar', 4, '13', '052', NULL, NULL),
(68, 'ARMENIA', 'Antioquia', 1, '05', '059', NULL, NULL),
(69, 'ARMENIA', 'Quindio', 19, '63', '001', NULL, NULL),
(70, 'ARMERO', 'Tolima', 23, '73', '055', NULL, NULL),
(71, 'ARROYOHONDO', 'Bolívar', 4, '13', '062', NULL, NULL),
(72, 'ASTREA', 'Cesar', 9, '20', '032', NULL, NULL),
(73, 'ATACO', 'Tolima', 23, '73', '067', NULL, NULL),
(74, 'ATRATO', 'Chocó', 12, '27', '050', NULL, NULL),
(75, 'AYAPEL', 'Córdoba', 10, '23', '068', NULL, NULL),
(76, 'BAGADÓ', 'Chocó', 12, '27', '073', NULL, NULL),
(77, 'BAHÍA SOLANO', 'Chocó', 12, '27', '075', NULL, NULL),
(78, 'BAJO BAUDÓ', 'Chocó', 12, '27', '077', NULL, NULL),
(79, 'BALBOA', 'Cauca', 8, '19', '075', NULL, NULL),
(80, 'BALBOA', 'Risaralda', 20, '66', '075', NULL, NULL),
(81, 'BARANOA', 'Atlántico', 2, '08', '078', NULL, NULL),
(82, 'BARAYA', 'Huila', 13, '41', '078', NULL, NULL),
(83, 'BARBACOAS', 'Nariño', 17, '52', '079', NULL, NULL),
(84, 'BARBOSA', 'Antioquia', 1, '05', '079', NULL, NULL),
(85, 'BARBOSA', 'Santander', 21, '68', '077', NULL, NULL),
(86, 'BARICHARA', 'Santander', 21, '68', '079', NULL, NULL),
(87, 'BARRANCA DE UPÍA', 'Meta', 16, '50', '110', NULL, NULL),
(88, 'BARRANCABERMEJA', 'Santander', 21, '68', '081', NULL, NULL),
(89, 'BARRANCAS', 'La Guajira', 14, '44', '078', NULL, NULL),
(90, 'BARRANCO DE LOBA', 'Bolívar', 4, '13', '074', NULL, NULL),
(91, 'BARRANCO MINAS', 'Guainía', 30, '94', '343', NULL, NULL),
(92, 'BARRANQUILLA', 'Atlántico', 2, '08', '001', NULL, NULL),
(93, 'BECERRIL', 'Cesar', 9, '20', '045', NULL, NULL),
(94, 'BELALCÁZAR', 'Caldas', 6, '17', '088', NULL, NULL),
(95, 'BELÉN', 'Boyacá', 5, '15', '087', NULL, NULL),
(96, 'BELÉN', 'Nariño', 17, '52', '083', NULL, NULL),
(97, 'BELÉN DE BAJIRÁ', 'Chocó', 12, '27', '086', NULL, NULL),
(98, 'BELÉN DE LOS ANDAQUIES', 'Caquetá', 7, '18', '094', NULL, NULL),
(99, 'BELÉN DE UMBRÍA', 'Risaralda', 20, '66', '088', NULL, NULL),
(100, 'BELLO', 'Antioquia', 1, '05', '088', NULL, NULL),
(101, 'BELMIRA', 'Antioquia', 1, '05', '086', NULL, NULL),
(102, 'BELTRÁN', 'Cundinamarca', 11, '25', '086', NULL, NULL),
(103, 'BERBEO', 'Boyacá', 5, '15', '090', NULL, NULL),
(104, 'BETANIA', 'Antioquia', 1, '05', '091', NULL, NULL),
(105, 'BETÉITIVA', 'Boyacá', 5, '15', '092', NULL, NULL),
(106, 'BETULIA', 'Antioquia', 1, '05', '093', NULL, NULL),
(107, 'BETULIA', 'Santander', 21, '68', '092', NULL, NULL),
(108, 'BITUIMA', 'Cundinamarca', 11, '25', '095', NULL, NULL),
(109, 'BOAVITA', 'Boyacá', 5, '15', '097', NULL, NULL),
(110, 'BOCHALEMA', 'Norte de Santander', 18, '54', '099', NULL, NULL),
(111, 'BOGOTÁ', 'Bogotá D.C', 3, '11', '001', NULL, NULL),
(112, 'BOJACÁ', 'Cundinamarca', 11, '25', '099', NULL, NULL),
(113, 'BOJAYA', 'Chocó', 12, '27', '099', NULL, NULL),
(114, 'BOLÍVAR', 'Cauca', 8, '19', '100', NULL, NULL),
(115, 'BOLÍVAR', 'Santander', 21, '68', '101', NULL, NULL),
(116, 'BOLÍVAR', 'Valle del Cauca', 24, '76', '100', NULL, NULL),
(117, 'BOSCONIA', 'Cesar', 9, '20', '060', NULL, NULL),
(118, 'BOYACÁ', 'Boyacá', 5, '15', '104', NULL, NULL),
(119, 'BRICEÑO', 'Antioquia', 1, '05', '107', NULL, NULL),
(120, 'BRICEÑO', 'Boyacá', 5, '15', '106', NULL, NULL),
(121, 'BUCARAMANGA', 'Santander', 21, '68', '001', NULL, NULL),
(122, 'BUCARASICA', 'Norte de Santander', 18, '54', '109', NULL, NULL),
(123, 'BUENAVENTURA', 'Valle del Cauca', 24, '76', '109', NULL, NULL),
(124, 'BUENAVISTA', 'Boyacá', 5, '15', '109', NULL, NULL),
(125, 'BUENAVISTA', 'Córdoba', 10, '23', '079', NULL, NULL),
(126, 'BUENAVISTA', 'Quindio', 19, '63', '111', NULL, NULL),
(127, 'BUENAVISTA', 'Sucre', 22, '70', '110', NULL, NULL),
(128, 'BUENOS AIRES', 'Cauca', 8, '19', '110', NULL, NULL),
(129, 'BUESACO', 'Nariño', 17, '52', '110', NULL, NULL),
(130, 'BUGALAGRANDE', 'Valle del Cauca', 24, '76', '113', NULL, NULL),
(131, 'BURITICÁ', 'Antioquia', 1, '05', '113', NULL, NULL),
(132, 'BUSBANZÁ', 'Boyacá', 5, '15', '114', NULL, NULL),
(133, 'CABRERA', 'Cundinamarca', 11, '25', '120', NULL, NULL),
(134, 'CABRERA', 'Santander', 21, '68', '121', NULL, NULL),
(135, 'CABUYARO', 'Meta', 16, '50', '124', NULL, NULL),
(136, 'CACAHUAL', 'Guainía', 30, '94', '886', NULL, NULL),
(137, 'CÁCERES', 'Antioquia', 1, '05', '120', NULL, NULL),
(138, 'CACHIPAY', 'Cundinamarca', 11, '25', '123', NULL, NULL),
(139, 'CACHIRÁ', 'Norte de Santander', 18, '54', '128', NULL, NULL),
(140, 'CÁCOTA', 'Norte de Santander', 18, '54', '125', NULL, NULL),
(141, 'CAICEDO', 'Antioquia', 1, '05', '125', NULL, NULL),
(142, 'CAICEDONIA', 'Valle del Cauca', 24, '76', '122', NULL, NULL),
(143, 'CAIMITO', 'Sucre', 22, '70', '124', NULL, NULL),
(144, 'CAJAMARCA', 'Tolima', 23, '73', '124', NULL, NULL),
(145, 'CAJIBÍO', 'Cauca', 8, '19', '130', NULL, NULL),
(146, 'CAJICÁ', 'Cundinamarca', 11, '25', '126', NULL, NULL),
(147, 'CALAMAR', 'Bolívar', 4, '13', '140', NULL, NULL),
(148, 'CALAMAR', 'Guaviare', 31, '95', '015', NULL, NULL),
(149, 'CALARCÁ', 'Quindio', 19, '63', '130', NULL, NULL),
(150, 'CALDAS', 'Antioquia', 1, '05', '129', NULL, NULL),
(151, 'CALDAS', 'Boyacá', 5, '15', '131', NULL, NULL),
(152, 'CALDONO', 'Cauca', 8, '19', '137', NULL, NULL),
(153, 'CALI', 'Valle del Cauca', 24, '76', '001', NULL, NULL),
(154, 'CALIFORNIA', 'Santander', 21, '68', '132', NULL, NULL),
(155, 'CALIMA', 'Valle del Cauca', 24, '76', '126', NULL, NULL),
(156, 'CALOTO', 'Cauca', 8, '19', '142', NULL, NULL),
(157, 'CAMPAMENTO', 'Antioquia', 1, '05', '134', NULL, NULL),
(158, 'CAMPO DE LA CRUZ', 'Atlántico', 2, '08', '137', NULL, NULL),
(159, 'CAMPOALEGRE', 'Huila', 13, '41', '132', NULL, NULL),
(160, 'CAMPOHERMOSO', 'Boyacá', 5, '15', '135', NULL, NULL),
(161, 'CANALETE', 'Córdoba', 10, '23', '090', NULL, NULL),
(162, 'CAÑASGORDAS', 'Antioquia', 1, '05', '138', NULL, NULL),
(163, 'CANDELARIA', 'Atlántico', 2, '08', '141', NULL, NULL),
(164, 'CANDELARIA', 'Valle del Cauca', 24, '76', '130', NULL, NULL),
(165, 'CANTAGALLO', 'Bolívar', 4, '13', '160', NULL, NULL),
(166, 'CAPARRAPÍ', 'Cundinamarca', 11, '25', '148', NULL, NULL),
(167, 'CAPITANEJO', 'Santander', 21, '68', '147', NULL, NULL),
(168, 'CAQUEZA', 'Cundinamarca', 11, '25', '151', NULL, NULL),
(169, 'CARACOLÍ', 'Antioquia', 1, '05', '142', NULL, NULL),
(170, 'CARAMANTA', 'Antioquia', 1, '05', '145', NULL, NULL),
(171, 'CARCASÍ', 'Santander', 21, '68', '152', NULL, NULL),
(172, 'CAREPA', 'Antioquia', 1, '05', '147', NULL, NULL),
(173, 'CARMEN DE APICALÁ', 'Tolima', 23, '73', '148', NULL, NULL),
(174, 'CARMEN DE CARUPA', 'Cundinamarca', 11, '25', '154', NULL, NULL),
(175, 'CARMEN DEL DARIEN', 'Chocó', 12, '27', '150', NULL, NULL),
(176, 'CAROLINA', 'Antioquia', 1, '05', '150', NULL, NULL),
(177, 'CARTAGENA', 'Bolívar', 4, '13', '001', NULL, NULL),
(178, 'CARTAGENA DEL CHAIRÁ', 'Caquetá', 7, '18', '150', NULL, NULL),
(179, 'CARTAGO', 'Valle del Cauca', 24, '76', '147', NULL, NULL),
(180, 'CARURU', 'Vaupés', 32, '97', '161', NULL, NULL),
(181, 'CASABIANCA', 'Tolima', 23, '73', '152', NULL, NULL),
(182, 'CASTILLA LA NUEVA', 'Meta', 16, '50', '150', NULL, NULL),
(183, 'CAUCASIA', 'Antioquia', 1, '05', '154', NULL, NULL),
(184, 'CEPITÁ', 'Santander', 21, '68', '160', NULL, NULL),
(185, 'CERETÉ', 'Córdoba', 10, '23', '162', NULL, NULL),
(186, 'CERINZA', 'Boyacá', 5, '15', '162', NULL, NULL),
(187, 'CERRITO', 'Santander', 21, '68', '162', NULL, NULL),
(188, 'CERRO SAN ANTONIO', 'Magdalena', 15, '47', '161', NULL, NULL),
(189, 'CÉRTEGUI', 'Chocó', 12, '27', '160', NULL, NULL),
(190, 'CHACHAGÜÍ', 'Nariño', 17, '52', '240', NULL, NULL),
(191, 'CHAGUANÍ', 'Cundinamarca', 11, '25', '168', NULL, NULL),
(192, 'CHALÁN', 'Sucre', 22, '70', '230', NULL, NULL),
(193, 'CHÁMEZA', 'Casanare', 26, '85', '015', NULL, NULL),
(194, 'CHAPARRAL', 'Tolima', 23, '73', '168', NULL, NULL),
(195, 'CHARALÁ', 'Santander', 21, '68', '167', NULL, NULL),
(196, 'CHARTA', 'Santander', 21, '68', '169', NULL, NULL),
(197, 'CHÍA', 'Cundinamarca', 11, '25', '175', NULL, NULL),
(198, 'CHIBOLO', 'Magdalena', 15, '47', '170', NULL, NULL),
(199, 'CHIGORODÓ', 'Antioquia', 1, '05', '172', NULL, NULL),
(200, 'CHIMA', 'Santander', 21, '68', '176', NULL, NULL),
(201, 'CHIMÁ', 'Córdoba', 10, '23', '168', NULL, NULL),
(202, 'CHIMICHAGUA', 'Cesar', 9, '20', '175', NULL, NULL),
(203, 'CHINÁCOTA', 'Norte de Santander', 18, '54', '172', NULL, NULL),
(204, 'CHINAVITA', 'Boyacá', 5, '15', '172', NULL, NULL),
(205, 'CHINCHINÁ', 'Caldas', 6, '17', '174', NULL, NULL),
(206, 'CHINÚ', 'Córdoba', 10, '23', '182', NULL, NULL),
(207, 'CHIPAQUE', 'Cundinamarca', 11, '25', '178', NULL, NULL),
(208, 'CHIPATÁ', 'Santander', 21, '68', '179', NULL, NULL),
(209, 'CHIQUINQUIRÁ', 'Boyacá', 5, '15', '176', NULL, NULL),
(210, 'CHÍQUIZA', 'Boyacá', 5, '15', '232', NULL, NULL),
(211, 'CHIRIGUANÁ', 'Cesar', 9, '20', '178', NULL, NULL),
(212, 'CHISCAS', 'Boyacá', 5, '15', '180', NULL, NULL),
(213, 'CHITA', 'Boyacá', 5, '15', '183', NULL, NULL),
(214, 'CHITAGÁ', 'Norte de Santander', 18, '54', '174', NULL, NULL),
(215, 'CHITARAQUE', 'Boyacá', 5, '15', '185', NULL, NULL),
(216, 'CHIVATÁ', 'Boyacá', 5, '15', '187', NULL, NULL),
(217, 'CHIVOR', 'Boyacá', 5, '15', '236', NULL, NULL),
(218, 'CHOACHÍ', 'Cundinamarca', 11, '25', '181', NULL, NULL),
(219, 'CHOCONTÁ', 'Cundinamarca', 11, '25', '183', NULL, NULL),
(220, 'CICUCO', 'Bolívar', 4, '13', '188', NULL, NULL),
(221, 'CIÉNAGA', 'Magdalena', 15, '47', '189', NULL, NULL),
(222, 'CIÉNAGA DE ORO', 'Córdoba', 10, '23', '189', NULL, NULL),
(223, 'CIÉNEGA', 'Boyacá', 5, '15', '189', NULL, NULL),
(224, 'CIMITARRA', 'Santander', 21, '68', '190', NULL, NULL),
(225, 'CIRCASIA', 'Quindio', 19, '63', '190', NULL, NULL),
(226, 'CISNEROS', 'Antioquia', 1, '05', '190', NULL, NULL),
(227, 'CIUDAD BOLÍVAR', 'Antioquia', 1, '05', '101', NULL, NULL),
(228, 'CLEMENCIA', 'Bolívar', 4, '13', '222', NULL, NULL),
(229, 'COCORNÁ', 'Antioquia', 1, '05', '197', NULL, NULL),
(230, 'COELLO', 'Tolima', 23, '73', '200', NULL, NULL),
(231, 'COGUA', 'Cundinamarca', 11, '25', '200', NULL, NULL),
(232, 'COLOMBIA', 'Huila', 13, '41', '206', NULL, NULL),
(233, 'COLÓN', 'Nariño', 17, '52', '203', NULL, NULL),
(234, 'COLÓN', 'Putumayo', 27, '86', '219', NULL, NULL),
(235, 'COLOSO', 'Sucre', 22, '70', '204', NULL, NULL),
(236, 'CÓMBITA', 'Boyacá', 5, '15', '204', NULL, NULL),
(237, 'CONCEPCIÓN', 'Antioquia', 1, '05', '206', NULL, NULL),
(238, 'CONCEPCIÓN', 'Santander', 21, '68', '207', NULL, NULL),
(239, 'CONCORDIA', 'Antioquia', 1, '05', '209', NULL, NULL),
(240, 'CONDOTO', 'Chocó', 12, '27', '205', NULL, NULL),
(241, 'CONFINES', 'Santander', 21, '68', '207', NULL, NULL),
(242, 'CONSACA', 'Nariño', 17, '52', '207', NULL, NULL),
(243, 'CONTADERO', 'Nariño', 17, '52', '210', NULL, NULL),
(244, 'CONTRATACIÓN', 'Santander', 21, '68', '211', NULL, NULL),
(245, 'CONVENCIÓN', 'Norte de Santander', 18, '54', '206', NULL, NULL),
(246, 'COPACABANA', 'Antioquia', 1, '05', '212', NULL, NULL),
(247, 'COPER', 'Boyacá', 5, '15', '212', NULL, NULL),
(248, 'CÓRDOBA', 'Nariño', 17, '52', '215', NULL, NULL),
(249, 'CORINTO', 'Cauca', 8, '19', '212', NULL, NULL),
(250, 'COROMORO', 'Santander', 21, '68', '217', NULL, NULL),
(251, 'COROZAL', 'Sucre', 22, '70', '215', NULL, NULL),
(252, 'CORRALES', 'Boyacá', 5, '15', '215', NULL, NULL),
(253, 'COTA', 'Cundinamarca', 11, '25', '214', NULL, NULL),
(254, 'COTORRA', 'Córdoba', 10, '23', '300', NULL, NULL),
(255, 'COVARACHÍA', 'Boyacá', 5, '15', '218', NULL, NULL),
(256, 'COVEÑAS', 'Sucre', 22, '70', '221', NULL, NULL),
(257, 'COYAIMA', 'Tolima', 23, '73', '217', NULL, NULL),
(258, 'CRAVO NORTE', 'Arauca', 25, '81', '220', NULL, NULL),
(259, 'CUASPUD', 'Nariño', 17, '52', '224', NULL, NULL),
(260, 'CUBARA', 'Boyacá', 5, '15', '213', NULL, NULL),
(261, 'CUBARRAL', 'Meta', 16, '50', '223', NULL, NULL),
(262, 'CUCAITA', 'Boyacá', 5, '15', '224', NULL, NULL),
(263, 'CUCUNUBÁ', 'Cundinamarca', 11, '25', '224', NULL, NULL),
(264, 'CÚCUTA', 'Norte de Santander', 18, '54', '001', NULL, NULL),
(265, 'CUCUTILLA', 'Norte de Santander', 18, '54', '223', NULL, NULL),
(266, 'CUÍTIVA', 'Boyacá', 5, '15', '226', NULL, NULL),
(267, 'CUMARAL', 'Meta', 16, '50', '226', NULL, NULL),
(268, 'CUMARIBO', 'Vichada', 33, '99', '773', NULL, NULL),
(269, 'CUMBAL', 'Nariño', 17, '52', '227', NULL, NULL),
(270, 'CUMBITARA', 'Nariño', 17, '52', '233', NULL, NULL),
(271, 'CUNDAY', 'Tolima', 23, '73', '226', NULL, NULL),
(272, 'CURILLO', 'Caquetá', 7, '18', '205', NULL, NULL),
(273, 'CURITÍ', 'Santander', 21, '68', '229', NULL, NULL),
(274, 'CURUMANÍ', 'Cesar', 9, '20', '228', NULL, NULL),
(275, 'DABEIBA', 'Antioquia', 1, '05', '234', NULL, NULL),
(276, 'DAGUA', 'Valle del Cauca', 24, '76', '233', NULL, NULL),
(277, 'DIBULLA', 'La Guajira', 14, '44', '090', NULL, NULL),
(278, 'DIBULLA', 'La Guajira', 14, '44', '090', NULL, NULL),
(279, 'DISTRACCIÓN', 'La Guajira', 14, '44', '098', NULL, NULL),
(280, 'DOLORES', 'Tolima', 23, '73', '236', NULL, NULL),
(281, 'DON MATÍAS', 'Antioquia', 1, '05', '237', NULL, NULL),
(282, 'DOSQUEBRADAS', 'Risaralda', 20, '66', '170', NULL, NULL),
(283, 'DUITAMA', 'Boyacá', 5, '15', '238', NULL, NULL),
(284, 'DURANIA', 'Norte de Santander', 18, '54', '239', NULL, NULL),
(285, 'EBÉJICO', 'Antioquia', 1, '05', '240', NULL, NULL),
(286, 'EL ÁGUILA', 'Valle del Cauca', 24, '76', '243', NULL, NULL),
(287, 'EL BAGRE', 'Antioquia', 1, '05', '250', NULL, NULL),
(288, 'EL BANCO', 'Magdalena', 15, '47', '245', NULL, NULL),
(289, 'EL CAIRO', 'Valle del Cauca', 24, '76', '246', NULL, NULL),
(290, 'EL CALVARIO', 'Meta', 16, '50', '245', NULL, NULL),
(291, 'EL CANTÓN DEL SAN PABLO', 'Chocó', 12, '27', '135', NULL, NULL),
(292, 'EL CARMEN', 'Norte de Santander', 18, '54', '245', NULL, NULL),
(293, 'EL CARMEN DE ATRATO', 'Chocó', 12, '27', '245', NULL, NULL),
(294, 'EL CARMEN DE BOLÍVAR', 'Bolívar', 4, '13', '244', NULL, NULL),
(295, 'EL CARMEN DE CHUCURÍ', 'Santander', 21, '68', '235', NULL, NULL),
(296, 'EL CARMEN DE VIBORAL', 'Antioquia', 1, '05', '148', NULL, NULL),
(297, 'EL CASTILLO', 'Meta', 16, '50', '251', NULL, NULL),
(298, 'EL CERRITO', 'Valle del Cauca', 24, '76', '248', NULL, NULL),
(299, 'EL CHARCO', 'Nariño', 17, '52', '250', NULL, NULL),
(300, 'EL COCUY', 'Boyacá', 5, '15', '244', NULL, NULL),
(301, 'EL COLEGIO', 'Cundinamarca', 11, '25', '245', NULL, NULL),
(302, 'EL COPEY', 'Cesar', 9, '20', '238', NULL, NULL),
(303, 'EL DONCELLO', 'Caquetá', 7, '18', '247', NULL, NULL),
(304, 'EL DORADO', 'Meta', 16, '50', '270', NULL, NULL),
(305, 'EL DOVIO', 'Valle del Cauca', 24, '76', '250', NULL, NULL),
(306, 'EL ENCANTO', 'Amazonas', 29, '91', '263', NULL, NULL),
(307, 'EL ESPINO', 'Boyacá', 5, '15', '248', NULL, NULL),
(308, 'EL GUACAMAYO', 'Santander', 21, '68', '245', NULL, NULL),
(309, 'EL GUAMO', 'Bolívar', 4, '13', '248', NULL, NULL),
(310, 'EL LITORAL DEL SAN JUAN', 'Chocó', 12, '27', '250', NULL, NULL),
(311, 'EL MOLINO', 'La Guajira', 14, '44', '110', NULL, NULL),
(312, 'EL PASO', 'Cesar', 9, '20', '250', NULL, NULL),
(313, 'EL PAUJIL', 'Caquetá', 7, '18', '256', NULL, NULL),
(314, 'EL PEÑOL', 'Nariño', 17, '52', '254', NULL, NULL),
(315, 'EL PEÑÓN', 'Bolívar', 4, '13', '268', NULL, NULL),
(316, 'EL PEÑÓN', 'Cundinamarca', 11, '25', '258', NULL, NULL),
(317, 'EL PEÑÓN', 'Santander', 21, '68', '250', NULL, NULL),
(318, 'EL PIÑON', 'Magdalena', 15, '47', '258', NULL, NULL),
(319, 'EL PLAYÓN', 'Santander', 21, '68', '255', NULL, NULL),
(320, 'EL RETÉN', 'Magdalena', 15, '47', '268', NULL, NULL),
(321, 'EL RETORNO', 'Guaviare', 31, '95', '025', NULL, NULL),
(322, 'EL ROBLE', 'Sucre', 22, '70', '233', NULL, NULL),
(323, 'EL ROSAL', 'Cundinamarca', 11, '25', '260', NULL, NULL),
(324, 'EL ROSARIO', 'Nariño', 17, '52', '256', NULL, NULL),
(325, 'EL SANTUARIO', 'Antioquia', 1, '05', '697', NULL, NULL),
(326, 'EL TABLÓN DE GÓMEZ', 'Nariño', 17, '52', '258', NULL, NULL),
(327, 'EL TAMBO', 'Cauca', 8, '19', '256', NULL, NULL),
(328, 'EL TAMBO', 'Nariño', 17, '52', '260', NULL, NULL),
(329, 'EL TARRA', 'Norte de Santander', 18, '54', '250', NULL, NULL),
(330, 'EL ZULIA', 'Norte de Santander', 18, '54', '261', NULL, NULL),
(331, 'ELÍAS', 'Huila', 13, '41', '244', NULL, NULL),
(332, 'ENCINO', 'Santander', 21, '68', '264', NULL, NULL),
(333, 'ENCISO', 'Santander', 21, '68', '266', NULL, NULL),
(334, 'ENTRERRIOS', 'Antioquia', 1, '05', '264', NULL, NULL),
(335, 'ENVIGADO', 'Antioquia', 1, '05', '266', NULL, NULL),
(336, 'ESPINAL', 'Tolima', 23, '73', '268', NULL, NULL),
(337, 'FACATATIVÁ', 'Cundinamarca', 11, '25', '269', NULL, NULL),
(338, 'FALAN', 'Tolima', 23, '73', '270', NULL, NULL),
(339, 'FILADELFIA', 'Caldas', 6, '17', '272', NULL, NULL),
(340, 'FILANDIA', 'Quindio', 19, '63', '272', NULL, NULL),
(341, 'FIRAVITOBA', 'Boyacá', 5, '15', '272', NULL, NULL),
(342, 'FLANDES', 'Tolima', 23, '73', '275', NULL, NULL),
(343, 'FLORENCIA', 'Caquetá', 7, '18', '001', NULL, NULL),
(344, 'FLORENCIA', 'Cauca', 8, '19', '290', NULL, NULL),
(345, 'FLORESTA', 'Boyacá', 5, '15', '276', NULL, NULL),
(346, 'FLORIÁN', 'Santander', 21, '68', '271', NULL, NULL),
(347, 'FLORIDA', 'Valle del Cauca', 24, '76', '275', NULL, NULL),
(348, 'FLORIDABLANCA', 'Santander', 21, '68', '276', NULL, NULL),
(349, 'FOMEQUE', 'Cundinamarca', 11, '25', '279', NULL, NULL),
(350, 'FONSECA', 'La Guajira', 14, '44', '279', NULL, NULL),
(351, 'FORTUL', 'Arauca', 25, '81', '300', NULL, NULL),
(352, 'FOSCA', 'Cundinamarca', 11, '25', '281', NULL, NULL),
(353, 'FRANCISCO PIZARRO', 'Nariño', 17, '52', '520', NULL, NULL),
(354, 'FREDONIA', 'Antioquia', 1, '05', '282', NULL, NULL),
(355, 'FRESNO', 'Tolima', 23, '73', '283', NULL, NULL),
(356, 'FRONTINO', 'Antioquia', 1, '05', '284', NULL, NULL),
(357, 'FUENTE DE ORO', 'Meta', 16, '50', '287', NULL, NULL),
(358, 'FUNDACIÓN', 'Magdalena', 15, '47', '288', NULL, NULL),
(359, 'FUNES', 'Nariño', 17, '52', '287', NULL, NULL),
(360, 'FUNZA', 'Cundinamarca', 11, '25', '286', NULL, NULL),
(361, 'FÚQUENE', 'Cundinamarca', 11, '25', '288', NULL, NULL),
(362, 'FUSAGASUGÁ', 'Cundinamarca', 11, '25', '290', NULL, NULL),
(363, 'GACHALA', 'Cundinamarca', 11, '25', '293', NULL, NULL),
(364, 'GACHANCIPÁ', 'Cundinamarca', 11, '25', '295', NULL, NULL),
(365, 'GACHANTIVÁ', 'Boyacá', 5, '15', '293', NULL, NULL),
(366, 'GACHETÁ', 'Cundinamarca', 11, '25', '297', NULL, NULL),
(367, 'GALÁN', 'Santander', 21, '68', '296', NULL, NULL),
(368, 'GALAPA', 'Atlántico', 2, '08', '296', NULL, NULL),
(369, 'GALERAS', 'Sucre', 22, '70', '235', NULL, NULL),
(370, 'GAMA', 'Cundinamarca', 11, '25', '299', NULL, NULL),
(371, 'GAMARRA', 'Cesar', 9, '20', '295', NULL, NULL),
(372, 'GAMBITA', 'Santander', 21, '68', '298', NULL, NULL),
(373, 'GAMEZA', 'Boyacá', 5, '15', '296', NULL, NULL),
(374, 'GARAGOA', 'Boyacá', 5, '15', '299', NULL, NULL),
(375, 'GARZÓN', 'Huila', 13, '41', '298', NULL, NULL),
(376, 'GÉNOVA', 'Quindio', 19, '63', '302', NULL, NULL),
(377, 'GIGANTE', 'Huila', 13, '41', '306', NULL, NULL),
(378, 'GINEBRA', 'Valle del Cauca', 24, '76', '306', NULL, NULL),
(379, 'GIRALDO', 'Antioquia', 1, '05', '306', NULL, NULL),
(380, 'GIRARDOT', 'Cundinamarca', 11, '25', '307', NULL, NULL),
(381, 'GIRARDOTA', 'Antioquia', 1, '05', '308', NULL, NULL),
(382, 'GIRÓN', 'Santander', 21, '68', '307', NULL, NULL),
(383, 'GÓMEZ PLATA', 'Antioquia', 1, '05', '310', NULL, NULL),
(384, 'GONZÁLEZ', 'Cesar', 9, '20', '310', NULL, NULL),
(385, 'GRAMALOTE', 'Norte de Santander', 18, '54', '313', NULL, NULL),
(386, 'GRANADA', 'Antioquia', 1, '05', '313', NULL, NULL),
(387, 'GRANADA', 'Cundinamarca', 11, '25', '312', NULL, NULL),
(388, 'GRANADA', 'Meta', 16, '50', '313', NULL, NULL),
(389, 'GUACA', 'Santander', 21, '68', '318', NULL, NULL),
(390, 'GUACAMAYAS', 'Boyacá', 5, '15', '317', NULL, NULL),
(391, 'GUACARÍ', 'Valle del Cauca', 24, '76', '318', NULL, NULL),
(392, 'GUACHENÉ', 'Cauca', 8, '19', '300', NULL, NULL),
(393, 'GUACHETÁ', 'Cundinamarca', 11, '25', '317', NULL, NULL),
(394, 'GUACHUCAL', 'Nariño', 17, '52', '317', NULL, NULL),
(395, 'GUADALAJARA DE BUGA', 'Valle del Cauca', 24, '76', '111', NULL, NULL),
(396, 'GUADALUPE', 'Antioquia', 1, '05', '315', NULL, NULL),
(397, 'GUADALUPE', 'Huila', 13, '41', '319', NULL, NULL),
(398, 'GUADALUPE', 'Santander', 21, '68', '320', NULL, NULL),
(399, 'GUADUAS', 'Cundinamarca', 11, '25', '320', NULL, NULL),
(400, 'GUAITARILLA', 'Nariño', 17, '52', '320', NULL, NULL),
(401, 'GUALMATÁN', 'Nariño', 17, '52', '323', NULL, NULL),
(402, 'GUAMAL', 'Magdalena', 15, '47', '318', NULL, NULL),
(403, 'GUAMAL', 'Meta', 16, '50', '318', NULL, NULL),
(404, 'GUAMO', 'Tolima', 23, '73', '319', NULL, NULL),
(405, 'GUAPI', 'Cauca', 8, '19', '318', NULL, NULL),
(406, 'GUAPOTÁ', 'Santander', 21, '68', '322', NULL, NULL),
(407, 'GUARANDA', 'Sucre', 22, '70', '265', NULL, NULL),
(408, 'GUARNE', 'Antioquia', 1, '05', '318', NULL, NULL),
(409, 'GUASCA', 'Cundinamarca', 11, '25', '322', NULL, NULL),
(410, 'GUATAPÉ', 'Antioquia', 1, '05', '321', NULL, NULL),
(411, 'GUATAQUÍ', 'Cundinamarca', 11, '25', '324', NULL, NULL),
(412, 'GUATAVITA', 'Cundinamarca', 11, '25', '326', NULL, NULL),
(413, 'GUATEQUE', 'Boyacá', 5, '15', '322', NULL, NULL),
(414, 'GUÁTICA', 'Risaralda', 20, '66', '318', NULL, NULL),
(415, 'GUAVATÁ', 'Santander', 21, '68', '324', NULL, NULL),
(416, 'GUAYABAL DE SIQUIMA', 'Cundinamarca', 11, '25', '328', NULL, NULL),
(417, 'GUAYABETAL', 'Cundinamarca', 11, '25', '335', NULL, NULL),
(418, 'GUAYATÁ', 'Boyacá', 5, '15', '325', NULL, NULL),
(419, 'GÜEPSA', 'Santander', 21, '68', '327', NULL, NULL),
(420, 'GÜICÁN', 'Boyacá', 5, '15', '332', NULL, NULL),
(421, 'GUTIÉRREZ', 'Cundinamarca', 11, '25', '339', NULL, NULL),
(422, 'HACARÍ', 'Norte de Santander', 18, '54', '344', NULL, NULL),
(423, 'HATILLO DE LOBA', 'Bolívar', 4, '13', '300', NULL, NULL),
(424, 'HATO', 'Santander', 21, '68', '344', NULL, NULL),
(425, 'HATO COROZAL', 'Casanare', 26, '85', '125', NULL, NULL),
(426, 'HATONUEVO', 'La Guajira', 14, '44', '378', NULL, NULL),
(427, 'HELICONIA', 'Antioquia', 1, '05', '347', NULL, NULL),
(428, 'HERRÁN', 'Norte de Santander', 18, '54', '347', NULL, NULL),
(429, 'HERVEO', 'Tolima', 23, '73', '347', NULL, NULL),
(430, 'HISPANIA', 'Antioquia', 1, '05', '353', NULL, NULL),
(431, 'HOBO', 'Huila', 13, '41', '349', NULL, NULL),
(432, 'HONDA', 'Tolima', 23, '73', '349', NULL, NULL),
(433, 'IBAGUÉ', 'Tolima', 23, '73', '001', NULL, NULL),
(434, 'ICONONZO', 'Tolima', 23, '73', '352', NULL, NULL),
(435, 'ILES', 'Nariño', 17, '52', '352', NULL, NULL),
(436, 'IMUÉS', 'Nariño', 17, '52', '354', NULL, NULL),
(437, 'INÍRIDA', 'Guainía', 30, '94', '001', NULL, NULL),
(438, 'INZÁ', 'Cauca', 8, '19', '355', NULL, NULL),
(439, 'IPIALES', 'Nariño', 17, '52', '356', NULL, NULL),
(440, 'IQUIRA', 'Huila', 13, '41', '357', NULL, NULL),
(441, 'ISNOS', 'Huila', 13, '41', '359', NULL, NULL),
(442, 'ISTMINA', 'Chocó', 12, '27', '361', NULL, NULL),
(443, 'ITAGUI', 'Antioquia', 1, '05', '360', NULL, NULL),
(444, 'ITUANGO', 'Antioquia', 1, '05', '361', NULL, NULL),
(445, 'IZA', 'Boyacá', 5, '15', '362', NULL, NULL),
(446, 'JAMBALÓ', 'Cauca', 8, '19', '364', NULL, NULL),
(447, 'JAMUNDÍ', 'Valle del Cauca', 24, '76', '364', NULL, NULL),
(448, 'JARDÍN', 'Antioquia', 1, '05', '364', NULL, NULL),
(449, 'JENESANO', 'Boyacá', 5, '15', '367', NULL, NULL),
(450, 'JERICÓ', 'Antioquia', 1, '05', '368', NULL, NULL),
(451, 'JERICÓ', 'Boyacá', 5, '15', '368', NULL, NULL),
(452, 'JERUSALÉN', 'Cundinamarca', 11, '25', '368', NULL, NULL),
(453, 'JESÚS MARÍA', 'Santander', 21, '68', '368', NULL, NULL),
(454, 'JORDÁN', 'Santander', 21, '68', '370', NULL, NULL),
(455, 'JUAN DE ACOSTA', 'Atlántico', 2, '08', '372', NULL, NULL),
(456, 'JUNÍN', 'Cundinamarca', 11, '25', '372', NULL, NULL),
(457, 'JURADÓ', 'Chocó', 12, '27', '372', NULL, NULL),
(458, 'LA APARTADA', 'Córdoba', 10, '23', '350', NULL, NULL),
(459, 'LA ARGENTINA', 'Huila', 13, '41', '378', NULL, NULL),
(460, 'LA BELLEZA', 'Santander', 21, '68', '377', NULL, NULL),
(461, 'LA CALERA', 'Cundinamarca', 11, '25', '377', NULL, NULL),
(462, 'LA CAPILLA', 'Boyacá', 5, '15', '380', NULL, NULL),
(463, 'LA CEJA', 'Antioquia', 1, '05', '376', NULL, NULL),
(464, 'LA CELIA', 'Risaralda', 20, '66', '383', NULL, NULL),
(465, 'LA CHORRERA', 'Amazonas', 29, '91', '405', NULL, NULL),
(466, 'LA CRUZ', 'Nariño', 17, '52', '378', NULL, NULL),
(467, 'LA CUMBRE', 'Valle del Cauca', 24, '76', '377', NULL, NULL),
(468, 'LA DORADA', 'Caldas', 6, '17', '380', NULL, NULL),
(469, 'LA ESPERANZA', 'Norte de Santander', 18, '54', '385', NULL, NULL),
(470, 'LA ESTRELLA', 'Antioquia', 1, '05', '380', NULL, NULL),
(471, 'LA FLORIDA', 'Nariño', 17, '52', '381', NULL, NULL),
(472, 'LA GLORIA', 'Cesar', 9, '20', '383', NULL, NULL),
(473, 'LA GUADALUPE', 'Guainía', 30, '94', '885', NULL, NULL),
(474, 'LA JAGUA DE IBIRICO', 'Cesar', 9, '20', '400', NULL, NULL),
(475, 'LA JAGUA DEL PILAR', 'La Guajira', 14, '44', '420', NULL, NULL),
(476, 'LA LLANADA', 'Nariño', 17, '52', '385', NULL, NULL),
(477, 'LA MACARENA', 'Meta', 16, '50', '350', NULL, NULL),
(478, 'LA MERCED', 'Caldas', 6, '17', '388', NULL, NULL),
(479, 'LA MESA', 'Cundinamarca', 11, '25', '386', NULL, NULL),
(480, 'LA MONTAÑITA', 'Caquetá', 7, '18', '410', NULL, NULL),
(481, 'LA PALMA', 'Cundinamarca', 11, '25', '394', NULL, NULL),
(482, 'LA PAZ', 'Cesar', 9, '20', '621', NULL, NULL),
(483, 'LA PAZ', 'Santander', 21, '68', '397', NULL, NULL),
(484, 'LA PEDRERA', 'Amazonas', 29, '91', '407', NULL, NULL),
(485, 'LA PEÑA', 'Cundinamarca', 11, '25', '398', NULL, NULL),
(486, 'LA PINTADA', 'Antioquia', 1, '05', '390', NULL, NULL),
(487, 'LA PLATA', 'Huila', 13, '41', '396', NULL, NULL),
(488, 'LA PLAYA', 'Norte de Santander', 18, '54', '398', NULL, NULL),
(489, 'LA PRIMAVERA', 'Vichada', 33, '99', '524', NULL, NULL),
(490, 'LA SALINA', 'Casanare', 26, '85', '136', NULL, NULL),
(491, 'LA SIERRA', 'Cauca', 8, '19', '392', NULL, NULL),
(492, 'LA TEBAIDA', 'Quindio', 19, '63', '401', NULL, NULL),
(493, 'LA TOLA', 'Nariño', 17, '52', '390', NULL, NULL),
(494, 'LA UNIÓN', 'Antioquia', 1, '05', '400', NULL, NULL),
(495, 'LA UNIÓN', 'Nariño', 17, '52', '399', NULL, NULL),
(496, 'LA UNIÓN', 'Sucre', 22, '70', '400', NULL, NULL),
(497, 'LA UNIÓN', 'Valle del Cauca', 24, '76', '400', NULL, NULL),
(498, 'LA UVITA', 'Boyacá', 5, '15', '403', NULL, NULL),
(499, 'LA VEGA', 'Cauca', 8, '19', '397', NULL, NULL),
(500, 'LA VEGA', 'Cundinamarca', 11, '25', '402', NULL, NULL),
(501, 'LA VICTORIA', 'Boyacá', 5, '15', '401', NULL, NULL),
(502, 'LA VICTORIA', 'Valle del Cauca', 24, '76', '403', NULL, NULL),
(503, 'LA VICTORIA', 'Amazonas', 29, '91', '430', NULL, NULL),
(504, 'LA VIRGINIA', 'Risaralda', 20, '66', '400', NULL, NULL),
(505, 'LABATECA', 'Norte de Santander', 18, '54', '377', NULL, NULL),
(506, 'LABRANZAGRANDE', 'Boyacá', 5, '15', '377', NULL, NULL),
(507, 'LANDÁZURI', 'Santander', 21, '68', '385', NULL, NULL),
(508, 'LEBRÍJA', 'Santander', 21, '68', '406', NULL, NULL),
(509, 'LEGUÍZAMO', 'Putumayo', 27, '86', '573', NULL, NULL),
(510, 'LEIVA', 'Nariño', 17, '52', '405', NULL, NULL),
(511, 'LEJANÍAS', 'Meta', 16, '50', '400', NULL, NULL),
(512, 'LENGUAZAQUE', 'Cundinamarca', 11, '25', '407', NULL, NULL),
(513, 'LÉRIDA', 'Tolima', 23, '73', '408', NULL, NULL),
(514, 'LETICIA', 'Amazonas', 29, '91', '001', NULL, NULL),
(515, 'LÍBANO', 'Tolima', 23, '73', '411', NULL, NULL),
(516, 'LIBORINA', 'Antioquia', 1, '05', '411', NULL, NULL),
(517, 'LINARES', 'Nariño', 17, '52', '411', NULL, NULL),
(518, 'LLORÓ', 'Chocó', 12, '27', '413', NULL, NULL),
(519, 'LÓPEZ', 'Cauca', 8, '19', '418', NULL, NULL),
(520, 'LORICA', 'Córdoba', 10, '23', '417', NULL, NULL),
(521, 'LOS ANDES', 'Nariño', 17, '52', '418', NULL, NULL),
(522, 'LOS CÓRDOBAS', 'Córdoba', 10, '23', '419', NULL, NULL),
(523, 'LOS PALMITOS', 'Sucre', 22, '70', '418', NULL, NULL),
(524, 'LOS PATIOS', 'Norte de Santander', 18, '54', '405', NULL, NULL),
(525, 'LOS SANTOS', 'Santander', 21, '68', '418', NULL, NULL),
(526, 'LOURDES', 'Norte de Santander', 18, '54', '418', NULL, NULL),
(527, 'LURUACO', 'Atlántico', 2, '08', '421', NULL, NULL),
(528, 'MACANAL', 'Boyacá', 5, '15', '425', NULL, NULL),
(529, 'MACARAVITA', 'Santander', 21, '68', '425', NULL, NULL),
(530, 'MACEO', 'Antioquia', 1, '05', '425', NULL, NULL),
(531, 'MACHETA', 'Cundinamarca', 11, '25', '426', NULL, NULL),
(532, 'MADRID', 'Cundinamarca', 11, '25', '430', NULL, NULL),
(533, 'MAGANGUÉ', 'Bolívar', 4, '13', '430', NULL, NULL),
(534, 'MAGÜÍ', 'Nariño', 17, '52', '427', NULL, NULL),
(535, 'MAHATES', 'Bolívar', 4, '13', '433', NULL, NULL),
(536, 'MAICAO', 'La Guajira', 14, '44', '430', NULL, NULL),
(537, 'MAJAGUAL', 'Sucre', 22, '70', '429', NULL, NULL),
(538, 'MÁLAGA', 'Santander', 21, '68', '432', NULL, NULL),
(539, 'MALAMBO', 'Atlántico', 2, '08', '433', NULL, NULL),
(540, 'MALLAMA', 'Nariño', 17, '52', '435', NULL, NULL),
(541, 'MANATÍ', 'Atlántico', 2, '08', '436', NULL, NULL),
(542, 'MANAURE', 'Cesar', 9, '20', '443', NULL, NULL),
(543, 'MANAURE', 'La Guajira', 14, '44', '560', NULL, NULL),
(544, 'MANÍ', 'Casanare', 26, '85', '139', NULL, NULL),
(545, 'MANIZALES', 'Caldas', 6, '17', '001', NULL, NULL),
(546, 'MANTA', 'Cundinamarca', 11, '25', '436', NULL, NULL),
(547, 'MANZANARES', 'Caldas', 6, '17', '433', NULL, NULL),
(548, 'MAPIRIPÁN', 'Meta', 16, '50', '325', NULL, NULL),
(549, 'MAPIRIPANA', 'Guainía', 30, '94', '663', NULL, NULL),
(550, 'MARGARITA', 'Bolívar', 4, '13', '440', NULL, NULL),
(551, 'MARÍA LA BAJA', 'Bolívar', 4, '13', '442', NULL, NULL),
(552, 'MARINILLA', 'Antioquia', 1, '05', '440', NULL, NULL),
(553, 'MARIPÍ', 'Boyacá', 5, '15', '442', NULL, NULL),
(554, 'MARIQUITA', 'Tolima', 23, '73', '443', NULL, NULL),
(555, 'MARMATO', 'Caldas', 6, '17', '442', NULL, NULL),
(556, 'MARQUETALIA', 'Caldas', 6, '17', '444', NULL, NULL),
(557, 'MARSELLA', 'Risaralda', 20, '66', '440', NULL, NULL),
(558, 'MARULANDA', 'Caldas', 6, '17', '446', NULL, NULL),
(559, 'MATANZA', 'Santander', 21, '68', '444', NULL, NULL),
(560, 'MEDELLÍN', 'Antioquia', 1, '05', '001', NULL, NULL),
(561, 'MEDINA', 'Cundinamarca', 11, '25', '438', NULL, NULL),
(562, 'MEDIO ATRATO', 'Chocó', 12, '27', '425', NULL, NULL),
(563, 'MEDIO BAUDÓ', 'Chocó', 12, '27', '430', NULL, NULL),
(564, 'MEDIO SAN JUAN', 'Chocó', 12, '27', '450', NULL, NULL),
(565, 'MELGAR', 'Tolima', 23, '73', '449', NULL, NULL),
(566, 'MERCADERES', 'Cauca', 8, '19', '450', NULL, NULL),
(567, 'MESETAS', 'Meta', 16, '50', '330', NULL, NULL),
(568, 'MILÁN', 'Caquetá', 7, '18', '460', NULL, NULL),
(569, 'MIRAFLORES', 'Boyacá', 5, '15', '455', NULL, NULL),
(570, 'MIRAFLORES', 'Guaviare', 31, '95', '200', NULL, NULL),
(571, 'MIRANDA', 'Cauca', 8, '19', '455', NULL, NULL),
(572, 'MIRITI PARANÁ', 'Amazonas', 29, '91', '460', NULL, NULL),
(573, 'MISTRATÓ', 'Risaralda', 20, '66', '456', NULL, NULL),
(574, 'MITÚ', 'Vaupés', 32, '97', '001', NULL, NULL),
(575, 'MOCOA', 'Putumayo', 27, '86', '001', NULL, NULL),
(576, 'MOGOTES', 'Santander', 21, '68', '464', NULL, NULL),
(577, 'MOLAGAVITA', 'Santander', 21, '68', '468', NULL, NULL),
(578, 'MOMIL', 'Córdoba', 10, '23', '464', NULL, NULL),
(579, 'MOMPÓS', 'Bolívar', 4, '13', '468', NULL, NULL),
(580, 'MONGUA', 'Boyacá', 5, '15', '464', NULL, NULL),
(581, 'MONGUÍ', 'Boyacá', 5, '15', '466', NULL, NULL),
(582, 'MONIQUIRÁ', 'Boyacá', 5, '15', '469', NULL, NULL),
(583, 'MOÑITOS', 'Córdoba', 10, '23', '500', NULL, NULL),
(584, 'MONTEBELLO', 'Antioquia', 1, '05', '467', NULL, NULL),
(585, 'MONTECRISTO', 'Bolívar', 4, '13', '458', NULL, NULL),
(586, 'MONTELÍBANO', 'Córdoba', 10, '23', '466', NULL, NULL),
(587, 'MONTENEGRO', 'Quindio', 19, '63', '470', NULL, NULL),
(588, 'MONTERÍA', 'Córdoba', 10, '23', '001', NULL, NULL),
(589, 'MONTERREY', 'Casanare', 26, '85', '162', NULL, NULL),
(590, 'MORALES', 'Bolívar', 4, '13', '473', NULL, NULL),
(591, 'MORALES', 'Cauca', 8, '19', '473', NULL, NULL),
(592, 'MORELIA', 'Caquetá', 7, '18', '479', NULL, NULL),
(593, 'MORICHAL', 'Guainía', 30, '94', '888', NULL, NULL),
(594, 'MORROA', 'Sucre', 22, '70', '473', NULL, NULL),
(595, 'MOSQUERA', 'Cundinamarca', 11, '25', '473', NULL, NULL),
(596, 'MOSQUERA', 'Nariño', 17, '52', '473', NULL, NULL),
(597, 'MOTAVITA', 'Boyacá', 5, '15', '476', NULL, NULL),
(598, 'MURILLO', 'Tolima', 23, '73', '461', NULL, NULL),
(599, 'MURINDÓ', 'Antioquia', 1, '05', '475', NULL, NULL),
(600, 'MUTATÁ', 'Antioquia', 1, '05', '480', NULL, NULL),
(601, 'MUTISCUA', 'Norte de Santander', 18, '54', '480', NULL, NULL),
(602, 'MUZO', 'Boyacá', 5, '15', '480', NULL, NULL),
(603, 'NARIÑO', 'Antioquia', 1, '05', '483', NULL, NULL),
(604, 'NARIÑO', 'Cundinamarca', 11, '25', '483', NULL, NULL),
(605, 'NARIÑO', 'Nariño', 17, '52', '480', NULL, NULL),
(606, 'NÁTAGA', 'Huila', 13, '41', '483', NULL, NULL),
(607, 'NATAGAIMA', 'Tolima', 23, '73', '483', NULL, NULL),
(608, 'NECHÍ', 'Antioquia', 1, '05', '495', NULL, NULL),
(609, 'NECOCLÍ', 'Antioquia', 1, '05', '490', NULL, NULL),
(610, 'NEIRA', 'Caldas', 6, '17', '486', NULL, NULL),
(611, 'NEIVA', 'Huila', 13, '41', '001', NULL, NULL),
(612, 'NEMOCÓN', 'Cundinamarca', 11, '25', '486', NULL, NULL),
(613, 'NILO', 'Cundinamarca', 11, '25', '488', NULL, NULL),
(614, 'NIMAIMA', 'Cundinamarca', 11, '25', '489', NULL, NULL),
(615, 'NOBSA', 'Boyacá', 5, '15', '491', NULL, NULL),
(616, 'NOCAIMA', 'Cundinamarca', 11, '25', '491', NULL, NULL),
(617, 'NORCASIA', 'Caldas', 6, '17', '495', NULL, NULL),
(618, 'NOROSÍ', 'Bolívar', 4, '13', '490', NULL, NULL),
(619, 'NÓVITA', 'Chocó', 12, '27', '491', NULL, NULL),
(620, 'NUEVA GRANADA', 'Magdalena', 15, '47', '460', NULL, NULL),
(621, 'NUEVO COLÓN', 'Boyacá', 5, '15', '494', NULL, NULL),
(622, 'NUNCHÍA', 'Casanare', 26, '85', '225', NULL, NULL),
(623, 'NUQUÍ', 'Chocó', 12, '27', '495', NULL, NULL),
(624, 'OBANDO', 'Valle del Cauca', 24, '76', '497', NULL, NULL),
(625, 'OCAMONTE', 'Santander', 21, '68', '498', NULL, NULL),
(626, 'OCAÑA', 'Norte de Santander', 18, '54', '498', NULL, NULL),
(627, 'OIBA', 'Santander', 21, '68', '500', NULL, NULL),
(628, 'OICATÁ', 'Boyacá', 5, '15', '500', NULL, NULL),
(629, 'OLAYA', 'Antioquia', 1, '05', '501', NULL, NULL),
(630, 'OLAYA HERRERA', 'Nariño', 17, '52', '490', NULL, NULL),
(631, 'ONZAGA', 'Santander', 21, '68', '502', NULL, NULL),
(632, 'OPORAPA', 'Huila', 13, '41', '503', NULL, NULL),
(633, 'ORITO', 'Putumayo', 27, '86', '320', NULL, NULL),
(634, 'OROCUÉ', 'Casanare', 26, '85', '230', NULL, NULL),
(635, 'ORTEGA', 'Tolima', 23, '73', '504', NULL, NULL),
(636, 'OSPINA', 'Nariño', 17, '52', '506', NULL, NULL),
(637, 'OTANCHE', 'Boyacá', 5, '15', '507', NULL, NULL),
(638, 'OVEJAS', 'Sucre', 22, '70', '508', NULL, NULL),
(639, 'PACHAVITA', 'Boyacá', 5, '15', '511', NULL, NULL),
(640, 'PACHO', 'Cundinamarca', 11, '25', '513', NULL, NULL),
(641, 'PACOA', 'Vaupés', 32, '97', '511', NULL, NULL),
(642, 'PÁCORA', 'Caldas', 6, '17', '513', NULL, NULL),
(643, 'PADILLA', 'Cauca', 8, '19', '513', NULL, NULL),
(644, 'PAEZ', 'Cauca', 8, '19', '517', NULL, NULL),
(645, 'PÁEZ', 'Boyacá', 5, '15', '514', NULL, NULL),
(646, 'PAICOL', 'Huila', 13, '41', '518', NULL, NULL),
(647, 'PAILITAS', 'Cesar', 9, '20', '517', NULL, NULL),
(648, 'PAIME', 'Cundinamarca', 11, '25', '518', NULL, NULL),
(649, 'PAIPA', 'Boyacá', 5, '15', '516', NULL, NULL),
(650, 'PAJARITO', 'Boyacá', 5, '15', '518', NULL, NULL),
(651, 'PALERMO', 'Huila', 13, '41', '524', NULL, NULL),
(652, 'PALESTINA', 'Caldas', 6, '17', '524', NULL, NULL),
(653, 'PALESTINA', 'Huila', 13, '41', '530', NULL, NULL),
(654, 'PALMAR', 'Santander', 21, '68', '522', NULL, NULL),
(655, 'PALMAR DE VARELA', 'Atlántico', 2, '08', '520', NULL, NULL),
(656, 'PALMAS DEL SOCORRO', 'Santander', 21, '68', '524', NULL, NULL),
(657, 'PALMIRA', 'Valle del Cauca', 24, '76', '520', NULL, NULL),
(658, 'PALMITO', 'Sucre', 22, '70', '523', NULL, NULL),
(659, 'PALOCABILDO', 'Tolima', 23, '73', '520', NULL, NULL),
(660, 'PAMPLONA', 'Norte de Santander', 18, '54', '518', NULL, NULL),
(661, 'PAMPLONITA', 'Norte de Santander', 18, '54', '520', NULL, NULL),
(662, 'PANA PANA', 'Guainía', 30, '94', '887', NULL, NULL),
(663, 'PANDI', 'Cundinamarca', 11, '25', '524', NULL, NULL),
(664, 'PANQUEBA', 'Boyacá', 5, '15', '522', NULL, NULL),
(665, 'PAPUNAUA', 'Vaupés', 32, '97', '777', NULL, NULL),
(666, 'PÁRAMO', 'Santander', 21, '68', '533', NULL, NULL),
(667, 'PARATEBUENO', 'Cundinamarca', 11, '25', '530', NULL, NULL),
(668, 'PASCA', 'Cundinamarca', 11, '25', '535', NULL, NULL),
(669, 'PASTO', 'Nariño', 17, '52', '001', NULL, NULL),
(670, 'PATÍA', 'Cauca', 8, '19', '532', NULL, NULL),
(671, 'PAUNA', 'Boyacá', 5, '15', '531', NULL, NULL),
(672, 'PAYA', 'Boyacá', 5, '15', '533', NULL, NULL),
(673, 'PAZ DE ARIPORO', 'Casanare', 26, '85', '250', NULL, NULL),
(674, 'PAZ DE RÍO', 'Boyacá', 5, '15', '537', NULL, NULL),
(675, 'PEDRAZA', 'Magdalena', 15, '47', '541', NULL, NULL),
(676, 'PELAYA', 'Cesar', 9, '20', '550', NULL, NULL),
(677, 'PEÑOL', 'Antioquia', 1, '05', '541', NULL, NULL),
(678, 'PENSILVANIA', 'Caldas', 6, '17', '541', NULL, NULL),
(679, 'PEQUE', 'Antioquia', 1, '05', '543', NULL, NULL),
(680, 'PEREIRA', 'Risaralda', 20, '66', '001', NULL, NULL),
(681, 'PESCA', 'Boyacá', 5, '15', '542', NULL, NULL),
(682, 'PIAMONTE', 'Cauca', 8, '19', '533', NULL, NULL),
(683, 'PIEDECUESTA', 'Santander', 21, '68', '547', NULL, NULL),
(684, 'PIEDRAS', 'Tolima', 23, '73', '547', NULL, NULL),
(685, 'PIENDAMÓ', 'Cauca', 8, '19', '548', NULL, NULL),
(686, 'PIJAO', 'Quindio', 19, '63', '548', NULL, NULL),
(687, 'PIJIÑO DEL CARMEN', 'Magdalena', 15, '47', '545', NULL, NULL),
(688, 'PINCHOTE', 'Santander', 21, '68', '549', NULL, NULL),
(689, 'PINILLOS', 'Bolívar', 4, '13', '549', NULL, NULL),
(690, 'PIOJÓ', 'Atlántico', 2, '08', '549', NULL, NULL),
(691, 'PISBA', 'Boyacá', 5, '15', '550', NULL, NULL),
(692, 'PITAL', 'Huila', 13, '41', '548', NULL, NULL),
(693, 'PITALITO', 'Huila', 13, '41', '551', NULL, NULL),
(694, 'PIVIJAY', 'Magdalena', 15, '47', '551', NULL, NULL),
(695, 'PLANADAS', 'Tolima', 23, '73', '555', NULL, NULL),
(696, 'PLANETA RICA', 'Córdoba', 10, '23', '555', NULL, NULL),
(697, 'PLATO', 'Magdalena', 15, '47', '555', NULL, NULL),
(698, 'POLICARPA', 'Nariño', 17, '52', '540', NULL, NULL),
(699, 'POLONUEVO', 'Atlántico', 2, '08', '558', NULL, NULL),
(700, 'PONEDERA', 'Atlántico', 2, '08', '560', NULL, NULL),
(701, 'POPAYÁN', 'Cauca', 8, '19', '001', NULL, NULL),
(702, 'PORE', 'Casanare', 26, '85', '263', NULL, NULL),
(703, 'POTOSÍ', 'Nariño', 17, '52', '560', NULL, NULL),
(704, 'PRADERA', 'Valle del Cauca', 24, '76', '563', NULL, NULL),
(705, 'PRADO', 'Tolima', 23, '73', '563', NULL, NULL),
(706, 'PROVIDENCIA', 'Nariño', 17, '52', '565', NULL, NULL),
(707, 'PROVIDENCIA', 'Archipiélago de San Andrés,', 28, '88', '564', NULL, NULL),
(708, 'PUEBLO BELLO', 'Cesar', 9, '20', '570', NULL, NULL),
(709, 'PUEBLO NUEVO', 'Córdoba', 10, '23', '570', NULL, NULL),
(710, 'PUEBLO RICO', 'Risaralda', 20, '66', '572', NULL, NULL),
(711, 'PUEBLORRICO', 'Antioquia', 1, '05', '576', NULL, NULL),
(712, 'PUEBLOVIEJO', 'Magdalena', 15, '47', '570', NULL, NULL),
(713, 'PUENTE NACIONAL', 'Santander', 21, '68', '572', NULL, NULL),
(714, 'PUERRES', 'Nariño', 17, '52', '573', NULL, NULL),
(715, 'PUERTO ALEGRÍA', 'Amazonas', 29, '91', '530', NULL, NULL),
(716, 'PUERTO ARICA', 'Amazonas', 29, '91', '536', NULL, NULL),
(717, 'PUERTO ASÍS', 'Putumayo', 27, '86', '568', NULL, NULL),
(718, 'PUERTO BERRÍO', 'Antioquia', 1, '05', '579', NULL, NULL),
(719, 'PUERTO BOYACÁ', 'Boyacá', 5, '15', '572', NULL, NULL),
(720, 'PUERTO CAICEDO', 'Putumayo', 27, '86', '569', NULL, NULL),
(721, 'PUERTO CARREÑO', 'Vichada', 33, '99', '001', NULL, NULL),
(722, 'PUERTO COLOMBIA', 'Atlántico', 2, '08', '573', NULL, NULL),
(723, 'PUERTO COLOMBIA', 'Guainía', 30, '94', '884', NULL, NULL),
(724, 'PUERTO CONCORDIA', 'Meta', 16, '50', '450', NULL, NULL),
(725, 'PUERTO ESCONDIDO', 'Córdoba', 10, '23', '574', NULL, NULL),
(726, 'PUERTO GAITÁN', 'Meta', 16, '50', '568', NULL, NULL),
(727, 'PUERTO GUZMÁN', 'Putumayo', 27, '86', '571', NULL, NULL),
(728, 'PUERTO LIBERTADOR', 'Córdoba', 10, '23', '580', NULL, NULL),
(729, 'PUERTO LLERAS', 'Meta', 16, '50', '577', NULL, NULL),
(730, 'PUERTO LÓPEZ', 'Meta', 16, '50', '573', NULL, NULL),
(731, 'PUERTO NARE', 'Antioquia', 1, '05', '585', NULL, NULL),
(732, 'PUERTO NARIÑO', 'Amazonas', 29, '91', '540', NULL, NULL),
(733, 'PUERTO PARRA', 'Santander', 21, '68', '573', NULL, NULL),
(734, 'PUERTO RICO', 'Caquetá', 7, '18', '592', NULL, NULL),
(735, 'PUERTO RICO', 'Meta', 16, '50', '590', NULL, NULL),
(736, 'PUERTO RONDÓN', 'Arauca', 25, '81', '591', NULL, NULL),
(737, 'PUERTO SALGAR', 'Cundinamarca', 11, '25', '572', NULL, NULL),
(738, 'PUERTO SANTANDER', 'Norte de Santander', 18, '54', '553', NULL, NULL),
(739, 'PUERTO SANTANDER', 'Amazonas', 29, '91', '669', NULL, NULL),
(740, 'PUERTO TEJADA', 'Cauca', 8, '19', '573', NULL, NULL),
(741, 'PUERTO TRIUNFO', 'Antioquia', 1, '05', '591', NULL, NULL),
(742, 'PUERTO WILCHES', 'Santander', 21, '68', '575', NULL, NULL),
(743, 'PULÍ', 'Cundinamarca', 11, '25', '580', NULL, NULL),
(744, 'PUPIALES', 'Nariño', 17, '52', '585', NULL, NULL),
(745, 'PURACÉ', 'Cauca', 8, '19', '585', NULL, NULL),
(746, 'PURIFICACIÓN', 'Tolima', 23, '73', '585', NULL, NULL),
(747, 'PURÍSIMA', 'Córdoba', 10, '23', '586', NULL, NULL),
(748, 'QUEBRADANEGRA', 'Cundinamarca', 11, '25', '592', NULL, NULL),
(749, 'QUETAME', 'Cundinamarca', 11, '25', '594', NULL, NULL),
(750, 'QUIBDÓ', 'Chocó', 12, '27', '001', NULL, NULL),
(751, 'QUIMBAYA', 'Quindio', 19, '63', '594', NULL, NULL),
(752, 'QUINCHÍA', 'Risaralda', 20, '66', '594', NULL, NULL),
(753, 'QUÍPAMA', 'Boyacá', 5, '15', '580', NULL, NULL),
(754, 'QUIPILE', 'Cundinamarca', 11, '25', '596', NULL, NULL),
(755, 'RAGONVALIA', 'Norte de Santander', 18, '54', '599', NULL, NULL),
(756, 'RAMIRIQUÍ', 'Boyacá', 5, '15', '599', NULL, NULL),
(757, 'RÁQUIRA', 'Boyacá', 5, '15', '600', NULL, NULL),
(758, 'RECETOR', 'Casanare', 26, '85', '279', NULL, NULL),
(759, 'REGIDOR', 'Bolívar', 4, '13', '580', NULL, NULL),
(760, 'REMEDIOS', 'Antioquia', 1, '05', '604', NULL, NULL),
(761, 'REMOLINO', 'Magdalena', 15, '47', '605', NULL, NULL),
(762, 'REPELÓN', 'Atlántico', 2, '08', '606', NULL, NULL),
(763, 'RESTREPO', 'Meta', 16, '50', '606', NULL, NULL),
(764, 'RESTREPO', 'Valle del Cauca', 24, '76', '606', NULL, NULL),
(765, 'RETIRO', 'Antioquia', 1, '05', '607', NULL, NULL),
(766, 'RICAURTE', 'Cundinamarca', 11, '25', '612', NULL, NULL),
(767, 'RICAURTE', 'Nariño', 17, '52', '612', NULL, NULL),
(768, 'RÍO DE ORO', 'Cesar', 9, '20', '614', NULL, NULL),
(769, 'RÍO IRO', 'Chocó', 12, '27', '580', NULL, NULL),
(770, 'RÍO QUITO', 'Chocó', 12, '27', '600', NULL, NULL),
(771, 'RÍO VIEJO', 'Bolívar', 4, '13', '600', NULL, NULL),
(772, 'RIOBLANCO', 'Tolima', 23, '73', '616', NULL, NULL),
(773, 'RIOFRÍO', 'Valle del Cauca', 24, '76', '616', NULL, NULL),
(774, 'RIOHACHA', 'La Guajira', 14, '44', '001', NULL, NULL),
(775, 'RIONEGRO', 'Antioquia', 1, '05', '615', NULL, NULL),
(776, 'RIONEGRO', 'Santander', 21, '68', '615', NULL, NULL),
(777, 'RIOSUCIO', 'Caldas', 6, '17', '614', NULL, NULL),
(778, 'RIOSUCIO', 'Chocó', 12, '27', '615', NULL, NULL),
(779, 'RISARALDA', 'Caldas', 6, '17', '616', NULL, NULL),
(780, 'RIVERA', 'Huila', 13, '41', '615', NULL, NULL),
(781, 'ROBERTO PAYÁN', 'Nariño', 17, '52', '621', NULL, NULL),
(782, 'ROLDANILLO', 'Valle del Cauca', 24, '76', '622', NULL, NULL),
(783, 'RONCESVALLES', 'Tolima', 23, '73', '622', NULL, NULL),
(784, 'RONDÓN', 'Boyacá', 5, '15', '621', NULL, NULL),
(785, 'ROSAS', 'Cauca', 8, '19', '622', NULL, NULL),
(786, 'ROVIRA', 'Tolima', 23, '73', '624', NULL, NULL),
(787, 'SABANA DE TORRES', 'Santander', 21, '68', '655', NULL, NULL),
(788, 'SABANAGRANDE', 'Atlántico', 2, '08', '634', NULL, NULL),
(789, 'SABANALARGA', 'Antioquia', 1, '05', '628', NULL, NULL),
(790, 'SABANALARGA', 'Atlántico', 2, '08', '638', NULL, NULL),
(791, 'SABANALARGA', 'Casanare', 26, '85', '300', NULL, NULL),
(792, 'SABANAS DE SAN ANGEL', 'Magdalena', 15, '47', '660', NULL, NULL),
(793, 'SABANETA', 'Antioquia', 1, '05', '631', NULL, NULL),
(794, 'SABOYÁ', 'Boyacá', 5, '15', '632', NULL, NULL),
(795, 'SÁCAMA', 'Casanare', 26, '85', '315', NULL, NULL),
(796, 'SÁCHICA', 'Boyacá', 5, '15', '638', NULL, NULL),
(797, 'SAHAGÚN', 'Córdoba', 10, '23', '660', NULL, NULL),
(798, 'SALADOBLANCO', 'Huila', 13, '41', '660', NULL, NULL),
(799, 'SALAMINA', 'Caldas', 6, '17', '653', NULL, NULL),
(800, 'SALAMINA', 'Magdalena', 15, '47', '675', NULL, NULL),
(801, 'SALAZAR', 'Norte de Santander', 18, '54', '660', NULL, NULL),
(802, 'SALDAÑA', 'Tolima', 23, '73', '671', NULL, NULL),
(803, 'SALENTO', 'Quindio', 19, '63', '690', NULL, NULL),
(804, 'SALGAR', 'Antioquia', 1, '05', '642', NULL, NULL),
(805, 'SAMACÁ', 'Boyacá', 5, '15', '646', NULL, NULL),
(806, 'SAMANÁ', 'Caldas', 6, '17', '662', NULL, NULL),
(807, 'SAMANIEGO', 'Nariño', 17, '52', '678', NULL, NULL),
(808, 'SAMPUÉS', 'Sucre', 22, '70', '670', NULL, NULL),
(809, 'SAN AGUSTÍN', 'Huila', 13, '41', '668', NULL, NULL),
(810, 'SAN ALBERTO', 'Cesar', 9, '20', '710', NULL, NULL),
(811, 'SAN ANDRÉS', 'Antioquia', 1, '05', '647', NULL, NULL),
(812, 'SAN ANDRÉS', 'Santander', 21, '68', '669', NULL, NULL),
(813, 'SAN ANDRÉS', 'Archipiélago de San Andrés, Providencia y Santa Catalina', 28, '88', '001', NULL, NULL),
(814, 'SAN ANDRÉS DE CUERQUÍA', 'Antioquia', 1, '05', '647', NULL, NULL),
(815, 'SAN ANDRÉS DE TUMACO', 'Nariño', 17, '52', '835', NULL, NULL),
(816, 'SAN ANDRÉS SOTAVENTO', 'Córdoba', 10, '23', '670', NULL, NULL),
(817, 'SAN ANTERO', 'Córdoba', 10, '23', '672', NULL, NULL),
(818, 'SAN ANTONIO', 'Tolima', 23, '73', '675', NULL, NULL),
(819, 'SAN ANTONIO DEL TEQUENDAMA', 'Cundinamarca', 11, '25', '645', NULL, NULL),
(820, 'SAN BENITO', 'Santander', 21, '68', '673', NULL, NULL),
(821, 'SAN BENITO ABAD', 'Sucre', 22, '70', '678', NULL, NULL),
(822, 'SAN BERNARDO', 'Cundinamarca', 11, '25', '649', NULL, NULL),
(823, 'SAN BERNARDO', 'Nariño', 17, '52', '685', NULL, NULL),
(824, 'SAN BERNARDO DEL VIENTO', 'Córdoba', 10, '23', '675', NULL, NULL),
(825, 'SAN CALIXTO', 'Norte de Santander', 18, '54', '670', NULL, NULL),
(826, 'SAN CARLOS', 'Antioquia', 1, '05', '649', NULL, NULL),
(827, 'SAN CARLOS', 'Córdoba', 10, '23', '678', NULL, NULL),
(828, 'SAN CARLOS DE GUAROA', 'Meta', 16, '50', '680', NULL, NULL),
(829, 'SAN CAYETANO', 'Cundinamarca', 11, '25', '653', NULL, NULL),
(830, 'SAN CAYETANO', 'Norte de Santander', 18, '54', '673', NULL, NULL),
(831, 'SAN CRISTÓBAL', 'Bolívar', 4, '13', '620', NULL, NULL),
(832, 'SAN DIEGO', 'Cesar', 9, '20', '750', NULL, NULL),
(833, 'SAN EDUARDO', 'Boyacá', 5, '15', '660', NULL, NULL),
(834, 'SAN ESTANISLAO', 'Bolívar', 4, '13', '647', NULL, NULL),
(835, 'SAN FELIPE', 'Guainía', 30, '94', '883', NULL, NULL),
(836, 'SAN FERNANDO', 'Bolívar', 4, '13', '650', NULL, NULL),
(837, 'SAN FRANCISCO', 'Antioquia', 1, '05', '652', NULL, NULL),
(838, 'SAN FRANCISCO', 'Cundinamarca', 11, '25', '658', NULL, NULL),
(839, 'SAN FRANCISCO', 'Putumayo', 27, '86', '755', NULL, NULL),
(840, 'SAN GIL', 'Santander', 21, '68', '679', NULL, NULL),
(841, 'SAN JACINTO', 'Bolívar', 4, '13', '654', NULL, NULL),
(842, 'SAN JACINTO DEL CAUCA', 'Bolívar', 4, '13', '655', NULL, NULL),
(843, 'SAN JERÓNIMO', 'Antioquia', 1, '05', '656', NULL, NULL),
(844, 'SAN JOAQUÍN', 'Santander', 21, '68', '682', NULL, NULL),
(845, 'SAN JOSÉ', 'Caldas', 6, '17', '665', NULL, NULL),
(846, 'SAN JOSÉ DE LA MONTAÑA', 'Antioquia', 1, '05', '658', NULL, NULL),
(847, 'SAN JOSÉ DE MIRANDA', 'Santander', 21, '68', '684', NULL, NULL),
(848, 'SAN JOSÉ DE PARE', 'Boyacá', 5, '15', '664', NULL, NULL),
(849, 'SAN JOSÉ DE URÉ', 'Córdoba', 10, '23', '682', NULL, NULL),
(850, 'SAN JOSÉ DEL FRAGUA', 'Caquetá', 7, '18', '610', NULL, NULL),
(851, 'SAN JOSÉ DEL GUAVIARE', 'Guaviare', 31, '95', '001', NULL, NULL),
(852, 'SAN JOSÉ DEL PALMAR', 'Chocó', 12, '27', '660', NULL, NULL),
(853, 'SAN JUAN DE ARAMA', 'Meta', 16, '50', '683', NULL, NULL);
INSERT INTO `api_municipalities` (`id`, `name`, `department`, `department_id`, `department_code`, `code`, `created_at`, `updated_at`) VALUES
(854, 'SAN JUAN DE BETULIA', 'Sucre', 22, '70', '702', NULL, NULL),
(855, 'SAN JUAN DE RÍO SECO', 'Cundinamarca', 11, '25', '662', NULL, NULL),
(856, 'SAN JUAN DE URABÁ', 'Antioquia', 1, '05', '659', NULL, NULL),
(857, 'SAN JUAN DEL CESAR', 'La Guajira', 14, '44', '650', NULL, NULL),
(858, 'SAN JUAN NEPOMUCENO', 'Bolívar', 4, '13', '657', NULL, NULL),
(859, 'SAN JUANITO', 'Meta', 16, '50', '686', NULL, NULL),
(860, 'SAN LORENZO', 'Nariño', 17, '52', '687', NULL, NULL),
(861, 'SAN LUIS', 'Antioquia', 1, '05', '660', NULL, NULL),
(862, 'SAN LUIS', 'Tolima', 23, '73', '678', NULL, NULL),
(863, 'SAN LUIS DE GACENO', 'Boyacá', 5, '15', '667', NULL, NULL),
(864, 'SAN LUIS DE PALENQUE', 'Casanare', 26, '85', '325', NULL, NULL),
(865, 'SAN LUIS DE SINCÉ', 'Sucre', 22, '70', '742', NULL, NULL),
(866, 'SAN MARCOS', 'Sucre', 22, '70', '708', NULL, NULL),
(867, 'SAN MARTÍN', 'Cesar', 9, '20', '770', NULL, NULL),
(868, 'SAN MARTÍN', 'Meta', 16, '50', '689', NULL, NULL),
(869, 'SAN MARTÍN DE LOBA', 'Bolívar', 4, '13', '667', NULL, NULL),
(870, 'SAN MATEO', 'Boyacá', 5, '15', '673', NULL, NULL),
(871, 'SAN MIGUEL', 'Santander', 21, '68', '686', NULL, NULL),
(872, 'SAN MIGUEL', 'Putumayo', 27, '86', '757', NULL, NULL),
(873, 'SAN MIGUEL DE SEMA', 'Boyacá', 5, '15', '676', NULL, NULL),
(874, 'SAN ONOFRE', 'Sucre', 22, '70', '713', NULL, NULL),
(875, 'SAN PABLO', 'Bolívar', 4, '13', '670', NULL, NULL),
(876, 'SAN PABLO', 'Nariño', 17, '52', '693', NULL, NULL),
(877, 'SAN PABLO DE BORBUR', 'Boyacá', 5, '15', '681', NULL, NULL),
(878, 'SAN PEDRO', 'Antioquia', 1, '05', '664', NULL, NULL),
(879, 'SAN PEDRO', 'Sucre', 22, '70', '717', NULL, NULL),
(880, 'SAN PEDRO', 'Valle del Cauca', 24, '76', '670', NULL, NULL),
(881, 'SAN PEDRO DE CARTAGO', 'Nariño', 17, '52', '694', NULL, NULL),
(882, 'SAN PEDRO DE URABA', 'Antioquia', 1, '05', '665', NULL, NULL),
(883, 'SAN PELAYO', 'Córdoba', 10, '23', '686', NULL, NULL),
(884, 'SAN RAFAEL', 'Antioquia', 1, '05', '667', NULL, NULL),
(885, 'SAN ROQUE', 'Antioquia', 1, '05', '670', NULL, NULL),
(886, 'SAN SEBASTIÁN', 'Cauca', 8, '19', '693', NULL, NULL),
(887, 'SAN SEBASTIÁN DE', 'Magdalena', 15, '47', '692', NULL, NULL),
(888, 'SAN SEBASTIÁN DE BUENAVISTA', 'Magdalena', 15, '47', '692', NULL, NULL),
(889, 'SAN VICENTE', 'Antioquia', 1, '05', '674', NULL, NULL),
(890, 'SAN VICENTE DE CHUCURÍ', 'Santander', 21, '68', '689', NULL, NULL),
(891, 'SAN VICENTE DEL CAGUÁN', 'Caquetá', 7, '18', '753', NULL, NULL),
(892, 'SAN ZENÓN', 'Magdalena', 15, '47', '703', NULL, NULL),
(893, 'SANDONÁ', 'Nariño', 17, '52', '683', NULL, NULL),
(894, 'SANTA ANA', 'Magdalena', 15, '47', '707', NULL, NULL),
(895, 'SANTA BÁRBARA', 'Antioquia', 1, '05', '679', NULL, NULL),
(896, 'SANTA BÁRBARA', 'Nariño', 17, '52', '696', NULL, NULL),
(897, 'SANTA BÁRBARA', 'Santander', 21, '68', '705', NULL, NULL),
(898, 'SANTA BÁRBARA DE PINTO', 'Magdalena', 15, '47', '720', NULL, NULL),
(899, 'SANTA CATALINA', 'Bolívar', 4, '13', '673', NULL, NULL),
(900, 'SANTA HELENA DEL OPÓN', 'Santander', 21, '68', '720', NULL, NULL),
(901, 'SANTA ISABEL', 'Tolima', 23, '73', '686', NULL, NULL),
(902, 'SANTA LUCÍA', 'Atlántico', 2, '08', '675', NULL, NULL),
(903, 'SANTA MARÍA', 'Boyacá', 5, '15', '690', NULL, NULL),
(904, 'SANTA MARÍA', 'Huila', 13, '41', '676', NULL, NULL),
(905, 'SANTA MARTA', 'Magdalena', 15, '47', '001', NULL, NULL),
(906, 'SANTA ROSA', 'Bolívar', 4, '13', '683', NULL, NULL),
(907, 'SANTA ROSA', 'Cauca', 8, '19', '701', NULL, NULL),
(908, 'SANTA ROSA DE CABAL', 'Risaralda', 20, '66', '682', NULL, NULL),
(909, 'SANTA ROSA DE OSOS', 'Antioquia', 1, '05', '686', NULL, NULL),
(910, 'SANTA ROSA DE VITERBO', 'Boyacá', 5, '15', '693', NULL, NULL),
(911, 'SANTA ROSA DEL SUR', 'Bolívar', 4, '13', '688', NULL, NULL),
(912, 'SANTA ROSALÍA', 'Vichada', 33, '99', '624', NULL, NULL),
(913, 'SANTA SOFÍA', 'Boyacá', 5, '15', '696', NULL, NULL),
(914, 'SANTACRUZ', 'Nariño', 17, '52', '699', NULL, NULL),
(915, 'SANTAFÉ DE ANTIOQUIA', 'Antioquia', 1, '05', '042', NULL, NULL),
(916, 'SANTANA', 'Boyacá', 5, '15', '686', NULL, NULL),
(917, 'SANTANDER DE QUILICHAO', 'Cauca', 8, '19', '698', NULL, NULL),
(918, 'SANTIAGO', 'Norte de Santander', 18, '54', '680', NULL, NULL),
(919, 'SANTIAGO', 'Putumayo', 27, '86', '760', NULL, NULL),
(920, 'SANTIAGO DE TOLÚ', 'Sucre', 22, '70', '820', NULL, NULL),
(921, 'SANTO DOMINGO', 'Antioquia', 1, '05', '690', NULL, NULL),
(922, 'SANTO TOMÁS', 'Atlántico', 2, '08', '685', NULL, NULL),
(923, 'SANTUARIO', 'Risaralda', 20, '66', '687', NULL, NULL),
(924, 'SAPUYES', 'Nariño', 17, '52', '720', NULL, NULL),
(925, 'SARAVENA', 'Arauca', 25, '81', '736', NULL, NULL),
(926, 'SARDINATA', 'Norte de Santander', 18, '54', '720', NULL, NULL),
(927, 'SASAIMA', 'Cundinamarca', 11, '25', '718', NULL, NULL),
(928, 'SATIVANORTE', 'Boyacá', 5, '15', '720', NULL, NULL),
(929, 'SATIVASUR', 'Boyacá', 5, '15', '723', NULL, NULL),
(930, 'SEGOVIA', 'Antioquia', 1, '05', '736', NULL, NULL),
(931, 'SESQUILÉ', 'Cundinamarca', 11, '25', '736', NULL, NULL),
(932, 'SEVILLA', 'Valle del Cauca', 24, '76', '736', NULL, NULL),
(933, 'SIACHOQUE', 'Boyacá', 5, '15', '740', NULL, NULL),
(934, 'SIBATÉ', 'Cundinamarca', 11, '25', '740', NULL, NULL),
(935, 'SIBUNDOY', 'Putumayo', 27, '86', '749', NULL, NULL),
(936, 'SILOS', 'Norte de Santander', 18, '54', '743', NULL, NULL),
(937, 'SILVANIA', 'Cundinamarca', 11, '25', '743', NULL, NULL),
(938, 'SILVIA', 'Cauca', 8, '19', '743', NULL, NULL),
(939, 'SIMACOTA', 'Santander', 21, '68', '745', NULL, NULL),
(940, 'SIMIJACA', 'Cundinamarca', 11, '25', '745', NULL, NULL),
(941, 'SIMITÍ', 'Bolívar', 4, '13', '744', NULL, NULL),
(942, 'SINCÉ', 'Sucre', 22, '70', '742', NULL, NULL),
(943, 'SINCELEJO', 'Sucre', 22, '70', '001', NULL, NULL),
(944, 'SIPÍ', 'Chocó', 12, '27', '745', NULL, NULL),
(945, 'SITIONUEVO', 'Magdalena', 15, '47', '745', NULL, NULL),
(946, 'SOACHA', 'Cundinamarca', 11, '25', '754', NULL, NULL),
(947, 'SOATÁ', 'Boyacá', 5, '15', '753', NULL, NULL),
(948, 'SOCHA', 'Boyacá', 5, '15', '757', NULL, NULL),
(949, 'SOCORRO', 'Santander', 21, '68', '755', NULL, NULL),
(950, 'SOCOTÁ', 'Boyacá', 5, '15', '755', NULL, NULL),
(951, 'SOGAMOSO', 'Boyacá', 5, '15', '759', NULL, NULL),
(952, 'SOLANO', 'Caquetá', 7, '18', '756', NULL, NULL),
(953, 'SOLEDAD', 'Atlántico', 2, '08', '758', NULL, NULL),
(954, 'SOLITA', 'Caquetá', 7, '18', '785', NULL, NULL),
(955, 'SOMONDOCO', 'Boyacá', 5, '15', '761', NULL, NULL),
(956, 'SONSÓN', 'Antioquia', 1, '05', '756', NULL, NULL),
(957, 'SOPETRÁN', 'Antioquia', 1, '05', '761', NULL, NULL),
(958, 'SOPLAVIENTO', 'Bolívar', 4, '13', '760', NULL, NULL),
(959, 'SOPÓ', 'Cundinamarca', 11, '25', '758', NULL, NULL),
(960, 'SORA', 'Boyacá', 5, '15', '762', NULL, NULL),
(961, 'SORACÁ', 'Boyacá', 5, '15', '764', NULL, NULL),
(962, 'SOTAQUIRÁ', 'Boyacá', 5, '15', '763', NULL, NULL),
(963, 'SOTARA', 'Cauca', 8, '19', '760', NULL, NULL),
(964, 'SUAITA', 'Santander', 21, '68', '770', NULL, NULL),
(965, 'SUAN', 'Atlántico', 2, '08', '770', NULL, NULL),
(966, 'SUÁREZ', 'Cauca', 8, '19', '780', NULL, NULL),
(967, 'SUÁREZ', 'Tolima', 23, '73', '770', NULL, NULL),
(968, 'SUAZA', 'Huila', 13, '41', '770', NULL, NULL),
(969, 'SUBACHOQUE', 'Cundinamarca', 11, '25', '769', NULL, NULL),
(970, 'SUCRE', 'Cauca', 8, '19', '785', NULL, NULL),
(971, 'SUCRE', 'Santander', 21, '68', '773', NULL, NULL),
(972, 'SUCRE', 'Sucre', 22, '70', '771', NULL, NULL),
(973, 'SUESCA', 'Cundinamarca', 11, '25', '772', NULL, NULL),
(974, 'SUPATÁ', 'Cundinamarca', 11, '25', '777', NULL, NULL),
(975, 'SUPÍA', 'Caldas', 6, '17', '777', NULL, NULL),
(976, 'SURATÁ', 'Santander', 21, '68', '780', NULL, NULL),
(977, 'SUSA', 'Cundinamarca', 11, '25', '779', NULL, NULL),
(978, 'SUSACÓN', 'Boyacá', 5, '15', '774', NULL, NULL),
(979, 'SUTAMARCHÁN', 'Boyacá', 5, '15', '776', NULL, NULL),
(980, 'SUTATAUSA', 'Cundinamarca', 11, '25', '781', NULL, NULL),
(981, 'SUTATENZA', 'Boyacá', 5, '15', '778', NULL, NULL),
(982, 'TABIO', 'Cundinamarca', 11, '25', '785', NULL, NULL),
(983, 'TADÓ', 'Chocó', 12, '27', '787', NULL, NULL),
(984, 'TALAIGUA NUEVO', 'Bolívar', 4, '13', '780', NULL, NULL),
(985, 'TAMALAMEQUE', 'Cesar', 9, '20', '787', NULL, NULL),
(986, 'TÁMARA', 'Casanare', 26, '85', '400', NULL, NULL),
(987, 'TAME', 'Arauca', 25, '81', '794', NULL, NULL),
(988, 'TÁMESIS', 'Antioquia', 1, '05', '789', NULL, NULL),
(989, 'TAMINANGO', 'Nariño', 17, '52', '786', NULL, NULL),
(990, 'TANGUA', 'Nariño', 17, '52', '788', NULL, NULL),
(991, 'TARAIRA', 'Vaupés', 32, '97', '666', NULL, NULL),
(992, 'TARAPACÁ', 'Amazonas', 29, '91', '798', NULL, NULL),
(993, 'TARAZÁ', 'Antioquia', 1, '05', '790', NULL, NULL),
(994, 'TARQUI', 'Huila', 13, '41', '791', NULL, NULL),
(995, 'TARSO', 'Antioquia', 1, '05', '792', NULL, NULL),
(996, 'TASCO', 'Boyacá', 5, '15', '790', NULL, NULL),
(997, 'TAURAMENA', 'Casanare', 26, '85', '410', NULL, NULL),
(998, 'TAUSA', 'Cundinamarca', 11, '25', '793', NULL, NULL),
(999, 'TELLO', 'Huila', 13, '41', '799', NULL, NULL),
(1000, 'TENA', 'Cundinamarca', 11, '25', '797', NULL, NULL),
(1001, 'TENERIFE', 'Magdalena', 15, '47', '798', NULL, NULL),
(1002, 'TENJO', 'Cundinamarca', 11, '25', '799', NULL, NULL),
(1003, 'TENZA', 'Boyacá', 5, '15', '798', NULL, NULL),
(1004, 'TEORAMA', 'Norte de Santander', 18, '54', '800', NULL, NULL),
(1005, 'TERUEL', 'Huila', 13, '41', '801', NULL, NULL),
(1006, 'TESALIA', 'Huila', 13, '41', '797', NULL, NULL),
(1007, 'TIBACUY', 'Cundinamarca', 11, '25', '805', NULL, NULL),
(1008, 'TIBANÁ', 'Boyacá', 5, '15', '804', NULL, NULL),
(1009, 'TIBASOSA', 'Boyacá', 5, '15', '806', NULL, NULL),
(1010, 'TIBIRITA', 'Cundinamarca', 11, '25', '807', NULL, NULL),
(1011, 'TIBÚ', 'Norte de Santander', 18, '54', '810', NULL, NULL),
(1012, 'TIERRALTA', 'Córdoba', 10, '23', '807', NULL, NULL),
(1013, 'TIMANÁ', 'Huila', 13, '41', '807', NULL, NULL),
(1014, 'TIMBÍO', 'Cauca', 8, '19', '807', NULL, NULL),
(1015, 'TIMBIQUÍ', 'Cauca', 8, '19', '809', NULL, NULL),
(1016, 'TINJACÁ', 'Boyacá', 5, '15', '808', NULL, NULL),
(1017, 'TIPACOQUE', 'Boyacá', 5, '15', '810', NULL, NULL),
(1018, 'TIQUISIO', 'Bolívar', 4, '13', '810', NULL, NULL),
(1019, 'TITIRIBÍ', 'Antioquia', 1, '05', '809', NULL, NULL),
(1020, 'TOCA', 'Boyacá', 5, '15', '814', NULL, NULL),
(1021, 'TOCAIMA', 'Cundinamarca', 11, '25', '815', NULL, NULL),
(1022, 'TOCANCIPÁ', 'Cundinamarca', 11, '25', '817', NULL, NULL),
(1023, 'TOGÜÍ', 'Boyacá', 5, '15', '816', NULL, NULL),
(1024, 'TOLEDO', 'Antioquia', 1, '05', '819', NULL, NULL),
(1025, 'TOLEDO', 'Norte de Santander', 18, '54', '820', NULL, NULL),
(1026, 'TOLÚ VIEJO', 'Sucre', 22, '70', '823', NULL, NULL),
(1027, 'TONA', 'Santander', 21, '68', '820', NULL, NULL),
(1028, 'TÓPAGA', 'Boyacá', 5, '15', '820', NULL, NULL),
(1029, 'TOPAIPÍ', 'Cundinamarca', 11, '25', '823', NULL, NULL),
(1030, 'TORIBIO', 'Cauca', 8, '19', '821', NULL, NULL),
(1031, 'TORO', 'Valle del Cauca', 24, '76', '823', NULL, NULL),
(1032, 'TOTA', 'Boyacá', 5, '15', '822', NULL, NULL),
(1033, 'TOTORÓ', 'Cauca', 8, '19', '824', NULL, NULL),
(1034, 'TRINIDAD', 'Casanare', 26, '85', '430', NULL, NULL),
(1035, 'TRUJILLO', 'Valle del Cauca', 24, '76', '828', NULL, NULL),
(1036, 'TUBARÁ', 'Atlántico', 2, '08', '832', NULL, NULL),
(1037, 'TUCHÍN', 'Córdoba', 10, '23', '815', NULL, NULL),
(1038, 'TULUÁ', 'Valle del Cauca', 24, '76', '834', NULL, NULL),
(1039, 'TUMACO', 'Nariño', 17, '52', '835', NULL, NULL),
(1040, 'TUNJA', 'Boyacá', 5, '15', '001', NULL, NULL),
(1041, 'TUNUNGUÁ', 'Boyacá', 5, '15', '832', NULL, NULL),
(1042, 'TÚQUERRES', 'Nariño', 17, '52', '838', NULL, NULL),
(1043, 'TURBACO', 'Bolívar', 4, '13', '836', NULL, NULL),
(1044, 'TURBANÁ', 'Bolívar', 4, '13', '838', NULL, NULL),
(1045, 'TURBO', 'Antioquia', 1, '05', '837', NULL, NULL),
(1046, 'TURMEQUÉ', 'Boyacá', 5, '15', '835', NULL, NULL),
(1047, 'TUTA', 'Boyacá', 5, '15', '837', NULL, NULL),
(1048, 'TUTAZÁ', 'Boyacá', 5, '15', '839', NULL, NULL),
(1049, 'UBALÁ', 'Cundinamarca', 11, '25', '839', NULL, NULL),
(1050, 'UBAQUE', 'Cundinamarca', 11, '25', '841', NULL, NULL),
(1051, 'ULLOA', 'Valle del Cauca', 24, '76', '845', NULL, NULL),
(1052, 'UMBITA', 'Boyacá', 5, '15', '842', NULL, NULL),
(1053, 'UNE', 'Cundinamarca', 11, '25', '845', NULL, NULL),
(1054, 'UNGUÍA', 'Chocó', 12, '27', '800', NULL, NULL),
(1055, 'UNIÓN PANAMERICANA', 'Chocó', 12, '27', '810', NULL, NULL),
(1056, 'URAMITA', 'Antioquia', 1, '05', '842', NULL, NULL),
(1057, 'URIBE', 'Meta', 16, '50', '370', NULL, NULL),
(1058, 'URIBIA', 'La Guajira', 14, '44', '847', NULL, NULL),
(1059, 'URRAO', 'Antioquia', 1, '05', '847', NULL, NULL),
(1060, 'URUMITA', 'La Guajira', 14, '44', '855', NULL, NULL),
(1061, 'USIACURÍ', 'Atlántico', 2, '08', '849', NULL, NULL),
(1062, 'ÚTICA', 'Cundinamarca', 11, '25', '851', NULL, NULL),
(1063, 'VALDIVIA', 'Antioquia', 1, '05', '854', NULL, NULL),
(1064, 'VALENCIA', 'Córdoba', 10, '23', '855', NULL, NULL),
(1065, 'VALLE DE SAN JOSÉ', 'Santander', 21, '68', '855', NULL, NULL),
(1066, 'VALLE DE SAN JUAN', 'Tolima', 23, '73', '854', NULL, NULL),
(1067, 'VALLE DEL GUAMUEZ', 'Putumayo', 27, '86', '865', NULL, NULL),
(1068, 'VALLEDUPAR', 'Cesar', 9, '20', '001', NULL, NULL),
(1069, 'VALPARAÍSO', 'Antioquia', 1, '05', '856', NULL, NULL),
(1070, 'VALPARAÍSO', 'Caquetá', 7, '18', '860', NULL, NULL),
(1071, 'VEGACHÍ', 'Antioquia', 1, '05', '858', NULL, NULL),
(1072, 'VÉLEZ', 'Santander', 21, '68', '861', NULL, NULL),
(1073, 'VENADILLO', 'Tolima', 23, '73', '861', NULL, NULL),
(1074, 'VENECIA', 'Antioquia', 1, '05', '861', NULL, NULL),
(1075, 'VENECIA', 'Cundinamarca', 11, '25', '506', NULL, NULL),
(1076, 'VENTAQUEMADA', 'Boyacá', 5, '15', '861', NULL, NULL),
(1077, 'VERGARA', 'Cundinamarca', 11, '25', '862', NULL, NULL),
(1078, 'VERSALLES', 'Valle del Cauca', 24, '76', '863', NULL, NULL),
(1079, 'VETAS', 'Santander', 21, '68', '867', NULL, NULL),
(1080, 'VIANÍ', 'Cundinamarca', 11, '25', '867', NULL, NULL),
(1081, 'VICTORIA', 'Caldas', 6, '17', '867', NULL, NULL),
(1082, 'VIGÍA DEL FUERTE', 'Antioquia', 1, '05', '873', NULL, NULL),
(1083, 'VIJES', 'Valle del Cauca', 24, '76', '869', NULL, NULL),
(1084, 'VILLA CARO', 'Norte de Santander', 18, '54', '871', NULL, NULL),
(1085, 'VILLA DE LEYVA', 'Boyacá', 5, '15', '407', NULL, NULL),
(1086, 'VILLA DE SAN DIEGO DE UBATE', 'Cundinamarca', 11, '25', '843', NULL, NULL),
(1087, 'VILLA DEL ROSARIO', 'Norte de Santander', 18, '54', '874', NULL, NULL),
(1088, 'VILLA RICA', 'Cauca', 8, '19', '845', NULL, NULL),
(1089, 'VILLAGARZÓN', 'Putumayo', 27, '86', '885', NULL, NULL),
(1090, 'VILLAGÓMEZ', 'Cundinamarca', 11, '25', '871', NULL, NULL),
(1091, 'VILLAHERMOSA', 'Tolima', 23, '73', '870', NULL, NULL),
(1092, 'VILLAMARÍA', 'Caldas', 6, '17', '873', NULL, NULL),
(1093, 'VILLANUEVA', 'Bolívar', 4, '13', '873', NULL, NULL),
(1094, 'VILLANUEVA', 'La Guajira', 14, '44', '874', NULL, NULL),
(1095, 'VILLANUEVA', 'Santander', 21, '68', '872', NULL, NULL),
(1096, 'VILLANUEVA', 'Casanare', 26, '85', '440', NULL, NULL),
(1097, 'VILLAPINZÓN', 'Cundinamarca', 11, '25', '873', NULL, NULL),
(1098, 'VILLARRICA', 'Tolima', 23, '73', '873', NULL, NULL),
(1099, 'VILLAVICENCIO', 'Meta', 16, '50', '001', NULL, NULL),
(1100, 'VILLAVIEJA', 'Huila', 13, '41', '872', NULL, NULL),
(1101, 'VILLETA', 'Cundinamarca', 11, '25', '875', NULL, NULL),
(1102, 'VIOTÁ', 'Cundinamarca', 11, '25', '878', NULL, NULL),
(1103, 'VIRACACHÁ', 'Boyacá', 5, '15', '879', NULL, NULL),
(1104, 'VISTAHERMOSA', 'Meta', 16, '50', '711', NULL, NULL),
(1105, 'VITERBO', 'Caldas', 6, '17', '877', NULL, NULL),
(1106, 'YACOPÍ', 'Cundinamarca', 11, '25', '885', NULL, NULL),
(1107, 'YACUANQUER', 'Nariño', 17, '52', '885', NULL, NULL),
(1108, 'YAGUARÁ', 'Huila', 13, '41', '885', NULL, NULL),
(1109, 'YALÍ', 'Antioquia', 1, '05', '885', NULL, NULL),
(1110, 'YARUMAL', 'Antioquia', 1, '05', '887', NULL, NULL),
(1111, 'YAVARATÉ', 'Vaupés', 32, '97', '889', NULL, NULL),
(1112, 'YOLOMBÓ', 'Antioquia', 1, '05', '890', NULL, NULL),
(1113, 'YONDÓ', 'Antioquia', 1, '05', '893', NULL, NULL),
(1114, 'YOPAL', 'Casanare', 26, '85', '001', NULL, NULL),
(1115, 'YOTOCO', 'Valle del Cauca', 24, '76', '890', NULL, NULL),
(1116, 'YUMBO', 'Valle del Cauca', 24, '76', '892', NULL, NULL),
(1117, 'ZAMBRANO', 'Bolívar', 4, '13', '894', NULL, NULL),
(1118, 'ZAPATOCA', 'Santander', 21, '68', '895', NULL, NULL),
(1119, 'ZAPAYÁN', 'Magdalena', 15, '47', '960', NULL, NULL),
(1120, 'ZARAGOZA', 'Antioquia', 1, '05', '895', NULL, NULL),
(1121, 'ZARZAL', 'Valle del Cauca', 24, '76', '895', NULL, NULL),
(1122, 'ZETAQUIRA', 'Boyacá', 5, '15', '897', NULL, NULL),
(1123, 'ZIPACÓN', 'Cundinamarca', 11, '25', '898', NULL, NULL),
(1124, 'ZIPAQUIRÁ', 'Cundinamarca', 11, '25', '899', NULL, NULL),
(1125, 'ZONA BANANERA', 'Magdalena', 15, '47', '980', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_nit_types`
--

CREATE TABLE `api_nit_types` (
  `id` int(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Facturacion';

--
-- Volcado de datos para la tabla `api_nit_types`
--

INSERT INTO `api_nit_types` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Registro civil', '11', NULL, NULL),
(2, 'Tarjeta de identidad', '12', NULL, NULL),
(3, 'Cédula de ciudadanía', '13', NULL, NULL),
(4, 'Tarjeta de extranjería', '21', NULL, NULL),
(5, 'Cédula de extranjería', '22', NULL, NULL),
(6, 'NIT', '31', NULL, NULL),
(7, 'Pasaporte', '41', NULL, NULL),
(8, 'Documento de identificación extranjero', '42', NULL, NULL),
(9, 'NIT de otro país', '50', NULL, NULL),
(10, 'NUIP', '91', NULL, NULL);

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
(1, 'Basic', 59000, 0, 80, '2021-01-30 00:00:00', '2021-01-30 00:00:00'),
(2, 'Pyme', 150000, 1, 160, '2021-01-30 00:00:00', '2021-01-30 00:00:00'),
(3, 'Enterprise', 300000, 1, 240, '2021-01-30 00:00:00', '2021-01-30 00:00:00'),
(4, 'Gold', 600000, 1, 480, '2021-01-30 00:00:00', '2021-01-30 00:00:00'),
(5, 'Diamond', 1200000, 1, 960, '2021-01-30 00:00:00', '2021-01-30 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_payment_methods`
--

CREATE TABLE `api_payment_methods` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Facturacion';

--
-- Volcado de datos para la tabla `api_payment_methods`
--

INSERT INTO `api_payment_methods` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(80, 'Instrumento no definido', '1', NULL, NULL),
(81, 'Crédito ACH', '2', NULL, NULL),
(82, 'Débito ACH', '3', NULL, NULL),
(83, 'Reversión débito de demanda ACH', '4', NULL, NULL),
(84, 'Reversión crédito de demanda ACH', '5', NULL, NULL),
(85, 'Crédito de demanda ACH', '6', NULL, NULL),
(86, 'Débito de demanda ACH	', '7', NULL, NULL),
(87, 'Mantener', '8', NULL, NULL),
(88, 'Clearing Nacional o Regional', '9', NULL, NULL),
(89, 'Efectivo', '10', NULL, NULL),
(90, 'Reversión Crédito Ahorro', '11', NULL, NULL),
(91, 'Reversión Débito Ahorro', '12', NULL, NULL),
(92, 'Crédito Ahorro', '13', NULL, NULL),
(93, 'Débito Ahorro', '14', NULL, NULL),
(94, 'Bookentry Crédito', '15', NULL, NULL),
(95, 'Bookentry Débito', '16', NULL, NULL),
(96, 'Concentración de la demanda en efectivo /Desembolso Crédito (CCD),', '17', NULL, NULL),
(97, 'Concentración de la demanda en efectivo / Desembolso (CCD), débito	', '18', NULL, NULL),
(98, 'Crédito Pago negocio corporativo (CTP),', '19', NULL, NULL),
(99, 'Cheque', '20', NULL, NULL),
(100, 'Poyecto bancario', '21', NULL, NULL),
(101, 'Proyecto bancario certificado', '22', NULL, NULL),
(102, 'Cheque bancario', '23', NULL, NULL),
(103, 'Nota cambiaria esperando aceptación', '24', NULL, NULL),
(104, 'Cheque certificado', '25', NULL, NULL),
(105, 'Cheque Local', '26', NULL, NULL),
(106, 'Débito Pago Neogcio Corporativo (CTP),', '27', NULL, NULL),
(107, 'Crédito Negocio Intercambio Corporativo (CTX),', '28', NULL, NULL),
(108, 'Débito Negocio Intercambio Corporativo (CTX),', '29', NULL, NULL),
(109, 'Transferecia Crédito', '30', NULL, NULL),
(110, 'Transferencia Débito', '31', NULL, NULL),
(111, 'Concentración Efectivo / Desembolso Crédito plus (CCD+),', '32', NULL, NULL),
(112, 'Concentración Efectivo / Desembolso Débito plus (CCD+),', '33', NULL, NULL),
(113, 'Pago y depósito pre acordado (PPD),', '34', NULL, NULL),
(114, 'Concentración efectivo ahorros / Desembolso Crédito (CCD),', '35', NULL, NULL),
(115, 'Concentración efectivo ahorros / Desembolso Drédito (CCD),', '36', NULL, NULL),
(116, 'Pago Negocio Corporativo Ahorros Crédito (CTP),', '37', NULL, NULL),
(117, 'Pago Neogcio Corporativo Ahorros Débito (CTP),', '38', NULL, NULL),
(118, 'Crédito Negocio Intercambio Corporativo (CTX),', '39', NULL, NULL),
(119, 'Débito Negocio Intercambio Corporativo (CTX),', '40', NULL, NULL),
(120, 'Concentración efectivo/Desembolso Crédito plus (CCD+),', '41', NULL, NULL),
(121, 'Consiganción bancaria', '42', NULL, NULL),
(122, 'Concentración efectivo / Desembolso Débito plus (CCD+),', '43', NULL, NULL),
(123, 'Nota cambiaria', '44', NULL, NULL),
(124, 'Transferencia Crédito Bancario', '45', NULL, NULL),
(125, 'Transferencia Débito Interbancario', '46', NULL, NULL),
(126, 'Transferencia Débito Bancaria', '47', NULL, NULL),
(127, 'Tarjeta Crédito', '48', NULL, NULL),
(128, 'Tarjeta Débito', '49', NULL, NULL),
(129, 'Postgiro', '50', NULL, NULL),
(130, 'Telex estándar bancario francés', '51', NULL, NULL),
(131, 'Pago comercial urgente', '52', NULL, NULL),
(132, 'Pago Tesorería Urgente', '53', NULL, NULL),
(133, 'Nota promisoria', '60', NULL, NULL),
(134, 'Nota promisoria firmada por el acreedor', '61', NULL, NULL),
(135, 'Nota promisoria firmada por el acreedor, avalada por el banco', '62', NULL, NULL),
(136, 'Nota promisoria firmada por el acreedor, avalada por un tercero', '63', NULL, NULL),
(137, 'Nota promisoria firmada pro el banco', '64', NULL, NULL),
(138, 'Nota promisoria firmada por un banco avalada por otro banco', '65', NULL, NULL),
(139, 'Nota promisoria firmada ', '66', NULL, NULL),
(140, 'Nota promisoria firmada por un tercero avalada por un banco', '67', NULL, NULL),
(141, 'Retiro de nota por el por el acreedor', '70', NULL, NULL),
(142, 'Retiro de nota por el por el acreedor sobre un banco', '74', NULL, NULL),
(143, 'Retiro de nota por el acreedor, avalada por otro banco', '75', NULL, NULL),
(144, 'Retiro de nota por el acreedor, sobre un banco avalada por un tercero', '76', NULL, NULL),
(145, 'Retiro de una nota por el acreedor sobre un tercero', '77', NULL, NULL),
(146, 'Retiro de una nota por el acreedor sobre un tercero avalada por un banco', '78', NULL, NULL),
(147, 'Nota bancaria tranferible', '91', NULL, NULL),
(148, 'Cheque local traferible', '92', NULL, NULL),
(149, 'Giro referenciado', '93', NULL, NULL),
(150, 'Giro urgente', '94', NULL, NULL),
(151, 'Giro formato abierto', '95', NULL, NULL),
(152, 'Método de pago solicitado no usuado', '96', NULL, NULL),
(153, 'Clearing entre partners', '97', NULL, NULL),
(154, 'Acuerdo mutuo', 'Z', NULL, NULL);

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
  `password` varchar(512) DEFAULT NULL,
  `language_id` int(12) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `brand_logo` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `main_color` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `system_responsible` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `codpostal` varchar(10) CHARACTER SET latin1 DEFAULT '',
  `instance` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='apifecol';

--
-- Volcado de datos para la tabla `api_profiles`
--

INSERT INTO `api_profiles` (`id`, `company`, `description`, `phone`, `regimen`, `address`, `city_id`, `country_id`, `id_fiscal`, `package_code`, `email`, `password`, `language_id`, `name`, `brand_logo`, `signature`, `main_color`, `system_responsible`, `codpostal`, `instance`, `updated_at`, `created_at`, `status`) VALUES
(1, 'Plenus Services', 'TI Services', '3158878359', 1, 'Cra 85I #53-30', 1, 1, 1, 1, 'juan.bautista@plenusservices.com', '$2y$10$ERzokvIwvAD4wSemp81kEOQm3r4C/72wXwYDlldmheDhHtxcIzuHO', 1, 'Juan Bautista', NULL, NULL, '#333333', NULL, NULL, NULL, '2021-02-06 00:00:00', '2021-02-06 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_retention`
--

CREATE TABLE `api_retention` (
  `id` int(12) NOT NULL,
  `customer_account` varchar(255) DEFAULT NULL,
  `provider_account` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `percentage` double NOT NULL,
  `taxe_id` int(12) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_retention`
--

INSERT INTO `api_retention` (`id`, `customer_account`, `provider_account`, `name`, `percentage`, `taxe_id`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'IVA 19%', 0.19, 1, 'IVA', '2020-08-06 00:00:00', '2020-08-06 00:00:00'),
(2, NULL, NULL, 'IVA 5%', 0.05, 1, 'IVA', '2020-08-06 00:00:00', '2020-08-06 00:00:00'),
(3, NULL, NULL, 'IVA 0%', 0, 1, 'IVA', '2020-08-06 00:00:00', '2020-08-06 00:00:00'),
(4, NULL, NULL, 'Servicios de  transporte nacional de pasajeros por vía terrestre (no declarantes) 3.5%', 0.035, 6, 'RETENCION', '2020-08-07 00:00:00', '2020-08-07 00:00:00'),
(5, NULL, NULL, 'Servicios de  transporte nacional de pasajeros por vía terrestre (declarantes) 3.5%', 0.035, 6, 'RETENCION', '2020-08-07 00:00:00', '2020-08-07 00:00:00'),
(6, NULL, NULL, 'Servicios de licenciamiento o derecho de uso de software 3.5%', 0.035, 6, 'RETENCION', '2020-08-07 00:00:00', '2020-08-07 00:00:00'),
(7, NULL, NULL, 'Compras generales (declarantes) 2.5%', 0.025, 6, 'RETENCION', '2020-08-07 00:00:00', '2020-08-07 00:00:00'),
(8, NULL, NULL, 'Compras generales (no declarantes) 3.5%', 0.035, 6, 'RETENCION', '2020-08-07 00:00:00', '2020-08-07 00:00:00'),
(9, NULL, NULL, 'Servicios generales (declarantes) 4%', 0.04, 6, 'RETENCION', '2020-08-07 00:00:00', '2020-08-07 00:00:00'),
(10, NULL, NULL, 'Servicios generales (no declarantes) 6%', 0.06, 6, 'RETENCION', '2020-08-07 00:00:00', '2020-08-07 00:00:00'),
(11, NULL, NULL, 'Servicios de transporte de carga 1%', 0.01, 6, 'RETENCION', '2020-08-07 00:00:00', '2020-08-07 00:00:00'),
(12, NULL, NULL, 'INC 5%', 0.05, 4, 'INC', '2020-08-14 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_taxes`
--

CREATE TABLE `api_taxes` (
  `id` int(12) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(512) NOT NULL,
  `code` varchar(256) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Facturacion';

--
-- Volcado de datos para la tabla `api_taxes`
--

INSERT INTO `api_taxes` (`id`, `name`, `description`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IVA', 'Impuesto de Valor Agregado', '01', NULL, NULL),
(2, 'IC', 'Impuesto al Consumo', '02', NULL, NULL),
(3, 'ICA', 'Impuesto de Industria, Comercio y Aviso', '03', NULL, NULL),
(4, 'INC', 'Impuesto Nacional al Consumo', '04', NULL, NULL),
(5, 'ReteIVA', 'Retención sobre el IVA', '05', NULL, NULL),
(6, 'ReteFuente', 'Retención sobre Renta', '06', NULL, NULL),
(7, 'ReteICA', 'Retención sobre el ICA', '07', NULL, NULL),
(8, 'FtoHorticultura', 'Cuota de Fomento Hortifrutícula', '20', NULL, NULL),
(9, 'Timbre', 'Impuesto de Timbre', '21', NULL, NULL),
(10, 'Bolsas', 'Impuesto al Consumo de Bolsa Plástica', '22', NULL, NULL),
(21, 'INCarbono', 'Impuesto Nacional al Carbono', '23', NULL, NULL),
(22, 'INCombustibles', 'Impuesto Nacional a los Combustibles', '24', NULL, NULL),
(23, 'Sobretasa Combustibles', 'Sobretasa a los combustibles', '25', NULL, NULL),
(24, 'Sordicom', 'Contribución minoristas (Combustibles)', '26', NULL, NULL),
(25, 'Nombre de la figura tributaria', 'Otros tributos, tasas, contribuciones, y similares', 'ZZ', NULL, NULL),
(26, 'No causa', 'No responsable de tributo', 'ZY', '2020-08-31 00:00:00', '2020-08-31 00:00:00'),
(27, 'Nombre de la figura tributaria ', 'Otros tributos, tasas, contribuciones, y similares.', 'ZZ', '2020-08-31 00:00:00', '2020-08-31 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_type_currencies`
--

CREATE TABLE `api_type_currencies` (
  `id` int(12) NOT NULL,
  `country` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_type_currencies`
--

INSERT INTO `api_type_currencies` (`id`, `country`, `currency`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'Afghan afghani', 'AFN', '؋', NULL, NULL),
(2, 'Akrotiri and Dhekelia (UK)', 'European euro', 'EUR', '€', NULL, NULL),
(3, 'Aland Islands (Finland)', 'European euro', 'EUR', '€', NULL, NULL),
(4, 'Albania', 'Albanian lek', 'ALL', 'Lek', NULL, NULL),
(5, 'Algeria', 'Algerian dinar', 'DZD', 'د.ج', NULL, NULL),
(6, 'American Samoa (USA)', 'United States dollar', 'USD', '$', NULL, NULL),
(7, 'Andorra', 'European euro', 'EUR', '€', NULL, NULL),
(8, 'Angola', 'Angolan kwanza', 'AOA', 'Kz', NULL, NULL),
(9, 'Anguilla (UK)', 'East Caribbean dollar', 'XCD', '$', NULL, NULL),
(10, 'Antigua and Barbuda', 'East Caribbean dollar', 'XCD', '$', NULL, NULL),
(11, 'Argentina', 'Argentine peso', 'ARS', '$', NULL, NULL),
(12, 'Armenia', 'Armenian dram', 'AMD', 'Դ', NULL, NULL),
(13, 'Aruba (Netherlands)', 'Aruban florin', 'AWG', 'ƒ', NULL, NULL),
(14, 'Ascension Island (UK)', 'Saint Helena pound', 'SHP', '£', NULL, NULL),
(15, 'Australia', 'Australian dollar', 'AUD', '$', NULL, NULL),
(16, 'Austria', 'European euro', 'EUR', '€', NULL, NULL),
(17, 'Azerbaijan', 'Azerbaijan manat', 'AZN', 'ман', NULL, NULL),
(18, 'Bahamas', 'Bahamian dollar', 'BSD', '$', NULL, NULL),
(19, 'Bahrain', 'Bahraini dinar', 'BHD', 'ب.د', NULL, NULL),
(20, 'Bangladesh', 'Bangladeshi taka', 'BDT', '৳', NULL, NULL),
(21, 'Barbados', 'Barbadian dollar', 'BBD', '$', NULL, NULL),
(22, 'Belarus', 'Belarusian ruble', 'BYN', 'Br', NULL, NULL),
(23, 'Belgium', 'European euro', 'EUR', '€', NULL, NULL),
(24, 'Belize', 'Belize dollar', 'BZD', 'BZ$', NULL, NULL),
(25, 'Benin', 'West African CFA franc', 'XOF', 'CFA', NULL, NULL),
(26, 'Bermuda (UK)', 'Bermudian dollar', 'BMD', '$', NULL, NULL),
(27, 'Bhutan', 'Bhutanese ngultrum', 'BTN', '', NULL, NULL),
(28, 'Bolivia', 'Bolivian boliviano', 'BOB', '$b', NULL, NULL),
(29, 'Bonaire (Netherlands)', 'United States dollar', 'USD', '$', NULL, NULL),
(30, 'Bosnia and Herzegovina', 'Bosnia and Herzegovina convertible mark', 'BAM', 'KM', NULL, NULL),
(31, 'Botswana', 'Botswana pula', 'BWP', 'P', NULL, NULL),
(32, 'Brazil', 'Brazilian real', 'BRL', 'R$', NULL, NULL),
(33, 'British Indian Ocean Territory (UK)', 'United States dollar', 'USD', '$', NULL, NULL),
(34, 'British Virgin Islands (UK)', 'United States dollar', 'USD', '$', NULL, NULL),
(35, 'Brunei', 'Brunei dollar', 'BND', '$', NULL, NULL),
(36, 'Bulgaria', 'Bulgarian lev', 'BGN', 'лв', NULL, NULL),
(37, 'Burkina Faso', 'West African CFA franc', 'XOF', 'CFA', NULL, NULL),
(38, 'Burundi', 'Burundi franc', 'BIF', '₣', NULL, NULL),
(39, 'Cabo Verde', 'Cape Verdean escudo', 'CVE', '$', NULL, NULL),
(40, 'Cambodia', 'Cambodian riel', 'KHR', '៛', NULL, NULL),
(41, 'Cameroon', 'Central African CFA franc', 'XAF', '₣', NULL, NULL),
(42, 'Canada', 'Canadian dollar', 'CAD', '$', NULL, NULL),
(43, 'Caribbean Netherlands (Netherlands)', 'United States dollar', 'USD', '$', NULL, NULL),
(44, 'Cayman Islands (UK)', 'Cayman Islands dollar', 'KYD', '$', NULL, NULL),
(45, 'Central African Republic', 'Central African CFA franc', 'XAF', '₣', NULL, NULL),
(46, 'Chad', 'Central African CFA franc', 'XAF', '₣', NULL, NULL),
(47, 'Chatham Islands (New Zealand)', 'New Zealand dollar', 'NZD', '$', NULL, NULL),
(48, 'Chile', 'Chilean peso', 'CLP', '$', NULL, NULL),
(49, 'China', 'Chinese Yuan Renminbi', 'CNY', '¥', NULL, NULL),
(50, 'Christmas Island (Australia)', 'Australian dollar', 'AUD', '$', NULL, NULL),
(51, 'Cocos (Keeling) Islands (Australia)', 'Australian dollar', 'AUD', '$', NULL, NULL),
(52, 'Colombia', 'Colombian peso', 'COP', '$', NULL, NULL),
(53, 'Comoros', 'Comorian franc', 'KMF', 'CF', NULL, NULL),
(54, 'Congo, Democratic Republic of the', 'Congolese franc', 'CDF', '₣', NULL, NULL),
(55, 'Congo, Republic of the', 'Central African CFA franc', 'XAF', '₣', NULL, NULL),
(56, 'Cook Islands (New Zealand)', 'Cook Islands dollar', '---', NULL, NULL, NULL),
(57, 'Costa Rica', 'Costa Rican colon', 'CRC', '₡', NULL, NULL),
(58, 'Cote d\'Ivoire', 'West African CFA franc', 'XOF', 'CFA', NULL, NULL),
(59, 'Croatia', 'Croatian kuna', 'HRK', 'kn', NULL, NULL),
(60, 'Cuba', 'Cuban peso', 'CUP', '₱', NULL, NULL),
(61, 'Curacao (Netherlands)', 'Netherlands Antillean guilder', 'ANG', 'ƒ', NULL, NULL),
(62, 'Cyprus', 'European euro', 'EUR', '€', NULL, NULL),
(63, 'Czechia', 'Czech koruna', 'CZK', 'Kč', NULL, NULL),
(64, 'Denmark', 'Danish krone', 'DKK', 'kr', NULL, NULL),
(65, 'Djibouti', 'Djiboutian franc', 'DJF', '₣', NULL, NULL),
(66, 'Dominica', 'East Caribbean dollar', 'XCD', '$', NULL, NULL),
(67, 'Dominican Republic', 'Dominican peso', 'DOP', 'RD$', NULL, NULL),
(68, 'Ecuador', 'United States dollar', 'USD', '$', NULL, NULL),
(69, 'Egypt', 'Egyptian pound', 'EGP', '£', NULL, NULL),
(70, 'El Salvador', 'United States dollar', 'USD', '$', NULL, NULL),
(71, 'Equatorial Guinea', 'Central African CFA franc', 'XAF', '₣', NULL, NULL),
(72, 'Eritrea', 'Eritrean nakfa', 'ERN', 'Nfk', NULL, NULL),
(73, 'Estonia', 'European euro', 'EUR', '€', NULL, NULL),
(74, 'Eswatini (formerly Swaziland)', 'Swazi lilangeni', 'SZL', 'L', NULL, NULL),
(75, 'Ethiopia', 'Ethiopian birr', 'ETB', '', NULL, NULL),
(76, 'Falkland Islands (UK)', 'Falkland Islands pound', 'FKP', '£', NULL, NULL),
(77, 'Faroe Islands (Denmark)', 'Faroese krona', '---', NULL, NULL, NULL),
(78, 'Fiji', 'Fijian dollar', 'FJD', '$', NULL, NULL),
(79, 'Finland', 'European euro', 'EUR', '€', NULL, NULL),
(80, 'France', 'European euro', 'EUR', '€', NULL, NULL),
(81, 'French Guiana (France)', 'European euro', 'EUR', '€', NULL, NULL),
(82, 'French Polynesia (France)', 'CFP franc', 'XPF', '₣', NULL, NULL),
(83, 'Gabon', 'Central African CFA franc', 'XAF', '₣', NULL, NULL),
(84, 'Gambia', 'Gambian dalasi', 'GMD', 'D', NULL, NULL),
(85, 'Georgia', 'Georgian lari', 'GEL', 'ლ', NULL, NULL),
(86, 'Germany', 'European euro', 'EUR', '€', NULL, NULL),
(87, 'Ghana', 'Ghanaian cedi', 'GHS', '₵', NULL, NULL),
(88, 'Gibraltar (UK)', 'Gibraltar pound', 'GIP', '£', NULL, NULL),
(89, 'Greece', 'European euro', 'EUR', '€', NULL, NULL),
(90, 'Greenland (Denmark)', 'Danish krone', 'DKK', 'kr', NULL, NULL),
(91, 'Grenada', 'East Caribbean dollar', 'XCD', '$', NULL, NULL),
(92, 'Guadeloupe (France)', 'European euro', 'EUR', '€', NULL, NULL),
(93, 'Guam (USA)', 'United States dollar', 'USD', '$', NULL, NULL),
(94, 'Guatemala', 'Guatemalan quetzal', 'GTQ', 'Q', NULL, NULL),
(95, 'Guernsey (UK)', 'Guernsey Pound', 'GGP', '£', NULL, NULL),
(96, 'Guinea', 'Guinean franc', 'GNF', '₣', NULL, NULL),
(97, 'Guinea-Bissau', 'West African CFA franc', 'XOF', 'CFA', NULL, NULL),
(98, 'Guyana', 'Guyanese dollar', 'GYD', '$', NULL, NULL),
(99, 'Haiti', 'Haitian gourde', 'HTG', 'G', NULL, NULL),
(100, 'Honduras', 'Honduran lempira', 'HNL', 'L', NULL, NULL),
(101, 'Hong Kong (China)', 'Hong Kong dollar', 'HKD', '$', NULL, NULL),
(102, 'Hungary', 'Hungarian forint', 'HUF', 'Ft', NULL, NULL),
(103, 'Iceland', 'Icelandic krona', 'ISK', 'kr', NULL, NULL),
(104, 'India', 'Indian rupee', 'INR', '₹', NULL, NULL),
(105, 'Indonesia', 'Indonesian rupiah', 'IDR', 'Rp', NULL, NULL),
(106, 'International Monetary Fund (IMF)', 'SDR (Special Drawing Right)', 'XDR', '', NULL, NULL),
(107, 'Iran', 'Iranian rial', 'IRR', '﷼', NULL, NULL),
(108, 'Iraq', 'Iraqi dinar', 'IQD', 'ع.د', NULL, NULL),
(109, 'Ireland', 'European euro', 'EUR', '€', NULL, NULL),
(110, 'Isle of Man (UK)', 'Manx pound', 'IMP', '£', NULL, NULL),
(111, 'Israel', 'Israeli new shekel', 'ILS', '₪', NULL, NULL),
(112, 'Italy', 'European euro', 'EUR', '€', NULL, NULL),
(113, 'Jamaica', 'Jamaican dollar', 'JMD', 'J$', NULL, NULL),
(114, 'Japan', 'Japanese yen', 'JPY', '¥', NULL, NULL),
(115, 'Jersey (UK)', 'Jersey pound', 'JEP', '£', NULL, NULL),
(116, 'Jordan', 'Jordanian dinar', 'JOD', 'د.ا', NULL, NULL),
(117, 'Kazakhstan', 'Kazakhstani tenge', 'KZT', 'лв', NULL, NULL),
(118, 'Kenya', 'Kenyan shilling', 'KES', 'Sh', NULL, NULL),
(119, 'Kiribati', 'Australian dollar', 'AUD', '$', NULL, NULL),
(120, 'Kosovo', 'European euro', 'EUR', '€', NULL, NULL),
(121, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'د.ك', NULL, NULL),
(122, 'Kyrgyzstan', 'Kyrgyzstani som', 'KGS', 'лв', NULL, NULL),
(123, 'Laos', 'Lao kip', 'LAK', '₭', NULL, NULL),
(124, 'Latvia', 'European euro', 'EUR', '€', NULL, NULL),
(125, 'Lebanon', 'Lebanese pound', 'LBP', '£', NULL, NULL),
(126, 'Lesotho', 'Lesotho loti', 'LSL', 'L', NULL, NULL),
(127, 'Liberia', 'Liberian dollar', 'LRD', '$', NULL, NULL),
(128, 'Libya', 'Libyan dinar', 'LYD', 'ل.د', NULL, NULL),
(129, 'Liechtenstein', 'Swiss franc', 'CHF', 'CHF', NULL, NULL),
(130, 'Lithuania', 'European euro', 'EUR', '€', NULL, NULL),
(131, 'Luxembourg', 'European euro', 'EUR', '€', NULL, NULL),
(132, 'Macau (China)', 'Macanese pataca', 'MOP', 'P', NULL, NULL),
(133, 'Madagascar', 'Malagasy ariary', 'MGA', '', NULL, NULL),
(134, 'Malawi', 'Malawian kwacha', 'MWK', 'MK', NULL, NULL),
(135, 'Malaysia', 'Malaysian ringgit', 'MYR', 'RM', NULL, NULL),
(136, 'Maldives', 'Maldivian rufiyaa', 'MVR', 'ރ.', NULL, NULL),
(137, 'Mali', 'West African CFA franc', 'XOF', 'CFA', NULL, NULL),
(138, 'Malta', 'European euro', 'EUR', '€', NULL, NULL),
(139, 'Marshall Islands', 'United States dollar', 'USD', '$', NULL, NULL),
(140, 'Martinique (France)', 'European euro', 'EUR', '€', NULL, NULL),
(141, 'Mauritania', 'Mauritanian ouguiya', 'MRU', 'UM', NULL, NULL),
(142, 'Mauritius', 'Mauritian rupee', 'MUR', '₨', NULL, NULL),
(143, 'Mayotte (France)', 'European euro', 'EUR', '€', NULL, NULL),
(144, 'Mexico', 'Mexican peso', 'MXN', '$', NULL, NULL),
(145, 'Micronesia', 'United States dollar', 'USD', '$', NULL, NULL),
(146, 'Moldova', 'Moldovan leu', 'MDL', 'L', NULL, NULL),
(147, 'Monaco', 'European euro', 'EUR', '€', NULL, NULL),
(148, 'Mongolia', 'Mongolian tugrik', 'MNT', '₮', NULL, NULL),
(149, 'Montenegro', 'European euro', 'EUR', '€', NULL, NULL),
(150, 'Montserrat (UK)', 'East Caribbean dollar', 'XCD', '$', NULL, NULL),
(151, 'Morocco', 'Moroccan dirham', 'MAD', 'د.م.', NULL, NULL),
(152, 'Mozambique', 'Mozambican metical', 'MZN', 'MT', NULL, NULL),
(153, 'Myanmar (formerly Burma)', 'Myanmar kyat', 'MMK', 'K', NULL, NULL),
(154, 'Namibia', 'Namibian dollar', 'NAD', '$', NULL, NULL),
(155, 'Nauru', 'Australian dollar', 'AUD', '$', NULL, NULL),
(156, 'Nepal', 'Nepalese rupee', 'NPR', '₨', NULL, NULL),
(157, 'Netherlands', 'European euro', 'EUR', '€', NULL, NULL),
(158, 'New Caledonia (France)', 'CFP franc', 'XPF', '₣', NULL, NULL),
(159, 'New Zealand', 'New Zealand dollar', 'NZD', '$', NULL, NULL),
(160, 'Nicaragua', 'Nicaraguan cordoba', 'NIO', 'C$', NULL, NULL),
(161, 'Niger', 'West African CFA franc', 'XOF', 'CFA', NULL, NULL),
(162, 'Nigeria', 'Nigerian naira', 'NGN', '₦', NULL, NULL),
(163, 'Niue (New Zealand)', 'New Zealand dollar', 'NZD', '$', NULL, NULL),
(164, 'Norfolk Island (Australia)', 'Australian dollar', 'AUD', '$', NULL, NULL),
(165, 'Northern Mariana Islands (USA)', 'United States dollar', 'USD', '$', NULL, NULL),
(166, 'North Korea', 'North Korean won', 'KPW', '₩', NULL, NULL),
(167, 'North Macedonia (formerly Macedonia)', 'Macedonian denar', 'MKD', 'ден', NULL, NULL),
(168, 'Norway', 'Norwegian krone', 'NOK', 'kr', NULL, NULL),
(169, 'Oman', 'Omani rial', 'OMR', '﷼', NULL, NULL),
(170, 'Pakistan', 'Pakistani rupee', 'PKR', '₨', NULL, NULL),
(171, 'Palau', 'United States dollar', 'USD', '$', NULL, NULL),
(172, 'Palestine', 'Israeli new shekel', 'ILS', '₪', NULL, NULL),
(173, 'Panama', 'United States dollar', 'USD', '$', NULL, NULL),
(174, 'Papua New Guinea', 'Papua New Guinean kina', 'PGK', 'K', NULL, NULL),
(175, 'Paraguay', 'Paraguayan guarani', 'PYG', 'Gs', NULL, NULL),
(176, 'Peru', 'Peruvian sol', 'PEN', 'S/.', NULL, NULL),
(177, 'Philippines', 'Philippine peso', 'PHP', 'Php', NULL, NULL),
(178, 'Pitcairn Islands (UK)', 'New Zealand dollar', 'NZD', '$', NULL, NULL),
(179, 'Poland', 'Polish zloty', 'PLN', 'zł', NULL, NULL),
(180, 'Portugal', 'European euro', 'EUR', '€', NULL, NULL),
(181, 'Puerto Rico (USA)', 'United States dollar', 'USD', '$', NULL, NULL),
(182, 'Qatar', 'Qatari riyal', 'QAR', '﷼', NULL, NULL),
(183, 'Reunion (France)', 'European euro', 'EUR', '€', NULL, NULL),
(184, 'Romania', 'Romanian leu', 'RON', 'lei', NULL, NULL),
(185, 'Russia', 'Russian ruble', 'RUB', 'руб', NULL, NULL),
(186, 'Rwanda', 'Rwandan franc', 'RWF', '₣', NULL, NULL),
(187, 'Saba (Netherlands)', 'United States dollar', 'USD', '$', NULL, NULL),
(188, 'Saint Barthelemy (France)', 'European euro', 'EUR', '€', NULL, NULL),
(189, 'Saint Helena (UK)', 'Saint Helena pound', 'SHP', '£', NULL, NULL),
(190, 'Saint Kitts and Nevis', 'East Caribbean dollar', 'XCD', '$', NULL, NULL),
(191, 'Saint Lucia', 'East Caribbean dollar', 'XCD', '$', NULL, NULL),
(192, 'Saint Martin (France)', 'European euro', 'EUR', '€', NULL, NULL),
(193, 'Saint Pierre and Miquelon (France)', 'European euro', 'EUR', '€', NULL, NULL),
(194, 'Saint Vincent and the Grenadines', 'East Caribbean dollar', 'XCD', '$', NULL, NULL),
(195, 'Samoa', 'Samoan tala', 'WST', 'T', NULL, NULL),
(196, 'San Marino', 'European euro', 'EUR', '€', NULL, NULL),
(197, 'Sao Tome and Principe', 'Sao Tome and Principe dobra', 'STN', 'Db', NULL, NULL),
(198, 'Saudi Arabia', 'Saudi Arabian riyal', 'SAR', '﷼', NULL, NULL),
(199, 'Senegal', 'West African CFA franc', 'XOF', 'CFA', NULL, NULL),
(200, 'Serbia', 'Serbian dinar', 'RSD', 'Дин.', NULL, NULL),
(201, 'Seychelles', 'Seychellois rupee', 'SCR', '₨', NULL, NULL),
(202, 'Sierra Leone', 'Sierra Leonean leone', 'SLL', 'Le', NULL, NULL),
(203, 'Singapore', 'Singapore dollar', 'SGD', '$', NULL, NULL),
(204, 'Sint Eustatius (Netherlands)', 'United States dollar', 'USD', '$', NULL, NULL),
(205, 'Sint Maarten (Netherlands)', 'Netherlands Antillean guilder', 'ANG', 'ƒ', NULL, NULL),
(206, 'Slovakia', 'European euro', 'EUR', '€', NULL, NULL),
(207, 'Slovenia', 'European euro', 'EUR', '€', NULL, NULL),
(208, 'Solomon Islands', 'Solomon Islands dollar', 'SBD', '$', NULL, NULL),
(209, 'Somalia', 'Somali shilling', 'SOS', 'S', NULL, NULL),
(210, 'South Africa', 'South African rand', 'ZAR', 'R', NULL, NULL),
(211, 'South Georgia Island (UK)', 'Pound sterling', 'GBP', '£', NULL, NULL),
(212, 'South Korea', 'South Korean won', 'KRW', '₩', NULL, NULL),
(213, 'South Sudan', 'South Sudanese pound', 'SSP', '£', NULL, NULL),
(214, 'Spain', 'European euro', 'EUR', '€', NULL, NULL),
(215, 'Sri Lanka', 'Sri Lankan rupee', 'LKR', '₨', NULL, NULL),
(216, 'Sudan', 'Sudanese pound', 'SDG', '£', NULL, NULL),
(217, 'Suriname', 'Surinamese dollar', 'SRD', '$', NULL, NULL),
(218, 'Svalbard and Jan Mayen (Norway)', 'Norwegian krone', 'NOK', 'kr', NULL, NULL),
(219, 'Sweden', 'Swedish krona', 'SEK', 'kr', NULL, NULL),
(220, 'Switzerland', 'Swiss franc', 'CHF', 'CHF', NULL, NULL),
(221, 'Syria', 'Syrian pound', 'SYP', '£', NULL, NULL),
(222, 'Taiwan', 'New Taiwan dollar', 'TWD', 'NT$', NULL, NULL),
(223, 'Tajikistan', 'Tajikistani somoni', 'TJS', 'ЅМ', NULL, NULL),
(224, 'Tanzania', 'Tanzanian shilling', 'TZS', 'Sh', NULL, NULL),
(225, 'Thailand', 'Thai baht', 'THB', '฿', NULL, NULL),
(226, 'Timor-Leste', 'United States dollar', 'USD', '$', NULL, NULL),
(227, 'Togo', 'West African CFA franc', 'XOF', 'CFA', NULL, NULL),
(228, 'Tokelau (New Zealand)', 'New Zealand dollar', 'NZD', '$', NULL, NULL),
(229, 'Tonga', 'Tongan pa’anga', 'TOP', 'T$', NULL, NULL),
(230, 'Trinidad and Tobago', 'Trinidad and Tobago dollar', 'TTD', 'TT$', NULL, NULL),
(231, 'Tristan da Cunha (UK)', 'Pound sterling', 'GBP', '£', NULL, NULL),
(232, 'Tunisia', 'Tunisian dinar', 'TND', 'د.ت', NULL, NULL),
(233, 'Turkey', 'Turkish lira', 'TRY', '₺', NULL, NULL),
(234, 'Turkmenistan', 'Turkmen manat', 'TMT', 'm', NULL, NULL),
(235, 'Turks and Caicos Islands (UK)', 'United States dollar', 'USD', '$', NULL, NULL),
(236, 'Tuvalu', 'Australian dollar', 'AUD', '$', NULL, NULL),
(237, 'Uganda', 'Ugandan shilling', 'UGX', 'Sh', NULL, NULL),
(238, 'Ukraine', 'Ukrainian hryvnia', 'UAH', '₴', NULL, NULL),
(239, 'United Arab Emirates', 'UAE dirham', 'AED', 'د.إ', NULL, NULL),
(240, 'United Kingdom', 'Pound sterling', 'GBP', '£', NULL, NULL),
(241, 'United States of America', 'United States dollar', 'USD', '$', NULL, NULL),
(242, 'Uruguay', 'Uruguayan peso', 'UYU', '$U', NULL, NULL),
(243, 'US Virgin Islands (USA)', 'United States dollar', 'USD', '$', NULL, NULL),
(244, 'Uzbekistan', 'Uzbekistani som', 'UZS', 'лв', NULL, NULL),
(245, 'Vanuatu', 'Vanuatu vatu', 'VUV', 'Vt', NULL, NULL),
(246, 'Vatican City (Holy See)', 'European euro', 'EUR', '€', NULL, NULL),
(247, 'Venezuela', 'Venezuelan bolivar', 'VES', 'Bs', NULL, NULL),
(248, 'Vietnam', 'Vietnamese dong', 'VND', '₫', NULL, NULL),
(249, 'Wake Island (USA)', 'United States dollar', 'USD', '$', NULL, NULL),
(250, 'Wallis and Futuna (France)', 'CFP franc', 'XPF', '₣', NULL, NULL),
(251, 'Yemen', 'Yemeni rial', 'YER', '﷼', NULL, NULL),
(252, 'Zambia', 'Zambian kwacha', 'ZMW', 'ZK', NULL, NULL),
(253, 'Zimbabwe', 'United States dollar', 'USD', '$', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_type_documents`
--

CREATE TABLE `api_type_documents` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(25) NOT NULL,
  `algoritm` varchar(256) NOT NULL,
  `prefix` varchar(25) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_type_documents`
--

INSERT INTO `api_type_documents` (`id`, `name`, `code`, `algoritm`, `prefix`, `created_at`, `update_at`) VALUES
(1, 'Factura de Venta Nacional', '01', 'CUFE-SHA384', 'fv', NULL, NULL),
(2, 'Factura de Exportación', '02', 'CUFE-SHA384', 'fv', NULL, NULL),
(3, 'Factura de Contingencia', '03', 'CUFE-SHA384', 'fv', NULL, NULL),
(4, 'Nota Crédito', '91', 'CUDE-SHA384', 'nc', NULL, NULL),
(5, 'Nota Débito', '92', 'CUDE-SHA384', 'nd', NULL, NULL),
(6, 'ZIP', 'z', 'zip', 'zip', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_type_environments`
--

CREATE TABLE `api_type_environments` (
  `id` int(24) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `qr_url` varchar(1024) NOT NULL,
  `ws_url` varchar(1024) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Facturacion';

--
-- Volcado de datos para la tabla `api_type_environments`
--

INSERT INTO `api_type_environments` (`id`, `name`, `code`, `qr_url`, `ws_url`, `created_at`, `updated_at`) VALUES
(1, 'Producción', '1', 'https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=', 'https://vpfe.dian.gov.co/WcfDianCustomerServices.svc', '2020-08-03 00:00:00', '2020-08-03 00:00:00'),
(2, 'Desarrollo', '2', 'https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=', 'https://vpfe-hab.dian.gov.co/WcfDianCustomerServices.svc', '2020-08-03 00:00:00', '2020-08-03 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_type_liabilities`
--

CREATE TABLE `api_type_liabilities` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(55) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_type_liabilities`
--

INSERT INTO `api_type_liabilities` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Retención en la fuente a título de renta', 'O-07', NULL, NULL),
(2, 'Retención timbre nacional', 'O-08', NULL, NULL),
(3, 'Retención en la fuente en el impuesto sobre las ventas', 'O-09', NULL, NULL),
(4, 'Gran contribuyente', 'O-13', NULL, NULL),
(5, 'Informante de exógena', 'O-14', NULL, NULL),
(6, 'Autorretenedor', 'O-15', NULL, NULL),
(7, 'Obligación de facturar por ingresos de bienes y/o servicios excluidos', 'O-16', NULL, NULL),
(8, 'Profesionales de compra y venta de divisas', 'O-17', NULL, NULL),
(9, 'Productor y/o exportador de bienes exentos', 'O-19', NULL, NULL),
(10, 'Obligado a cumplir deberes formales a nombre de terceros', 'O-22', NULL, NULL),
(11, 'Agente de retención en el impuesto sobre las ventas', 'O-23', NULL, NULL),
(12, 'Impuesto Nacional a la Gasolina y al ACPM', 'O-32', NULL, NULL),
(13, 'Impuesto Nacional al consumo', 'O-33', NULL, NULL),
(14, 'Régimen simplificado impuesto nacional consumo rest y bares', 'O-34', NULL, NULL),
(15, 'Establecimiento Permanente', 'O-36', NULL, NULL),
(16, 'Obligado a Facturar Electrónicamente Modelo 2242', 'O-37', NULL, NULL),
(17, 'Facturación Electrónica Voluntaria Modelo 2242', 'O-38', NULL, NULL),
(18, 'Proveedor de Servicios Tecnológicos PST Modelo 2242', 'O-39', NULL, NULL),
(19, 'Régimen Simple de Tributación – SIMPLE', 'O-47', NULL, NULL),
(20, 'Impuesto sobre las ventas – IVA', 'O-48', NULL, NULL),
(21, 'No responsable de IVA', 'O-49', NULL, NULL),
(22, 'Facturador electrónico', 'O-52', NULL, NULL),
(23, 'Otro tipo de obligado', 'O-99', NULL, NULL),
(24, 'Clientes del Exterior', 'R-00-PN', NULL, NULL),
(25, 'Factor PN', 'R-12-PN', NULL, NULL),
(26, 'Mandatario', 'R-16-PN', NULL, NULL),
(27, 'Agente Interventor', 'R-25-PN', NULL, NULL),
(28, 'No responsable', 'R-99-PN', NULL, NULL),
(29, 'Apoderado especial', 'R-06-PJ', NULL, NULL),
(30, 'Apoderado general', 'R-07-PJ', NULL, NULL),
(31, 'Factor', 'R-12-PJ', NULL, NULL),
(32, 'Mandatario', 'R-16-PJ', NULL, NULL),
(33, 'Otro tipo de responsable', 'R-99-PJ', NULL, NULL),
(34, 'Agente de carga internacional', 'A-01', NULL, NULL),
(35, 'Agente marítimo', 'A-02', NULL, NULL),
(36, 'Almacén general de depósito', 'A-03', NULL, NULL),
(37, 'Comercializadora internacional (C.I.)', 'A-04', NULL, NULL),
(38, 'Comerciante de la zona aduanera especial de Inírida, Puerto Carreño, Cumaribo y Primavera', 'A-05', NULL, NULL),
(39, 'Comerciantes de la zona de régimen aduanero especial de Leticia', 'A-06', NULL, NULL),
(40, 'Comerciantes de la zona de régimen aduanero especial de Maicao, Uribia y Manaure', 'A-07', NULL, NULL),
(41, 'Comerciantes de la zona de régimen aduanero especial de Urabá, Tumaco y Guapí', 'A-08', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_type_operations`
--

CREATE TABLE `api_type_operations` (
  `id` int(12) NOT NULL,
  `name` varchar(512) NOT NULL,
  `code` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_type_operations`
--

INSERT INTO `api_type_operations` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(13, 'Combustibles', '01', '2020-08-10 00:00:00', '2020-08-10 00:00:00'),
(14, 'Emisor es Autorretenedor', '02', '2020-08-10 00:00:00', '2020-08-10 00:00:00'),
(15, 'Excluidos y Exentos', '03', '2020-08-10 00:00:00', '2020-08-10 00:00:00'),
(16, 'Exportación', '04', '2020-08-10 00:00:00', '2020-08-10 00:00:00'),
(17, 'Genérica', '05', '2020-08-10 00:00:00', '2020-08-10 00:00:00'),
(18, 'Genérica con pago anticipado', '06', '2020-08-10 00:00:00', '2020-08-10 00:00:00'),
(19, 'Genérica con periodo de facturacion', '07', '2020-08-10 00:00:00', '2020-08-10 00:00:00'),
(20, 'Consorcio', '08', '2020-08-10 00:00:00', '2020-08-10 00:00:00'),
(21, 'Servicios AIU', '09', '2020-08-10 00:00:00', '2020-08-10 00:00:00'),
(22, 'Estándar *', '10', '2020-08-10 00:00:00', '2020-08-10 00:00:00'),
(23, 'Mandatos bienes', '11', '2020-08-10 00:00:00', '2020-08-10 00:00:00'),
(24, 'Mandatos Servicios', '12', '2020-08-10 00:00:00', '2020-08-10 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_type_organization`
--

CREATE TABLE `api_type_organization` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_type_organization`
--

INSERT INTO `api_type_organization` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, '1', 'Persona Jurídica', '2020-08-11 00:00:00', '2020-08-11 00:00:00'),
(2, '2', 'Persona Natural', '2020-08-11 00:00:00', '2020-08-11 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_type_regimes`
--

CREATE TABLE `api_type_regimes` (
  `id` int(12) NOT NULL,
  `name` varchar(256) NOT NULL,
  `code` varchar(256) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Facturacion';

--
-- Volcado de datos para la tabla `api_type_regimes`
--

INSERT INTO `api_type_regimes` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'responsable del impuesto sobre las ventas –IVA', '48', '2020-08-03 00:00:00', '2020-08-03 00:00:00'),
(2, 'No responsable de IVA', '49', '2020-08-03 00:00:00', '2020-08-03 00:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `api_billers`
--
ALTER TABLE `api_billers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identification_number` (`identification_number`),
  ADD KEY `Profile` (`profile_id`),
  ADD KEY `Language` (`language_id`),
  ADD KEY `Tax` (`tax_id`),
  ADD KEY `environment` (`type_environment_id`),
  ADD KEY `country` (`country_id`),
  ADD KEY `currency` (`type_currency_id`),
  ADD KEY `organization` (`type_organization_id`),
  ADD KEY `type_regime` (`type_regime_id`),
  ADD KEY `send_method` (`send_method`),
  ADD KEY `nit` (`nit_type_id`),
  ADD KEY `liabilities` (`liability_id`),
  ADD KEY `municipalities` (`municipality_id`);

--
-- Indices de la tabla `api_countries`
--
ALTER TABLE `api_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_delivery_company`
--
ALTER TABLE `api_delivery_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipality` (`municipality_id`),
  ADD KEY `nit_Type` (`nit_type_id`);

--
-- Indices de la tabla `api_delivery_terms`
--
ALTER TABLE `api_delivery_terms`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_departments`
--
ALTER TABLE `api_departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departaments and countri` (`country_id`);

--
-- Indices de la tabla `api_discounts`
--
ALTER TABLE `api_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_facturacion_bank_account_types`
--
ALTER TABLE `api_facturacion_bank_account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_invoices_send_method`
--
ALTER TABLE `api_invoices_send_method`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_item_clasificator`
--
ALTER TABLE `api_item_clasificator`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_languages`
--
ALTER TABLE `api_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_municipalities`
--
ALTER TABLE `api_municipalities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departamentos` (`department_id`);

--
-- Indices de la tabla `api_nit_types`
--
ALTER TABLE `api_nit_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_packages`
--
ALTER TABLE `api_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_payment_methods`
--
ALTER TABLE `api_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_profiles`
--
ALTER TABLE `api_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `Package` (`package_code`);

--
-- Indices de la tabla `api_retention`
--
ALTER TABLE `api_retention`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Taxes` (`taxe_id`);

--
-- Indices de la tabla `api_taxes`
--
ALTER TABLE `api_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_type_currencies`
--
ALTER TABLE `api_type_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_type_documents`
--
ALTER TABLE `api_type_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_type_environments`
--
ALTER TABLE `api_type_environments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_type_liabilities`
--
ALTER TABLE `api_type_liabilities`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_type_operations`
--
ALTER TABLE `api_type_operations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_type_organization`
--
ALTER TABLE `api_type_organization`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_type_regimes`
--
ALTER TABLE `api_type_regimes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `api_billers`
--
ALTER TABLE `api_billers`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `api_countries`
--
ALTER TABLE `api_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT de la tabla `api_delivery_company`
--
ALTER TABLE `api_delivery_company`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;
--
-- AUTO_INCREMENT de la tabla `api_delivery_terms`
--
ALTER TABLE `api_delivery_terms`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `api_departments`
--
ALTER TABLE `api_departments`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `api_discounts`
--
ALTER TABLE `api_discounts`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `api_facturacion_bank_account_types`
--
ALTER TABLE `api_facturacion_bank_account_types`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `api_invoices_send_method`
--
ALTER TABLE `api_invoices_send_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `api_item_clasificator`
--
ALTER TABLE `api_item_clasificator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;
--
-- AUTO_INCREMENT de la tabla `api_languages`
--
ALTER TABLE `api_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
--
-- AUTO_INCREMENT de la tabla `api_municipalities`
--
ALTER TABLE `api_municipalities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1126;
--
-- AUTO_INCREMENT de la tabla `api_nit_types`
--
ALTER TABLE `api_nit_types`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `api_packages`
--
ALTER TABLE `api_packages`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `api_payment_methods`
--
ALTER TABLE `api_payment_methods`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;
--
-- AUTO_INCREMENT de la tabla `api_profiles`
--
ALTER TABLE `api_profiles`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `api_retention`
--
ALTER TABLE `api_retention`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `api_taxes`
--
ALTER TABLE `api_taxes`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `api_type_currencies`
--
ALTER TABLE `api_type_currencies`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;
--
-- AUTO_INCREMENT de la tabla `api_type_documents`
--
ALTER TABLE `api_type_documents`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `api_type_environments`
--
ALTER TABLE `api_type_environments`
  MODIFY `id` int(24) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `api_type_liabilities`
--
ALTER TABLE `api_type_liabilities`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de la tabla `api_type_operations`
--
ALTER TABLE `api_type_operations`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `api_type_organization`
--
ALTER TABLE `api_type_organization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `api_type_regimes`
--
ALTER TABLE `api_type_regimes`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `api_billers`
--
ALTER TABLE `api_billers`
  ADD CONSTRAINT `Language` FOREIGN KEY (`language_id`) REFERENCES `api_languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Profile` FOREIGN KEY (`profile_id`) REFERENCES `api_profiles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Tax` FOREIGN KEY (`tax_id`) REFERENCES `api_taxes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `country` FOREIGN KEY (`country_id`) REFERENCES `api_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `currency` FOREIGN KEY (`type_currency_id`) REFERENCES `api_type_currencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `environment` FOREIGN KEY (`type_environment_id`) REFERENCES `api_type_environments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `liabilities` FOREIGN KEY (`liability_id`) REFERENCES `api_type_liabilities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `municipalities` FOREIGN KEY (`municipality_id`) REFERENCES `api_municipalities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nit` FOREIGN KEY (`nit_type_id`) REFERENCES `api_nit_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `organization` FOREIGN KEY (`type_organization_id`) REFERENCES `api_type_organization` (`id`),
  ADD CONSTRAINT `send_method` FOREIGN KEY (`send_method`) REFERENCES `api_invoices_send_method` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `type_regime` FOREIGN KEY (`type_regime_id`) REFERENCES `api_type_regimes` (`id`);

--
-- Filtros para la tabla `api_delivery_company`
--
ALTER TABLE `api_delivery_company`
  ADD CONSTRAINT `municipality` FOREIGN KEY (`municipality_id`) REFERENCES `api_municipalities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nit_Type` FOREIGN KEY (`nit_type_id`) REFERENCES `api_nit_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `api_departments`
--
ALTER TABLE `api_departments`
  ADD CONSTRAINT `departaments and countri` FOREIGN KEY (`country_id`) REFERENCES `api_countries` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `api_municipalities`
--
ALTER TABLE `api_municipalities`
  ADD CONSTRAINT `departamentos` FOREIGN KEY (`department_id`) REFERENCES `api_departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `api_profiles`
--
ALTER TABLE `api_profiles`
  ADD CONSTRAINT `Package` FOREIGN KEY (`package_code`) REFERENCES `api_packages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `api_retention`
--
ALTER TABLE `api_retention`
  ADD CONSTRAINT `Taxes` FOREIGN KEY (`taxe_id`) REFERENCES `api_taxes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
