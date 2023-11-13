-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 13, 2023 at 04:00 AM
-- Server version: 8.0.30
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ipsmatazanos`
--

-- --------------------------------------------------------

--
-- Table structure for table `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id_calificacion` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_medico` int DEFAULT NULL,
  `id_cita` int DEFAULT NULL,
  `valoracion` int DEFAULT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `citas`
--

CREATE TABLE `citas` (
  `id_cita` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_medico` int DEFAULT NULL,
  `especialidad` varchar(50) DEFAULT NULL,
  `fecha_hora_cita` datetime DEFAULT NULL,
  `estado_cita` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `citas`
--

INSERT INTO `citas` (`id_cita`, `id_usuario`, `id_medico`, `especialidad`, `fecha_hora_cita`, `estado_cita`) VALUES
(1, 1, 1, 'Ginecologia', '2020-10-02 11:00:00', 'Atendida');

-- --------------------------------------------------------

--
-- Table structure for table `espacios`
--

CREATE TABLE `espacios` (
  `id_espacio` int NOT NULL,
  `nombre_espacio` varchar(100) DEFAULT NULL,
  `tipo_espacio` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `espacios`
--

INSERT INTO `espacios` (`id_espacio`, `nombre_espacio`, `tipo_espacio`, `descripcion`, `ubicacion`) VALUES
(1, 'Consultorio 1', 'Consultorio Medico', 'Espacio de Consulta', 'Clinica las americas'),
(2, 'Consultorio 2', 'Consultorio Medico', 'Espacio de Consulta', 'Clinica las americas'),
(3, 'Consultorio 3', 'Consultorio Medico', 'Espacio de Consulta', 'Clinica las americas');

-- --------------------------------------------------------

--
-- Table structure for table `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int NOT NULL,
  `nombre_especialidad` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `especialidades`
--

INSERT INTO `especialidades` (`id_especialidad`, `nombre_especialidad`, `descripcion`) VALUES
(1, 'ginecologia', 'desc'),
(2, 'medicina general', 'desc'),
(3, 'ortopedia', 'desc'),
(4, 'Ginecología', 'B'),
(5, 'Pediatría', 'C'),
(6, 'Oncología', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `historial_usuario`
--

CREATE TABLE `historial_usuario` (
  `id_historial` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_cita` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `comentario` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `horario`
--

CREATE TABLE `horario` (
  `id_horario` int NOT NULL,
  `id_medico` int DEFAULT NULL,
  `dia` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `horario`
--

INSERT INTO `horario` (`id_horario`, `id_medico`, `dia`, `hora_inicio`, `hora_fin`) VALUES
(1, 1, '2023-10-29', '06:00:00', '18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `medico`
--

CREATE TABLE `medico` (
  `id_medico` int NOT NULL,
  `id_espacio` int DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `id_especialidad` int DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medico`
--

INSERT INTO `medico` (`id_medico`, `id_espacio`, `nombre`, `apellido`, `id_especialidad`, `correo_electronico`) VALUES
(1, 1, 'Sara', 'Perez', 4, 'perezraul@gmail.com'),
(2, 3, 'Teresa', 'Perez', 5, 'perezraul@gmail.com'),
(3, 2, 'Sofia', 'Perez', 6, 'perezraul@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id_rol` int DEFAULT NULL,
  `name_rol` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id_rol`, `name_rol`) VALUES
(1, 'Paciente'),
(2, 'Medico'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `id_rol` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `correo_electronico`, `contrasena`, `id_rol`) VALUES
(1, 'Sacha', 'Rodriguez', '3105045602', 'rodrisacha@gmail.com', 'sa12345', 2),
(2, 'Rafaela', 'Sanchez', '3216078432', 'sanchezRa@gmail.com', 'ra12345', 1),
(3, 'Juan Pablo', 'Alvira', '3045667550', 'juanpalv@gmail.com', 'ju12345', 1),
(4, 'Gustavo', 'Marin', '3105097302', 'marincho@gmail.com', 'gus12345', 1),
(5, 'Ramona', 'Pino', '31110456985', 'ramona708@gmail.com', 'mona12345', 1),
(10, 'maicol', 'Arroyave ', '3128797122', 'maicol@gmail.com', '$2y$10$k/gKHNdcv5VGb1N5AMJ.QORwkPWICKZhSpWYX9PZJxRYpjDiT5puy', 1),
(11, 'deiby', 'Arroyave ', '3128797122', 'deiby@gmail.com', '$2y$10$SjPEHEdR/iPeQcxQY1IqxOxF25uZNa30.6KdWtnO5/7D8k.bkYB5G', 1),
(13, 'ana', 'Arroyave ', '3128797122', 'ana@gmail.com', '$2y$10$sScCHAF8jDaT1oHWHXv.1.l6yIfiI.DgRFo995jjRqEzo8oOOIJKy', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id_calificacion`);

--
-- Indexes for table `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indexes for table `espacios`
--
ALTER TABLE `espacios`
  ADD PRIMARY KEY (`id_espacio`);

--
-- Indexes for table `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indexes for table `historial_usuario`
--
ALTER TABLE `historial_usuario`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_cita` (`id_cita`);

--
-- Indexes for table `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD KEY `id_especialidad` (`id_especialidad`),
  ADD KEY `id_espacio` (`id_espacio`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD KEY `idx_id_rol` (`id_rol`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_rol` (`id_rol`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`);

--
-- Constraints for table `historial_usuario`
--
ALTER TABLE `historial_usuario`
  ADD CONSTRAINT `historial_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `historial_usuario_ibfk_2` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`);

--
-- Constraints for table `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`);

--
-- Constraints for table `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`),
  ADD CONSTRAINT `medico_ibfk_2` FOREIGN KEY (`id_espacio`) REFERENCES `espacios` (`id_espacio`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
