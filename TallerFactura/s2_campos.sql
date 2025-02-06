/*
### Esquema en 3NF

1. **Entidad: Cliente**
   - `ClienteID` (PK): Identificador único del cliente.
   - `Nombre`: Nombre del cliente.
   - **Relación**: Un cliente puede tener muchas facturas (1:N con Factura).

2. **Entidad: Vendedor**
   - `VendedorID` (PK): Identificador único del vendedor.
   - `Nombre`: Nombre del vendedor.
   - **Relación**: Un vendedor puede emitir muchas facturas (1:N con Factura).

3. **Entidad: Artículo**
   - `ArticuloID` (PK): Identificador único del artículo.
   - `Descripcion`: Descripción del artículo.
   - `PrecioUnitario`: Precio unitario del artículo.
   - **Relación**: Un artículo puede aparecer en muchos detalles de factura (1:N con DetalleFactura).

4. **Entidad: Factura**
   - `FacturaID` (PK): Identificador único de la factura.
   - `Fecha`: Fecha de la factura.
   - `RTN`: Número de RTN.
   - `TipoFactura`: Tipo de factura.
   - `SubTotal`: Subtotal de la factura.
   - `ISV`: Impuesto sobre ventas.
   - `Total`: Total de la factura.
   - `ContraRecibo`: Número de contra recibo.
   - `FechaEntrega`: Fecha de entrega.
   - `ClienteID` (FK): Referencia al cliente.
   - `VendedorID` (FK): Referencia al vendedor.
   - **Relación**: Una factura pertenece a un cliente y es emitida por un vendedor (N:1 con Cliente y Vendedor).
   - **Relación**: Una factura tiene muchos detalles (1:N con DetalleFactura).

5. **Entidad: DetalleFactura**
   - `DetalleID` (PK): Identificador único del detalle de factura.
   - `FacturaID` (FK): Referencia a la factura.
   - `ArticuloID` (FK): Referencia al artículo.
   - `Cantidad`: Cantidad del artículo en el detalle.
   - `PrecioTotalLinea`: Precio total de la línea del detalle.
   - **Relación**: Un detalle de factura pertenece a una factura y está asociado a un artículo (N:1 con Factura y Artículo).

6. **Entidad: Pago**
   - `PagoID` (PK): Identificador único del pago.
   - `FacturaID` (FK): Referencia a la factura.
   - `MontoTotal`: Monto total del pago.
   - `FechaEmision`: Fecha de emisión del pago.
   - `FechaVencimiento`: Fecha de vencimiento del pago.
   - **Relación**: Un pago corresponde a una factura (1:1 con Factura).
*/

-- Entidad: Factura
CREATE TABLE Factura (
    FacturaID VARCHAR(50) PRIMARY KEY,
    Fecha DATE NOT NULL,
    RTN VARCHAR(50),
    TipoFactura VARCHAR(50),
    SubTotal DECIMAL(10, 2),
    ISV DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    ContraRecibo VARCHAR(50),
    FechaEntrega DATE,
    ClienteID VARCHAR(50),
    VendedorID VARCHAR(50),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (VendedorID) REFERENCES Vendedor(VendedorID)
);

-- Entidad: Cliente
CREATE TABLE Cliente (
    ClienteID VARCHAR(50) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Entidad: Vendedor
CREATE TABLE Vendedor (
    VendedorID VARCHAR(50) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Entidad: Artículo
CREATE TABLE Articulo (
    ArticuloID VARCHAR(50) PRIMARY KEY,
    Descripcion VARCHAR(255) NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL
);

-- Entidad: DetalleFactura
CREATE TABLE DetalleFactura (
    DetalleID VARCHAR(50) PRIMARY KEY,
    FacturaID VARCHAR(50),
    ArticuloID VARCHAR(50),
    Cantidad INT NOT NULL,
    PrecioTotalLinea DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (FacturaID) REFERENCES Factura(FacturaID),
    FOREIGN KEY (ArticuloID) REFERENCES Articulo(ArticuloID)
);

-- Entidad: Pago
CREATE TABLE Pago (
    PagoID VARCHAR(50) PRIMARY KEY,
    FacturaID VARCHAR(50),
    MontoTotal DECIMAL(10, 2) NOT NULL,
    FechaEmision DATE NOT NULL,
    FechaVencimiento DATE NOT NULL,
    FOREIGN KEY (FacturaID) REFERENCES Factura(FacturaID)
);



