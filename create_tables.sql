CREATE TABLE compradores (
    dni INT PRIMARY KEY, 
    nombre VARCHAR(50)
);

CREATE TABLE vendedores (
    dni INT PRIMARY KEY, 
    nombre VARCHAR(50)
);

CREATE TABLE publicaciones (
    vendedor INT,
    producto VARCHAR(200), 
    precio DECIMAL(10, 2) CHECK (precio > 1000), 
    disponible BOOLEAN,
    PRIMARY KEY (vendedor, producto), 
    FOREIGN KEY (vendedor) REFERENCES vendedores(dni)
);

CREATE TABLE caracteristicas (
    caracteristica VARCHAR(200),
    producto VARCHAR(200),
    vendedor INT,
    valor VARCHAR(200),
    PRIMARY KEY (caracteristica, producto, vendedor),
    FOREIGN KEY (producto, vendedor) REFERENCES publicaciones(producto, vendedor)
);

CREATE TABLE categorias (
    categoria VARCHAR(200),
    producto VARCHAR(200),
    vendedor INT,
    PRIMARY KEY (categoria, producto, vendedor),
    FOREIGN KEY (producto, vendedor) REFERENCES publicaciones(producto, vendedor),
    FOREIGN KEY (vendedor) REFERENCES vendedores(dni)
);

CREATE TABLE compras (
    vendedor INT,
    producto VARCHAR(200),
    comprador INT,
    estado_envio VARCHAR(50),
    estado_compra VARCHAR(50),
    fecha_compra DATE,
    forma_pago VARCHAR(50),
    monto_total DECIMAL(10, 2),
    PRIMARY KEY (comprador, vendedor, producto, fecha_compra),
    FOREIGN KEY (vendedor, producto) REFERENCES publicaciones(vendedor, producto),
    FOREIGN KEY (vendedor) REFERENCES vendedores(dni),
    FOREIGN KEY (comprador) REFERENCES compradores(dni)
);
