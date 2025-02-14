/* Agregar autores con escritores clave de Ciencia Ficción */
INSERT INTO Autores (nombre, fecha_nacimiento) VALUES
('Gabriel Garcia Marquez', '1927-03-06'),
('Mario Vargas Llosa', '1936-03-28'),
('J.K. Rowling', '1965-07-31'),
('George Orwell', '1903-06-25'),
('Isabel Allende', '1942-08-02'),
('Haruki Murakami', '1949-01-12'),
('Agatha Christie', '1890-09-15'),
('Stephen King', '1947-09-21'),
('Jane Austen', '1775-12-16'),
('Ernest Hemingway', '1899-07-21'),
('Isaac Asimov', '1920-01-02'),
('William Gibson', '1948-03-17'),
('Aldous Huxley', '1894-07-26'),
('Ray Bradbury', '1920-08-22'),
('Philip K. Dick', '1928-12-16');

-- Categorías de libros
INSERT INTO Categorias (nombre_categoria) VALUES
('Ficcion'),
('No Ficcion'),
('Ciencia Ficcion'),
('Misterio'),
('Romantico'),
('Fantasia'),
('Historico'),
('Biografico'),
('Autoayuda'),
('Terror');

-- Insertar libros
INSERT INTO Libros (titulo, autor_id, categoria_id, fecha_publicacion, isbn, cantidad_disponible) VALUES
('Cien años de soledad', 1, 1, '1967-06-05', '978-3-16-148410-0', 10),
('La casa verde', 2, 1, '1966-03-17', '978-3-16-148411-7', 5),
('Harry Potter y la piedra filosofal', 3, 6, '1997-06-26', '978-3-16-148412-4', 8),
('1984', 4, 2, '1949-06-08', '978-3-16-148413-1', 12),
('La casa de los espíritus', 5, 1, '1982-06-01', '978-3-16-148414-8', 7),
('Kafka en la orilla', 6, 1, '2002-01-01', '978-3-16-148415-5', 9),
('Asesinato en el Orient Express', 7, 4, '1934-01-01', '978-3-16-148416-2', 6),
('It', 8, 10, '1986-09-15', '978-3-16-148417-9', 4),
('Orgullo y prejuicio', 9, 5, '1813-01-28', '978-3-16-148418-6', 11),
('El viejo y el mar', 10, 1, '1952-09-01', '978-3-16-148419-3', 3),

-- Libros de Ciencia Ficción corregidos con sus autores reales
('Fundación', 11, 3, '1951-06-01', '978-3-16-148420-9', 7),  -- Isaac Asimov
('Neuromante', 12, 3, '1984-07-01', '978-3-16-148421-6', 6),  -- William Gibson
('Un mundo feliz', 13, 3, '1932-08-01', '978-3-16-148422-3', 10), -- Aldous Huxley
('Crónicas marcianas', 14, 3, '1950-05-01', '978-3-16-148423-0', 8), -- Ray Bradbury
('El hombre en el castillo', 15, 3, '1962-10-01', '978-3-16-148424-7', 5); -- Philip K. Dick

-- Insertar préstamos con más registros para pruebas
INSERT INTO Prestamos (libro_id, fecha_prestamo, fecha_devolucion, usuario_nombre) VALUES
(1, '2023-10-01', '2023-10-15', 'Juan Perez'),
(2, '2023-10-02', '2023-10-16', 'Maria Lopez'),
(3, '2023-10-03', '2023-10-17', 'Carlos Gomez'),
(4, '2023-10-04', '2023-10-18', 'Ana Martinez'),
(5, '2023-10-05', '2023-10-19', 'Luis Rodriguez'),
(6, '2023-10-06', '2023-10-20', 'Sofia Diaz'),
(7, '2023-10-07', '2023-10-21', 'Pedro Fernandez'),
(8, '2023-10-08', '2023-10-22', 'Laura Torres'),
(9, '2023-10-09', '2023-10-23', 'Diego Ruiz'),
(10, '2023-10-10', '2023-10-24', 'Valeria Morales'),

-- Más préstamos de libros de Ciencia Ficción
(11, '2023-10-11', '2023-10-25', 'Elena Castro'),
(11, '2023-10-12', '2023-10-26', 'Fernando Lopez'),
(12, '2023-10-13', '2023-10-27', 'Lucia Gomez'),
(12, '2023-10-14', '2023-10-28', 'Javier Romero'),
(13, '2023-10-15', '2023-10-29', 'Andrea Silva'),
(13, '2023-10-16', '2023-10-30', 'Esteban Herrera'),
(14, '2023-10-17', '2023-10-31', 'Monica Rojas'),
(14, '2023-10-18', '2023-11-01', 'Roberto Mejia'),
(15, '2023-10-19', '2023-11-02', 'Daniela Torres'),
(15, '2023-10-20', '2023-11-03', 'Pablo Jimenez');
