CREATE ROLE admin LOGIN PASSWORD 'admin_pass';
GRANT ALL PRIVILIGIES ON DATABASE web_compra_venta TO admin;

CREATE ROLE vendedor LOGIN PASSWORD 'vendedor_pass';
/* Ver que permisos se le van a atribuir bien. Una idea:
Vendedor: debe poder modificar los nombres, descripciones, categoría, precio y demás datos de los productos que vende.

SELECT, UPDATE, INSERT, DELETE en Publicacion
SELECT, UPDATE, INSERT, DELETE en Producto
SELECT, UPDATE, INSERT, DELETE en Caracteristica
SELECT en Producto_comprado
SELECT en Usuario
*/

CREATE ROLE comprador LOGIN PASSWORD 'comprador_pass';
/* Ver que permisos se le van a atribuir bien. Una idea:
Cliente/Comprador: debe poder ofertar, comprar, cancelar una compra, cancelar un envío, y elegir el tipo de envío.

SELECT, UPDATE, INSERT en Producto_comprado   --- no agrego delete porque el comprador no puede borrar una compra, puede cancelarla en todo caso
SELECT en Publicacion,
SELECT en Caracteristica,
SELECT en Producto
SELECT en Usuario


PREGUNTAS:
- el vendedor/comprador puede tener acceso a la tabla Usuario? puede querer editar su info? como hago para que no edite la de los demas?
- idem para la tabla Rol? esto creo que ni hace falta - es mas info para el admin
- que otras cosas puede ver el comprador?
*/