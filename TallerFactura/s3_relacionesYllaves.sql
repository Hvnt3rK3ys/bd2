/* SQL DIALECT: SQLITE*/
-- Habilitar la modificación del esquema
PRAGMA writable_schema=1;

-- Agregar llaves foráneas a la tabla Factura
UPDATE sqlite_schema
SET sql = replace(sql,
                  'ClienteID VARCHAR(50)',
                  'ClienteID VARCHAR(50), FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)')
WHERE name = 'Factura' AND type = 'table';

UPDATE sqlite_schema
SET sql = replace(sql,
                  'VendedorID VARCHAR(50)',
                  'VendedorID VARCHAR(50), FOREIGN KEY (VendedorID) REFERENCES Vendedor(VendedorID)')
WHERE name = 'Factura' AND type = 'table';

-- Agregar llaves foráneas a la tabla DetalleFactura
UPDATE sqlite_schema
SET sql = replace(sql,
                  'FacturaID VARCHAR(50)',
                  'FacturaID VARCHAR(50), FOREIGN KEY (FacturaID) REFERENCES Factura(FacturaID)')
WHERE name = 'DetalleFactura' AND type = 'table';

UPDATE sqlite_schema
SET sql = replace(sql,
                  'ArticuloID VARCHAR(50)',
                  'ArticuloID VARCHAR(50), FOREIGN KEY (ArticuloID) REFERENCES Articulo(ArticuloID)')
WHERE name = 'DetalleFactura' AND type = 'table';

-- Agregar llave foránea a la tabla Pago
UPDATE sqlite_schema
SET sql = replace(sql,
                  'FacturaID VARCHAR(50)',
                  'FacturaID VARCHAR(50), FOREIGN KEY (FacturaID) REFERENCES Factura(FacturaID)')
WHERE name = 'Pago' AND type = 'table';

-- Deshabilitar la modificación del esquema
PRAGMA writable_schema=0;

-- Habilitar las claves foráneas
PRAGMA foreign_keys = ON;


