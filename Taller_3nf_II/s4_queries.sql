/*SQL Lite*/
-- 1. Títulos de libros en categoría 'Ficción'
SELECT L.titulo 
FROM Libros L
JOIN Categorias C ON L.categoria_id = C.categoria_id
WHERE C.nombre_categoria = 'Ficcion';

-- 2. Libros disponibles por autor
SELECT A.nombre, SUM(L.cantidad_disponible) AS total_disponibles
FROM Autores A
JOIN Libros L ON A.autor_id = L.autor_id
GROUP BY A.autor_id
ORDER BY total_disponibles DESC;

-- 3. Libros publicados después del 2000
SELECT titulo, fecha_publicacion 
FROM Libros 
WHERE CAST(strftime('%Y', fecha_publicacion) AS INTEGER) > 2000;


-- 4. Préstamos por libro
SELECT L.titulo, COUNT(P.prestamo_id) AS total_prestamos
FROM Libros L
LEFT JOIN Prestamos P ON L.libro_id = P.libro_id
GROUP BY L.libro_id
ORDER BY total_prestamos DESC;


-- 5. Usuarios que prestaron libros de 'Ciencia Ficción'
SELECT DISTINCT P.usuario_nombre
FROM Prestamos P
JOIN Libros L ON P.libro_id = L.libro_id
JOIN Categorias C ON L.categoria_id = C.categoria_id
WHERE C.nombre_categoria = 'Ciencia Ficcion';


-- 6. Autor con más libros disponibles
SELECT A.nombre, SUM(L.cantidad_disponible) AS total
FROM Autores A
JOIN Libros L ON A.autor_id = L.autor_id
GROUP BY A.autor_id
ORDER BY total DESC
LIMIT 1;


-- 7. Libros prestados >5 veces y con >3 disponibles
SELECT L.titulo, 
       COUNT(P.prestamo_id) AS prestamos,
       L.cantidad_disponible
FROM Libros L
JOIN Prestamos P ON L.libro_id = P.libro_id
GROUP BY L.libro_id
HAVING prestamos > 5 AND L.cantidad_disponible > 3
ORDER BY prestamos DESC;


-- 8. Libro más reciente por categoría
WITH Recientes AS (
    SELECT categoria_id, MAX(fecha_publicacion) AS fecha
    FROM Libros
    GROUP BY categoria_id
)
SELECT C.nombre_categoria, L.titulo, R.fecha
FROM Recientes R
JOIN Libros L ON R.categoria_id = L.categoria_id AND R.fecha = L.fecha_publicacion
JOIN Categorias C ON L.categoria_id = C.categoria_id
ORDER BY R.fecha DESC;

-- 9. Autores con libros pre-1990 y disponibles
SELECT DISTINCT A.nombre
FROM Autores A
JOIN Libros L ON A.autor_id = L.autor_id
WHERE CAST(strftime('%Y', L.fecha_publicacion) AS INTEGER) < 1990
AND L.cantidad_disponible > 0;

-- 10. Autores con libros prestados >3 veces y disponibles actualmente
SELECT A.nombre,
       COUNT(DISTINCT L.libro_id) AS libros_prestados,
       SUM(L.cantidad_disponible) AS disponibles
FROM Autores A
JOIN Libros L ON A.autor_id = L.autor_id
LEFT JOIN Prestamos P ON L.libro_id = P.libro_id
GROUP BY A.autor_id
HAVING COUNT(P.prestamo_id) > 3
ORDER BY libros_prestados DESC;

