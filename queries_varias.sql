/* Listar todos los productos de la plataforma */
SELECT DISTINCT nombre_producto FROM publicaciones; 

/* Listar productos de la plataforma por categoría */
WITH productos_seleccionados AS (
    SELECT producto, vendedor 
    FROM categoria
    WHERE categoria = 'Tecnología'
)
SELECT * 
FROM productos
JOIN productos_seleccionados ps
ON productos.producto = ps.producto 
AND productos.vendedor = ps.vendedor;

/* Crear una publicación para vender */
INSERT INTO publicacion (vendedor, nombre_producto, precio, disponible)
VALUES (22222222, 'Bicicleta', 154000, true);

/* Actualizar una publicación de venta */
UPDATE publicacion
SET precio = 160000
WHERE vendedor = 22222222 AND producto = 'Bicicleta';

/* Realizar una compra */
INSERT INTO compras (vendedor, producto, comprador, estado_envio, estado_compra, fecha_de_compra, forma_de_pago)
VALUES (22222222, 'Bicicleta', 12345678, 'EN_PREPARACION', 'COMPRADA', '2024-11-25', 'EFECTIVO');

/* Guardar un envío */
UPDATE compras
SET estado_envio = 'ENTREGADO'
WHERE vendedor = 22222222 AND producto = 'Bicicleta'
AND comprador = 12345678 AND fecha_compra = '2024-11-25'; 

/* Cancelar una compra */
UPDATE compras
SET estado_compra = 'CANCELADO'
WHERE vendedor = 22222222 AND producto = 'Bicicleta'
AND comprador = 12345678 AND fecha_compra = '2024-11-25';

/* Cancelar envío */
UPDATE compras
SET estado_envio = 'CANCELADO'
WHERE vendedor = 22222222 AND producto = 'Bicicleta'
AND comprador = 12345678 AND fecha_compra = '2024-11-25';

/* Ver reputaciones */

/*** Compradores ***/
WITH compras_ultimos_30_dias AS (
    SELECT comprador, SUM(.monto_total) AS total_gastado
    FROM compras
    WHERE fecha_de_compra >= CURDATE() - INTERVAL 30 DAY 
    AND co.estado_compra = 'COMPRADO'
    GROUP BY comprador
),
SELECT c.dni, c.nombre, co.total_gastado AS reputacion
FROM compradores c
JOIN compras_ultimos_30_dias co ON c.dni = co.comprador;

/*** vendedores ***/
WITH ventas_ultimos_30_dias AS (
    SELECT vendedor, SUM(co.monto_total) AS total_cobrado
    FROM compras co
    WHERE co.fecha_de_compra >= CURDATE() - INTERVAL 30 DAY 
    AND co.estado_compra = 'COMPRADO'
    GROUP BY vendedor
),
SELECT v.dni, v.nombre, ve.total_cobrado AS reputacion
FROM vendedores v
JOIN ventas_ultimos_30_dias ve ON v.dni = ve.comprador;

/* Contabilizar la cantidad de ventas de plataforma para un rango de fechas */
SELECT COUNT(*) AS cantidad_de_ventas 
FROM compras co 
WHERE co.fecha_de_compra < '2024-11-25' 
AND co.fecha_de_compra > '2024-11-01' 
AND co.estado_compra = 'COMPRADO';

/* Contabilizar el valor total de ventas de la plataforma para un rango de fechas */
SELECT SUM(co.monto_total) AS valor_total_ventas
FROM compras co
WHERE co.fecha_de_compra < '2024-11-25' 
AND co.fecha_de_compra > '2024-11-01' 
AND co.estado_compra = 'COMPRADA';
