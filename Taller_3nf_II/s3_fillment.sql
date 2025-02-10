/*SQL LITE*/
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
('Ernest Hemingway', '1899-07-21');

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
('El viejo y el mar', 10, 1, '1952-09-01', '978-3-16-148419-3', 3);

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
(10, '2023-10-10', '2023-10-24', 'Valeria Morales');

