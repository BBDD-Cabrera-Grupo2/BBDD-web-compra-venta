/* Listar todos los productos de la plataforma */
SELECT * FROM productos; 

/* Listar productos de la plataforma por categoría */
SELECT * 
FROM productos
WHERE categoria = 'Tecnología'; 

/* Crear una publicación para vender */
INSERT INTO publicacion (vendedor, producto, precio)
VALUES (22222222, 'Bicicleta', 154000);

/* Actualizar una publicación de venta */
UPDATE publicacion
SET precio = 160000
WHERE vendedor = 22222222 AND producto = 'Bicicleta';

/* Realizar una compra */
INSERT INTO producto_comprado (vendedor, producto, comprador, estado_envio, estado_compra, fecha_de_compra, forma_de_pago)
VALUES (22222222, 'Bicicleta', 12345678, 'EN_PREPARACION', 'COMPRADA', '2024-11-25', 'EFECTIVO');

/* Guardar un envío */
UPDATE producto_comprado
SET estado_envio = 'ENTREGADO'
WHERE vendedor = 22222222 AND producto = 'Bicicleta';

/* Cancelar una compra */
UPDATE producto_comprado
SET estado_compra = 'CANCELADO'
WHERE vendedor = 22222222 AND producto = 'Bicicleta';

/* Cancelar envío */
UPDATE producto_comprado
SET estado_envio = 'CANCELADO'
WHERE vendedor = 22222222 AND producto = 'Bicicleta';

/* Ver reputaciones */

/*** compradores ***/
WITH compras_ultimos_30_dias AS (
    SELECT comprador, SUM(p.precio) AS total_gastado
    FROM producto_comprado pc
    JOIN publicacion p ON pc.vendedor = p.vendedor AND pc.producto = p.producto
    WHERE pc.fecha_de_compra >= CURDATE() - INTERVAL 30 DAY AND pc.estado_compra = 'COMPRADO'
    GROUP BY comprador
),
compradores AS (
    SELECT u.dni, u.nombre
    FROM usuario u
    JOIN rol r ON u.dni = r.dni
    WHERE r.rol = 'COMPRADOR'
)
SELECT c.dni, c.nombre, co.total_gastado reputacion
FROM compradores c
JOIN compras_ultimos_30_dias co ON c.dni = co.comprador;

/*** vendedores ***/
WITH ventas_ultimos_30_dias AS (
    SELECT vendedor, SUM(p.precio) AS total_cobrado
    FROM producto_comprado pc
    JOIN publicacion p ON pc.vendedor = p.vendedor AND pc.producto = p.producto
    WHERE pc.fecha_de_compra >= CURDATE() - INTERVAL 30 DAY AND pc.estado_compra = 'COMPRADO'
    GROUP BY vendedor
),
vendedores AS (
    SELECT u.dni, u.nombre
    FROM usuario u
    JOIN rol r ON u.dni = r.dni
    WHERE r.rol = 'VENDEDOR'
)
SELECT v.dni, v.nombre, ve.total_cobrado reputacion
FROM vendedores v
JOIN ventas_ultimos_30_dias ve ON v.dni = ve.comprador;

/* Contabilizar la cantidad de ventas de plataforma para un rango de fechas */
SELECT COUNT(*) AS cantidad_de_ventas 
FROM producto_comprado pc 
WHERE pc.fecha_de_compra < '2024-11-25' AND pc.fecha_de_compra > '2024-11-01' AND pc.estado_compra = 'COMPRADO';

/* Contabilizar el valor total de ventas de la plataforma para un rango de fechas */
SELECT SUM(p.precio) AS valor_total_ventas
FROM producto_comprado pc
JOIN publicacion p ON pc.vendedor = p.vendedor AND pc.producto = p.producto
WHERE pc.fecha_de_compra < '2024-11-25' AND pc.fecha_de_compra > '2024-11-01' AND pc.estado_compra = 'COMPRADA';
