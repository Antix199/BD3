-- Datos de ejemplo para la tabla contacto
INSERT INTO contacto (idContacto, Telefono, Correo)
VALUES
(1, '987654321', 'ejemplo1@example.com'),
(2, '123456789', 'ejemplo2@example.com');

-- Datos de ejemplo para la tabla direccion
INSERT INTO direccion (idDireccion, Calle, Numero)
VALUES
(1, 'Calle Principal', 123),
(2, 'Avenida Secundaria', 456);

-- Datos de ejemplo para la tabla especialidad
INSERT INTO especialidad (idespecialidad, nombreEspecialidad, descripcion)
VALUES
(1, 'Entrenador Personal', 'Entrenamiento personalizado'),
(2, 'Yoga', 'Clases de yoga');

-- Datos de ejemplo para la tabla personal
INSERT INTO personal (idPersonal, Nombre, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, Sueldo, contacto_idContacto, especialidad_idespecialidad)
VALUES
(1, 'Juan', 'Pérez', 'González', '1990-05-15', 25000, 1, 1),
(2, 'María', 'García', 'López', '1985-08-20', 30000, 2, 2);

-- Datos de ejemplo para la tabla sala
INSERT INTO sala (idsala, nombreSala)
VALUES
(1, 'Sala de Pesas'),
(2, 'Sala de Yoga');

-- Datos de ejemplo para la tabla entrenamiento
INSERT INTO entrenamiento (idEntrenamiento, Nombre, Personal_idPersonal, sala_idsala)
VALUES
(1, 'Entrenamiento Cardio', 1, 1),
(2, 'Yoga Matutino', 2, 2);

-- Datos de ejemplo para la tabla horario
INSERT INTO horario (idHorario, HorarioInicio, HorarioFinal)
VALUES
(1, '2024-07-01 08:00:00', '2024-07-01 09:00:00'),
(2, '2024-07-01 10:00:00', '2024-07-01 11:00:00');

-- Datos de ejemplo para la tabla horario_entrenamiento
INSERT INTO horario_entrenamiento (Horario_idHorario, Entrenamiento_idEntrenamiento)
VALUES
(1, 1),
(2, 2);

-- Datos de ejemplo para la tabla fechaMembresia
INSERT INTO fechaMembresia (idfechaMembresia, fechaInicio, fechaFinal)
VALUES
(1, '2024-06-01', '2024-07-01'),
(2, '2024-05-01', '2024-06-01');

-- Datos de ejemplo para la tabla membresia
INSERT INTO membresia (idMembresia, Tipo, Costo, fechaMembresia_idfechaMembresia)
VALUES
(1, 'Membresía Premium', 50000, 1),
(2, 'Membresía Básica', 30000, 2);

-- Datos de ejemplo para la tabla usuario
INSERT INTO usuario (idUsuario, RUT, Nombre, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, Membresia_idMembresia, contacto_idContacto, direccion_idDireccion)
VALUES
(1, '12345678-9', 'Luis', 'Martínez', 'Gómez', '1995-10-10', 1, 1, 1),
(2, '87654321-0', 'Ana', 'Rodríguez', 'Fernández', '1992-03-15', 2, 2, 2);

-- Datos de ejemplo para la tabla reserva
INSERT INTO reserva (idReserva, fechaReserva, Entrenamiento_idEntrenamiento, Usuario_idUsuario, Horario_idHorario)
VALUES
(1, '2024-07-01 08:30:00', 1, 1, 1),
(2, '2024-07-01 10:30:00', 2, 2, 2);