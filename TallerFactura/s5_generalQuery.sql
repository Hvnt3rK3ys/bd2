/*SQL DIALECT: SQLITE*/
SELECT
    f.FacturaID,
    f.Fecha,
    f.RTN,
    f.TipoFactura,
    f.SubTotal,
    f.ISV,
    f.Total,
    f.ContraRecibo,
    f.FechaEntrega,
    c.Nombre AS Cliente,
    v.Nombre AS Vendedor,
    d.DetalleID,
    a.Descripcion AS Articulo,
    d.Cantidad,
    d.PrecioTotalLinea,
    p.MontoTotal AS MontoPago,
    p.FechaEmision AS FechaPago,
    p.FechaVencimiento AS FechaVencimientoPago
FROM
    Factura f
JOIN
    Cliente c ON f.ClienteID = c.ClienteID
JOIN
    Vendedor v ON f.VendedorID = v.VendedorID
JOIN
    DetalleFactura d ON f.FacturaID = d.FacturaID
JOIN
    Articulo a ON d.ArticuloID = a.ArticuloID
JOIN
    Pago p ON f.FacturaID = p.FacturaID
WHERE
    f.FacturaID = 'F001';  -- Cambia 'F001' por el ID de la factura que deseas consultar

