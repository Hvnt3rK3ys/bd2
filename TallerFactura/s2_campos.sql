-- Modelo Entidad-Relación (ER)
-- Entidades y Atributos:

-- Entidad Cliente
-- id_cliente (PK), nombre, direccion, telefono
-- Relación: Un cliente puede tener muchas facturas (1:N con Factura).

-- Entidad Empleado
-- id_empleado (PK), nombre, cargo
-- Relación: Un empleado puede emitir muchas facturas (1:N con Factura).

-- Entidad Producto
-- id_producto (PK), codigo, descripcion, precio
-- Relación: Un producto puede aparecer en muchos detalles de factura (1:N con Detalle_Factura).

-- Entidad Factura
-- id_factura (PK), fecha, id_cliente (FK), id_empleado (FK), subtotal, impuesto, total
-- Relación: Una factura pertenece a un cliente y es emitida por un empleado (N:1 con Cliente y Empleado).
--           Una factura tiene muchos detalles (1:N con Detalle_Factura).

-- Entidad Detalle_Factura
-- id_detalle (PK), id_factura (FK), id_producto (FK), cantidad, precio_unitario, total_producto
-- Relación: Un detalle de factura pertenece a una factura y está asociado a un producto (N:1 con Factura y Producto).


/*SQL DIALECT: SQLITE*/
-- Creación de la tabla Cliente
CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20)
);

-- Creación de la tabla Empleado
CREATE TABLE Empleado (
    id_empleado INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(50)
);

-- Creación de la tabla Producto
CREATE TABLE Producto (
    id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    precio REAL NOT NULL
);

-- Creación de la tabla Factura
CREATE TABLE Factura (
    id_factura INTEGER PRIMARY KEY AUTOINCREMENT,
    fecha DATE NOT NULL,
    subtotal REAL NOT NULL,
    impuesto REAL NOT NULL,
    total REAL NOT NULL
);

-- Creación de la tabla Detalle_Factura
CREATE TABLE Detalle_Factura (
    id_detalle INTEGER PRIMARY KEY AUTOINCREMENT,
    cantidad INT NOT NULL,
    precio_unitario REAL NOT NULL,
    total_producto REAL NOT NULL
);