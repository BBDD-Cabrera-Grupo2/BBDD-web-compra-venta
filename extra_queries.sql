-- Modificar valor minimo de precio de publicacion
ALTER TABLE publicacion
DROP CONSTRAINT publicacion_precio_min;

ALTER TABLE publicacion
ADD CONSTRAINT publicacion_precio_min CHECK (precio > 900 OR NOT disponible);

-- Publicaciones disponibles para la venta
SELECT *
FROM publicacion
WHERE disponible == TRUE;