-- Listar todos los productos de la plataforma
SELECT DISTINCT producto FROM publicacion; 

-- Listar productos de la plataforma por categoría
SELECT * 
FROM publicacion p
WHERE categoria = 'Tecnología';

-- Crear una publicación para vender
INSERT INTO publicacion (vendedor, producto, categoria, precio, disponible)
VALUES (98765432, 'Bicicleta', 'Deportes', 154000, TRUE);

-- Actualizar una publicación de venta
UPDATE publicacion
SET precio = 160000
WHERE vendedor = 98765432 AND producto = 'Bicicleta';

-- Realizar una compra
INSERT INTO compra (vendedor, producto, comprador, estado_envio, estado_compra, fecha_compra, forma_pago)
VALUES (98765432, 'Bicicleta', 71717171, 'EN PREPARACION', 'COMPRADO', '2024-11-25', 'EFECTIVO');

-- Guardar un envío
UPDATE compra
SET estado_envio = 'RECIBIDO'
WHERE vendedor = 98765432 AND producto = 'Bicicleta'
AND comprador = 71717171 AND fecha_compra = '2024-11-25'; 

-- Cancelar una compra
UPDATE compra
SET estado_compra = 'CANCELADO', estado_envio = 'CANCELADO'
WHERE vendedor = 98765432 
AND producto = 'Bicicleta'
AND comprador = 71717171 
AND fecha_compra = '2024-11-25';

-- Cancelar envío
UPDATE compra
SET estado_envio = 'CANCELADO'
WHERE vendedor = 98765432 AND producto = 'Bicicleta'
AND comprador = 71717171 AND fecha_compra = '2024-11-25';

-- Ver reputaciones

-- Comprador
WITH compras_ultimos_30_dias AS (
    SELECT comprador, SUM(monto_total) AS total_gastado
    FROM compra
    WHERE fecha_compra >= date_trunc('month', CURRENT_DATE) - INTERVAL '1 month'
    AND estado_compra = 'COMPRADO'
    GROUP BY comprador
)
SELECT c.dni, c.nombre, co.total_gastado AS reputacion
FROM comprador c
JOIN compras_ultimos_30_dias co ON c.dni = co.comprador;

-- Vendedor
WITH ventas_ultimos_30_dias AS (
    SELECT vendedor, SUM(monto_total) AS total_cobrado
    FROM compra
    WHERE fecha_compra >= date_trunc('month', CURRENT_DATE) - INTERVAL '1 month'
    AND estado_compra = 'COMPRADO'
    GROUP BY vendedor
)
SELECT v.dni, v.nombre, ve.total_cobrado AS reputacion
FROM vendedor v
JOIN ventas_ultimos_30_dias ve ON v.dni = ve.vendedor;

-- Contabilizar la cantidad de ventas de plataforma para un rango de fechas
SELECT COUNT(*) AS cantidad_de_ventas 
FROM compra
WHERE fecha_compra < '2024-11-28' 
AND fecha_compra > '2024-11-01' 
AND estado_compra = 'COMPRADO';

-- Contabilizar el valor total de ventas de la plataforma para un rango de fechas
SELECT SUM(monto_total) AS valor_total_ventas
FROM compra
WHERE fecha_compra < '2024-11-28' 
AND fecha_compra > '2024-11-01' 
AND estado_compra = 'COMPRADO';
