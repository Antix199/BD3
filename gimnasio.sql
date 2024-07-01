-- -----------------------------------------------------
-- Schema gimnasio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table gimnasio.contacto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS contacto (
  idContacto INTEGER PRIMARY KEY,
  Telefono VARCHAR(45) NULL,
  Correo VARCHAR(45) NULL
);

-- -----------------------------------------------------
-- Table gimnasio.direccion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS direccion (
  idDireccion INTEGER PRIMARY KEY,
  Calle VARCHAR(45) NULL,
  Numero INTEGER NULL
);

-- -----------------------------------------------------
-- Table gimnasio.especialidad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS especialidad (
  idespecialidad INTEGER PRIMARY KEY,
  nombreEspecialidad VARCHAR(45) NULL,
  descripcion VARCHAR(45) NULL
);

-- -----------------------------------------------------
-- Table gimnasio.personal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS personal (
  idPersonal INTEGER PRIMARY KEY,
  Nombre VARCHAR(45) NULL,
  ApellidoPaterno VARCHAR(45) NULL,
  ApellidoMaterno VARCHAR(45) NULL,
  FechaNacimiento DATE NULL,
  Sueldo INTEGER NULL,
  contacto_idContacto INTEGER NOT NULL,
  especialidad_idespecialidad INTEGER NOT NULL,
  FOREIGN KEY (contacto_idContacto) REFERENCES contacto (idContacto),
  FOREIGN KEY (especialidad_idespecialidad) REFERENCES especialidad (idespecialidad)
);

-- -----------------------------------------------------
-- Table gimnasio.sala
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sala (
  idsala INTEGER PRIMARY KEY,
  nombreSala VARCHAR(45) NULL
);

-- -----------------------------------------------------
-- Table gimnasio.entrenamiento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS entrenamiento (
  idEntrenamiento INTEGER PRIMARY KEY,
  Nombre VARCHAR(45) NULL,
  Personal_idPersonal INTEGER NOT NULL,
  sala_idsala INTEGER NOT NULL,
  FOREIGN KEY (Personal_idPersonal) REFERENCES personal (idPersonal),
  FOREIGN KEY (sala_idsala) REFERENCES sala (idsala)
);

-- -----------------------------------------------------
-- Table gimnasio.horario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS horario (
  idHorario INTEGER PRIMARY KEY,
  HorarioInicio DATETIME NULL,
  HorarioFinal DATETIME NULL
);

-- -----------------------------------------------------
-- Table gimnasio.horario_entrenamiento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS horario_entrenamiento (
  Horario_idHorario INTEGER NOT NULL,
  Entrenamiento_idEntrenamiento INTEGER NOT NULL,
  PRIMARY KEY (Horario_idHorario, Entrenamiento_idEntrenamiento),
  FOREIGN KEY (Horario_idHorario) REFERENCES horario (idHorario),
  FOREIGN KEY (Entrenamiento_idEntrenamiento) REFERENCES entrenamiento (idEntrenamiento)
);

-- -----------------------------------------------------
-- Table gimnasio.fechaMembresia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS fechaMembresia (
  idfechaMembresia INTEGER PRIMARY KEY,
  fechaInicio DATE NULL,
  fechaFinal DATE NULL
);

-- -----------------------------------------------------
-- Table gimnasio.membresia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS membresia (
  idMembresia INTEGER PRIMARY KEY,
  Tipo VARCHAR(45) NULL,
  Costo INTEGER NULL,
  fechaMembresia_idfechaMembresia INTEGER NOT NULL,
  FOREIGN KEY (fechaMembresia_idfechaMembresia) REFERENCES fechaMembresia (idfechaMembresia)
);

-- -----------------------------------------------------
-- Table gimnasio.usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario (
  idUsuario INTEGER PRIMARY KEY,
  RUT VARCHAR(45) NULL,
  Nombre VARCHAR(45) NULL,
  ApellidoPaterno VARCHAR(45) NULL,
  ApellidoMaterno VARCHAR(45) NULL,
  FechaNacimiento DATE NULL,
  Membresia_idMembresia INTEGER NOT NULL,
  contacto_idContacto INTEGER NOT NULL,
  direccion_idDireccion INTEGER NOT NULL,
  FOREIGN KEY (Membresia_idMembresia) REFERENCES membresia (idMembresia),
  FOREIGN KEY (contacto_idContacto) REFERENCES contacto (idContacto),
  FOREIGN KEY (direccion_idDireccion) REFERENCES direccion (idDireccion)
);

-- -----------------------------------------------------
-- Table gimnasio.reserva
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS reserva (
  idReserva INTEGER PRIMARY KEY,
  fechaReserva DATETIME NULL,
  Entrenamiento_idEntrenamiento INTEGER NOT NULL,
  Usuario_idUsuario INTEGER NOT NULL,
  Horario_idHorario INTEGER NOT NULL,
  FOREIGN KEY (Entrenamiento_idEntrenamiento) REFERENCES entrenamiento (idEntrenamiento),
  FOREIGN KEY (Usuario_idUsuario) REFERENCES usuario (idUsuario),
  FOREIGN KEY (Horario_idHorario) REFERENCES horario (idHorario)
);

