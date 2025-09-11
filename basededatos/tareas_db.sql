
-- Base de datos: `tareas_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL CHECK (`estado` between 0 and 100),
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `dentro_tiempo` enum('Si','No') NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas_padre`
--

CREATE TABLE `tareas_padre` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tareas_padre`
--

INSERT INTO `tareas_padre` (`id`, `nombre`) VALUES
(1, 'Tarea A'),
(2, 'Tarea B'),
(3, 'Tarea C'),
(4, 'Tarea D'),
(5, 'Tarea E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea_padre`
--

CREATE TABLE `tarea_padre` (
  `tarea_id` int(11) NOT NULL,
  `padre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea_tipos`
--

CREATE TABLE `tarea_tipos` (
  `tarea_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_tarea`
--

CREATE TABLE `tipos_tarea` (
  `id` int(11) NOT NULL,
  `nombre` enum('código','grafismo','test','bug','documentacion') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_tarea`
--

INSERT INTO `tipos_tarea` (`id`, `nombre`) VALUES
(1, 'código'),
(2, 'grafismo'),
(3, 'test'),
(4, 'bug'),
(5, 'documentacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cargo` enum('desarrollador','grafista','QA','Jefe de equipo','IT') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `tareas_padre`
--
ALTER TABLE `tareas_padre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarea_padre`
--
ALTER TABLE `tarea_padre`
  ADD PRIMARY KEY (`tarea_id`,`padre_id`),
  ADD KEY `padre_id` (`padre_id`);

--
-- Indices de la tabla `tarea_tipos`
--
ALTER TABLE `tarea_tipos`
  ADD PRIMARY KEY (`tarea_id`,`tipo_id`),
  ADD KEY `tipo_id` (`tipo_id`);

--
-- Indices de la tabla `tipos_tarea`
--
ALTER TABLE `tipos_tarea`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `tareas_padre`
--
ALTER TABLE `tareas_padre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipos_tarea`
--
ALTER TABLE `tipos_tarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tarea_padre`
--
ALTER TABLE `tarea_padre`
  ADD CONSTRAINT `tarea_padre_ibfk_1` FOREIGN KEY (`tarea_id`) REFERENCES `tareas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tarea_padre_ibfk_2` FOREIGN KEY (`padre_id`) REFERENCES `tareas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tarea_tipos`
--
ALTER TABLE `tarea_tipos`
  ADD CONSTRAINT `tarea_tipos_ibfk_1` FOREIGN KEY (`tarea_id`) REFERENCES `tareas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tarea_tipos_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `tipos_tarea` (`id`) ON DELETE CASCADE;
COMMIT;

