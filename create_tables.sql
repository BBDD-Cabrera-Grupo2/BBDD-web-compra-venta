CREATE TABLE compradores (
    dni INT PRIMARY KEY, 
    nombre VARCHAR(50)
);

CREATE TABLE vendedores (
    dni INT PRIMARY KEY, 
    nombre VARCHAR(50)
);

CREATE TABLE publicacion (
    vendedor INT,
    nombre_producto VARCHAR(200), 
    precio DECIMAL(10, 2) CHECK (precio > 1000), 
    disponible BOOLEAN,
    PRIMARY KEY (vendedor, producto), 
    FOREIGN KEY (vendedor) REFERENCES vendedores(dni), 
);

CREATE TABLE caracteristica (
    caracteristica VARCHAR(200),
    producto VARCHAR(200),
    vendedor INT,
    valor VARCHAR(200),
    PRIMARY KEY (caracteristica, producto, vendedor),
    FOREIGN KEY (producto, vendedor) REFERENCES publicacion(producto, vendedor)
);

CREATE TABLE categoria (
    categoria VARCHAR(200),
    producto VARCHAR(200),
    vendedor INT,
    PRIMARY KEY (categoria, producto, vendedor),
    FOREIGN KEY (producto, vendedor) REFERENCES publicacion(producto, vendedor)
    FOREIGN KEY (vendedor) REFERENCES vendedores(dni)
);

CREATE TABLE compra (
    vendedor INT,
    producto VARCHAR(200),
    comprador INT,
    estado_envio VARCHAR(50),
    estado_compra VARCHAR(50),
    fecha_compra DATE,
    forma_pago VARCHAR(50),
    monto_total DECIMAL(10, 2),
    PRIMARY KEY (comprador, vendedor, producto, fecha_compra),
    FOREIGN KEY (vendedor, producto) REFERENCES publicacion(vendedor, producto),
    FOREIGN KEY (vendedor) REFERENCES vendedores(dni),
    FOREIGN KEY (comprador) REFERENCES compradores(dni)
);
