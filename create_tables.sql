CREATE TABLE comprador (
    dni INT PRIMARY KEY, 
    nombre VARCHAR(200)
);

CREATE TABLE vendedor (
    dni INT PRIMARY KEY, 
    nombre VARCHAR(200)
);

CREATE TABLE publicacion (
    vendedor INT,
    producto VARCHAR(200),
    categoria VARCHAR(200),
    precio DECIMAL(10, 2) CHECK (precio > 1000), 
    disponible BOOLEAN,
    PRIMARY KEY (vendedor, producto), 
    FOREIGN KEY (vendedor) REFERENCES vendedor(dni)
);

CREATE TABLE caracteristica (
    caracteristica VARCHAR(200),
    producto VARCHAR(200),
    vendedor INT,
    PRIMARY KEY (caracteristica, producto, vendedor),
    FOREIGN KEY (producto, vendedor) REFERENCES publicacion(producto, vendedor)
);

CREATE TABLE compra (
    vendedor INT,
    producto VARCHAR(200),
    comprador INT,
    estado_envio VARCHAR(50),
    estado_compra VARCHAR(50),
    fecha_compra DATE,
    forma_de_pago VARCHAR(50),
    monto_total DECIMAL(10, 2),
    PRIMARY KEY (comprador, vendedor, producto, fecha_compra),
    FOREIGN KEY (vendedor, producto) REFERENCES publicacion(vendedor, producto),
    FOREIGN KEY (comprador) REFERENCES comprador(dni)
);
