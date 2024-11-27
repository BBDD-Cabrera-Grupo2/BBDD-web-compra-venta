CREATE ROLE admin LOGIN PASSWORD 'admin_pass';
GRANT ALL PRIVILEGES ON DATABASE web_compra_venta TO admin;



CREATE ROLE vendedor LOGIN PASSWORD 'vendedor_pass';

GRANT SELECT ON TABLE publicacion TO vendedor;
GRANT UPDATE ON TABLE publicacion TO vendedor;
GRANT INSERT ON TABLE publicacion TO vendedor;

GRANT SELECT ON TABLE caracteristica TO vendedor;
GRANT UPDATE ON TABLE caracteristica TO vendedor;
GRANT INSERT ON TABLE caracteristica TO vendedor;
GRANT DELETE ON TABLE caracteristica TO vendedor;

GRANT SELECT ON TABLE compra TO vendedor;



CREATE ROLE comprador LOGIN PASSWORD 'comprador_pass';

GRANT SELECT ON TABLE compra TO comprador;
GRANT UPDATE ON TABLE compra TO comprador;
GRANT INSERT ON TABLE compra TO comprador;