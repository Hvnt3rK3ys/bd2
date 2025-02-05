/*SQL DIALECT: SQLITE*/
-- Inserción de datos en la tabla Cliente
INSERT INTO Cliente (nombre, direccion, telefono) VALUES
('Lenin Salgado', 'Calle 123', '123456789'),
('Maria Lopez', 'Avenida 456', '987654321'),
('Carlos Ruiz', 'Carrera 789', '123456780'),
('Ana Gomez', 'Diagonal 101', '123456782'),
('Juan Martinez', 'Transversal 11', '123456783');

-- Inserción de datos en la tabla Empleado
INSERT INTO Empleado (nombre, cargo) VALUES
('Juan Perez', 'Vendedor'),
('Laura Gutierrez', 'Gerente'),
('Pedro Rodriguez', 'Técnico'),
('Sofia Martinez', 'Contador'),
('Luis Fernandez', 'Asistente');

-- Inserción de datos en la tabla Producto
INSERT INTO Producto (codigo, descripcion, precio) VALUES
('73157013', 'ACEITE DE MOTOR 15-40', 40.00),
('73157812', 'ETC', 180.00),
('E-94218-497-0', 'RELAY PARA RADIO', 625.00),
('80317-16054', 'REFRENDIDOR RUEDA DELANTERA TOYOTA', 750.00),
('1634AMARILLO', 'FOCOS DE STOP AMARILLO', 210.00),
('AT-111-35', 'FUSES NACHITA MINIATURA 35 AMP', 18.00);

-- Inserción de datos en la tabla Factura
INSERT INTO Factura (fecha, id_cliente, id_empleado, subtotal, impuesto, total) VALUES
('2007-10-16', 1, 1, 2601.50, 380.68, 2982.18),
('2007-10-17', 2, 2, 1500.00, 225.00, 1725.00),
('2007-10-18', 3, 3, 3000.00, 450.00, 3450.00),
('2007-10-19', 4, 4, 2000.00, 300.00, 2300.00),
('2007-10-20', 5, 5, 2500.00, 375.00, 2875.00);

-- Inserción de datos en la tabla Detalle_Factura
INSERT INTO Detalle_Factura (id_factura, id_producto, cantidad, precio_unitario, total_producto) VALUES
(1, 1, 1, 40.00, 40.00),
(1, 2, 1, 180.00, 180.00),
(1, 3, 1, 625.00, 625.00),
(1, 4, 1, 750.00, 750.00),
(1, 5, 1, 210.00, 210.00),
(1, 6, 1, 18.00, 18.00),
(2, 1, 2, 40.00, 80.00),
(2, 2, 1, 180.00, 180.00),
(2, 3, 1, 625.00, 625.00),
(2, 4, 1, 750.00, 750.00),
(3, 1, 1, 40.00, 40.00),
(3, 2, 2, 180.00, 360.00),
(3, 3, 1, 625.00, 625.00),
(3, 4, 1, 750.00, 750.00),
(3, 5, 1, 210.00, 210.00),
(4, 1, 1, 40.00, 40.00),
(4, 2, 1, 180.00, 180.00),
(4, 3, 1, 625.00, 625.00),
(4, 4, 1, 750.00, 750.00),
(5, 1, 1, 40.00, 40.00),
(5, 2, 1, 180.00, 180.00),
(5, 3, 1, 625.00, 625.00),
(5, 4, 1, 750.00, 750.00),
(5, 5, 1, 210.00, 210.00),
(5, 6, 1, 18.00, 18.00);