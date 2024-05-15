-- BASE DE DATOS PARA APLICACIÓN DE SEGUIMIENTO DE TAREAS --
-- Autor: Alejandro Rubio Rico -- 

DROP DATABASE IF EXISTS TAREAS;

CREATE DATABASE TAREAS;

USE TAREAS;

-- Creación de la tabla Departamento
CREATE TABLE IF NOT EXISTS Departamento(
    ID_Departamento INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL
);

-- Creación de la tabla Usuario
CREATE TABLE Usuario (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Rol VARCHAR(255) NOT NULL,
    ID_Departamento INT,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);



-- Creación de la tabla Tarea
CREATE TABLE Tarea (
    ID_Tarea INT AUTO_INCREMENT PRIMARY KEY,
    Descripción TEXT,
    Fecha DATE,
    Horas_Previstas INT,
    Horas_Ejecutadas INT,
    Reunion BOOLEAN,
    Completada BOOLEAN,
    ID_Usuario INT,
    ID_Tangible INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

-- Creación de la tabla Proyecto
CREATE TABLE Proyecto (
    ID_Proyecto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripción TEXT,
    ID_Usuario INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

-- Creación de la tabla Tangibles
CREATE TABLE Tangibles (
    ID_Tangible INT AUTO_INCREMENT PRIMARY KEY,
    Descripción TEXT,
    Cantidad INT,
    ID_Proyecto INT
);

-- Relación Tareas-Tangibles (n-1)
ALTER TABLE Tarea ADD FOREIGN KEY (ID_Tangible) REFERENCES Tangibles(ID_Tangible);

-- Relación Proyectos-Tangibles (1-n)
ALTER TABLE Tangibles ADD FOREIGN KEY (ID_Proyecto) REFERENCES Proyecto(ID_Proyecto);

-- Relación Área-Usuarios (1-n)
ALTER TABLE Usuario ADD FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento);
