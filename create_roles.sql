-- Rol admin
CREATE ROLE admin LOGIN PASSWORD 'admin_pass';
GRANT ALL PRIVILEGES ON DATABASE web_compra_venta TO admin;

-- Rol vendedor
CREATE ROLE vendedor LOGIN PASSWORD 'vendedor_pass';
GRANT 
    SELECT, UPDATE, INSERT ON TABLE publicacion TO vendedor,
    SELECT, UPDATE, INSERT, DELETE ON TABLE caracteristica TO vendedor,
    SELECT ON TABLE compra TO vendedor;

-- Rol comprador
CREATE ROLE comprador LOGIN PASSWORD 'comprador_pass';
GRANT 
    SELECT, UPDATE, INSERT ON TABLE compra TO comprador,
    SELECT ON TABLE publicacion TO comprador;
