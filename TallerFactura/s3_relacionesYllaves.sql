/*SQL DIALECT: SQLITE*/
-- Habilitar el soporte de claves foráneas
PRAGMA foreign_keys = ON;

-- Eliminar las tablas existentes (si ya fueron creadas)
DROP TABLE IF EXISTS Detalle_Factura;
DROP TABLE IF EXISTS Factura;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Cliente;

-- Recrear las tablas con relaciones

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
    id_cliente INTEGER,
    id_empleado INTEGER,
    subtotal REAL NOT NULL,
    impuesto REAL NOT NULL,
    total REAL NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Creación de la tabla Detalle_Factura
CREATE TABLE Detalle_Factura (
    id_detalle INTEGER PRIMARY KEY AUTOINCREMENT,
    id_factura INTEGER,
    id_producto INTEGER,
    cantidad INT NOT NULL,
    precio_unitario REAL NOT NULL,
    total_producto REAL NOT NULL,
    FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);