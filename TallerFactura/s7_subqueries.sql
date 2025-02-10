/*Calculo del IVA*/
SELECT
    f.FacturaID,
    f.Fecha,
    f.RTN,
    f.TipoFactura,
    f.SubTotal,
    (SELECT SUM(d.PrecioTotalLinea) * 0.10
     FROM DetalleFactura d
     WHERE d.FacturaID = f.FacturaID) AS ISV
FROM
    Factura f
WHERE
    f.FacturaID = '00254';
/*Calculo del total de los productos*/

SELECT
    f.FacturaID,
    f.Fecha,
    f.RTN,
    f.TipoFactura,
    f.SubTotal,
    (SELECT SUM(d.PrecioTotalLinea) * 0.10
     FROM DetalleFactura d
     WHERE d.FacturaID = f.FacturaID) AS ISV,
    (f.SubTotal + (SELECT SUM(d.PrecioTotalLinea) * 0.10
                   FROM DetalleFactura d
                   WHERE d.FacturaID = f.FacturaID)) AS Total
FROM
    Factura f
WHERE
    f.FacturaID = '00254';
