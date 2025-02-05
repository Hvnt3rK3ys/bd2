/*SQL DIALECT: SQLITE*/
SELECT 
    Cliente.id_cliente,
    Cliente.nombre AS nombre_cliente,
    Cliente.direccion,
    Cliente.telefono,
    Empleado.id_empleado,
    Empleado.nombre AS nombre_empleado,
    Empleado.cargo,
    Factura.id_factura,
    Factura.fecha,
    Factura.subtotal,
    Factura.impuesto,
    Factura.total AS total_factura,
    Producto.id_producto,
    Producto.codigo,
    Producto.descripcion,
    Producto.precio AS precio_unitario_producto,
    Detalle_Factura.cantidad,
    Detalle_Factura.precio_unitario,
    Detalle_Factura.total_producto
FROM 
    Factura
    INNER JOIN Cliente ON Factura.id_cliente = Cliente.id_cliente
    INNER JOIN Empleado ON Factura.id_empleado = Empleado.id_empleado
    INNER JOIN Detalle_Factura ON Factura.id_factura = Detalle_Factura.id_factura
    INNER JOIN Producto ON Detalle_Factura.id_producto = Producto.id_producto;