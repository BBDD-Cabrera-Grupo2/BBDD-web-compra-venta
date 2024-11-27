/* Modificar valor minimo de precio de publicacion */
ALTER TABLE publicacion
DROP CONSTRAINT publicacion_precio_check;

ALTER TABLE publicacion
ADD CONSTRAINT publicacion_precio_check CHECK (precio > 900);
