-- Rol admin
CREATE ROLE admin LOGIN PASSWORD 'admin_pass' CREATEROLE;
GRANT ALL PRIVILEGES ON SCHEMA public TO admin;

-- Rol vendedor
CREATE ROLE vendedor LOGIN PASSWORD 'vendedor_pass';
GRANT 
    SELECT, UPDATE, INSERT ON TABLE publicacion TO vendedor;
GRANT
    SELECT, UPDATE, INSERT, DELETE ON TABLE caracteristica TO vendedor;
GRANT
    SELECT ON TABLE compra TO vendedor;

-- Rol comprador
CREATE ROLE comprador LOGIN PASSWORD 'comprador_pass';
GRANT 
    SELECT, UPDATE, INSERT ON TABLE compra TO comprador;
GRANT
    SELECT ON TABLE publicacion TO comprador;
