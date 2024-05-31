-- BASE DE DATOS PARA APLICACIÓN DE SEGUIMIENTO DE TAREAS -- 

DROP DATABASE IF EXISTS TAREAS;

-- BASE DE DATOS PARA APLICACIÓN DE SEGUIMIENTO DE TAREAS -- 

DROP DATABASE IF EXISTS tareas;

CREATE DATABASE tareas;

USE tareas;

-- Creación de la tabla departamento
CREATE TABLE departamento (
    idDepartamento BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
    nombre VARCHAR(255) NOT NULL
);

-- Creación de la tabla usuario
CREATE TABLE usuario (
    idUsuario BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    rol VARCHAR(255) NOT NULL,
    idDepartamento BIGINT NOT NULL,
    FOREIGN KEY (idDepartamento) REFERENCES departamento(idDepartamento)
);

-- Creación de la tabla proyecto
CREATE TABLE proyecto (
    idProyecto BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    idUsuario BIGINT NOT NULL,  
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);

-- Creación de la tabla tangibles
CREATE TABLE tangibles (
    idTangible BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    idProyecto BIGINT NOT NULL,
    FOREIGN KEY (idProyecto) REFERENCES proyecto(idProyecto)
);

-- Creación de la tabla tarea
CREATE TABLE tarea (
    idTarea BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    horas_previstas DOUBLE NOT NULL,
    horas_ejecutadas DOUBLE,
    completada BOOLEAN,
    reunion BOOLEAN,
    idUsuario BIGINT NOT NULL,
    idTangible BIGINT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
    FOREIGN KEY (idTangible) REFERENCES tangibles(idTangible)
);



-- Inicialización datos de prueba -- 

-- departamentos
INSERT INTO departamento (nombre) VALUES ('EUE');
INSERT INTO departamento (nombre) VALUES ('Redes');
INSERT INTO departamento (nombre) VALUES ('Software');
INSERT INTO departamento (nombre) VALUES ('GESTIN');


-- usuarios
INSERT INTO usuario (nombre, rol, idDepartamento) VALUES ('Andrés', 'CoordinadorArea', 1);
INSERT INTO usuario (nombre, rol, idDepartamento) VALUES ('Laura', 'CoordinadorProyectos', 1);
INSERT INTO usuario (nombre, rol, idDepartamento) VALUES ('Alejandro', 'CoordinadorProyectos', 1);
INSERT INTO usuario (nombre, rol, idDepartamento) VALUES ('Luis', 'Recurso', 1);
INSERT INTO usuario (nombre, rol, idDepartamento) VALUES ('Amalia', 'Recurso', 1);
INSERT INTO usuario (nombre, rol, idDepartamento) VALUES ('Pedro', 'Recurso', 1);
INSERT INTO usuario (nombre, rol, idDepartamento) VALUES ('Fernando', 'Recurso', 1);
INSERT INTO usuario (nombre, rol, idDepartamento) VALUES ('Javi', 'Recurso', 1);


-- Proyectos
INSERT INTO proyecto (nombre, descripcion, idUsuario) VALUES ('Proyecto Alpha', 'Proyecto Alpha', 3);
INSERT INTO proyecto (nombre, descripcion, idUsuario) VALUES ('Proyecto Beta', 'Proyecto Beta', 2);

-- tangibles
INSERT INTO tangibles (descripcion, idProyecto) VALUES ('Servidor de desarrollo', 1);
INSERT INTO tangibles (descripcion, idProyecto) VALUES ('Material de publicidad', 2);

-- Insertar tareas
INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Configuración del servidor', '2023-05-01', 8.0, 7.5, TRUE, FALSE, 2, 1);
INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Desarrollo del modulo de autenticación', '2023-05-02', 16.0, 15.0, TRUE, FALSE, 3, 1);
INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Diseño de flyers', '2023-05-03', 10.0, NULL, FALSE, FALSE, 4, 2);
INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Reunión de coordinación', '2023-05-04', 2.0, 2.0, TRUE, TRUE, 1, 2);


INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Poner al dia correos', '2024-05-23', 2.0, NULL, FALSE, FALSE, 1, 1);

INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Llamada con el cliente', '2024-05-23', 1.0, NULL, FALSE, FALSE, 2, 2);

INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Estudio casos de uso', '2024-05-23', 1.0, NULL, FALSE, TRUE, 2, 2);

INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Definir accion', '2024-05-23', 1.0, NULL, TRUE, TRUE, 2, 2);

INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Trabajar en el informe de marketing', '2024-05-23', 4.0, NULL, FALSE, TRUE, 2, 2);

INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Revisar reuniones', '2024-05-29', 3.0, NULL, FALSE, FALSE, 2, 2);

INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Revisar propuestas', '2024-05-28', 3.0, NULL, FALSE, FALSE, 2, 2);

INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Coordinar reunión de equipo', '2024-05-28', 2.0, NULL, FALSE, TRUE, 2, 3);

INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Actualizar plan de proyecto', '2024-05-28', 1.5, NULL, FALSE, FALSE, 2, 4);

INSERT INTO tarea (descripcion, fecha, horas_previstas, horas_ejecutadas, completada, reunion, idUsuario, idTangible) 
VALUES ('Realizar análisis de mercado', '2024-05-28', 4.0, NULL, FALSE, FALSE, 2, 5);


