-- Crear la base de datos (si no existe)
CREATE DATABASE IF NOT EXISTS peliculas_db;
USE peliculas_db;

-- Crear la tabla de directores
CREATE TABLE IF NOT EXISTS directores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla de géneros
CREATE TABLE IF NOT EXISTS generos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Crear la tabla de películas
CREATE TABLE IF NOT EXISTS peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    anio INT NOT NULL,
    duracion INT NOT NULL,
    director_id INT NULL,
    genero_id INT NOT NULL,
    FOREIGN KEY (director_id) REFERENCES directores(id),
    FOREIGN KEY (genero_id) REFERENCES generos(id)
);

-- Insertar datos en la tabla directores
INSERT INTO directores (nombre) VALUES
('Quentin Tarantino'),
('Christopher Nolan'),
('Steven Spielberg'),
('Martin Scorsese'),
('James Cameron');

-- Insertar datos en la tabla generos
INSERT INTO generos (nombre) VALUES
('Acción'),
('Ciencia Ficción'),
('Drama'),
('Terror'),
('Comedia'),
('Animación');

-- Insertar datos en la tabla películas
INSERT INTO peliculas (titulo, anio, duracion, director_id, genero_id) VALUES
('Pulp Fiction', 1994, 154, 1, 3),
('Django Unchained', 2012, 165, 1, 3),
('Origen', 2010, 148, 2, 2),
('Interstellar', 2014, 169, 2, 2),
('Jurassic Park', 1993, 127, 3, 2),
('Salvad al soldado Ryan', 1998, 169, 3, 3),
('El lobo de  Wall Street', 2013, 180, 4, 3),
('Avatar', 2009, 162, 5, 2),
('Titanic', 1997, 195, 5, 3),
('El caballero oscuro', 2008, 152, 2, 1),
('Shrek', 2001, 90, NULL, 6),
('El rey León', 1994, 88, NULL, 6),
('Déjame Salir', 2017, 104, NULL, 4),
('Expediente Warren', 2013, 112, NULL, 4),
('Supersalidos', 2007, 113, NULL, 5);
