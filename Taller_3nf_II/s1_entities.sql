/*SQL LITE*/
-- Crear tabla Autores
CREATE TABLE Autores (
    autor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(100),
    fecha_nacimiento DATE
);

-- Crear tabla Categorias
CREATE TABLE Categorias (
    categoria_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_categoria VARCHAR(50)
);

-- Crear tabla Libros
CREATE TABLE Libros (
    libro_id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo VARCHAR(255),
    autor_id INTEGER,
    categoria_id INTEGER,
    fecha_publicacion DATE,
    isbn VARCHAR(20),
    cantidad_disponible INTEGER
);

-- Crear tabla Prestamos
CREATE TABLE Prestamos (
    prestamo_id INTEGER PRIMARY KEY AUTOINCREMENT,
    libro_id INTEGER,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    usuario_nombre VARCHAR(100)
);

