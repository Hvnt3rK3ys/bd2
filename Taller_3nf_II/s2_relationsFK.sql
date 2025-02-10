/*SQL LITE*/
-- Habilitar la modificación del esquema
PRAGMA writable_schema=1;

-- Agregar llaves foráneas a la tabla Libros
UPDATE sqlite_schema
SET sql = replace(sql, 'autor_id INTEGER', 'autor_id INTEGER, FOREIGN KEY (autor_id) REFERENCES Autores(autor_id)')
WHERE name = 'Libros' AND type = 'table';

UPDATE sqlite_schema
SET sql = replace(sql, 'categoria_id INTEGER', 'categoria_id INTEGER, FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)')
WHERE name = 'Libros' AND type = 'table';

-- Agregar llaves foráneas a la tabla Prestamos
UPDATE sqlite_schema
SET sql = replace(sql, 'libro_id INTEGER', 'libro_id INTEGER, FOREIGN KEY (libro_id) REFERENCES Libros(libro_id)')
WHERE name = 'Prestamos' AND type = 'table';

-- Deshabilitar la modificación del esquema
PRAGMA writable_schema=0;

-- Habilitar las claves foráneas
PRAGMA foreign_keys = ON;

