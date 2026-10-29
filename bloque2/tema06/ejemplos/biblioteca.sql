-- Base de datos de la biblioteca (Tema 6)
-- Se puede importar en phpMyAdmin: pestaña Importar → elegir este fichero → Importar

SET NAMES utf8mb4;  -- para que las tildes y la ñ se guarden bien

CREATE DATABASE IF NOT EXISTS biblioteca
    CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE biblioteca;

-- Tabla de usuarios (apartado 4.2 del libro)
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(70),
    dni VARCHAR(9),
    libros_leidos INT
);

-- Tabla de libros (caso práctico 2)
CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(70),
    fecha DATE,
    editorial VARCHAR(70)
);

INSERT INTO usuarios (nombre, apellidos, dni, libros_leidos) VALUES
    ('Ana', 'López Martín', '12345678A', 4),
    ('Luis', 'García Ruiz', '87654321B', 1),
    ('Marta', 'Sánchez Gil', '11223344C', 7);

INSERT INTO libros (titulo, autor, fecha, editorial) VALUES
    ('Don Quijote de la Mancha', 'Miguel de Cervantes', '1605-01-16', 'Juan de la Cuesta'),
    ('Cien años de soledad', 'Gabriel García Márquez', '1967-05-30', 'Sudamericana'),
    ('Manolito Gafotas', 'Elvira Lindo', '1994-03-01', 'Alfaguara'),
    ('El Hobbit', 'J. R. R. Tolkien', '1937-09-21', 'Minotauro');
