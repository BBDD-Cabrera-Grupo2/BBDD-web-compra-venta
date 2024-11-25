CREATE TABLE usuario (
    dni INT PRIMARY KEY, 
    nombre VARCHAR(50)
);

CREATE TABLE rol (
    dni INT, 
    rol VARCHAR(50), 
    PRIMARY KEY (dni, rol), 
    FOREIGN KEY (dni) REFERENCES usuario(dni)
);

CREATE TABLE producto (
    nombre_producto VARCHAR(200) PRIMARY KEY, 
    categoria VARCHAR(100)
);

CREATE TABLE publicacion (
    vendedor INT, 
    producto VARCHAR(200), 
    precio DECIMAL(10, 2) CHECK (precio > 1000), 
    PRIMARY KEY (vendedor, producto), 
    FOREIGN KEY (vendedor) REFERENCES usuario(dni), 
    FOREIGN KEY (producto) REFERENCES producto(nombre_producto)
);

CREATE TABLE caracteristica (
    caracteristica VARCHAR(200),
    producto VARCHAR(200),
    vendedor INT,
    PRIMARY KEY (caracteristica, producto, vendedor),
    FOREIGN KEY (producto, vendedor) REFERENCES publicacion(producto, vendedor)
);

CREATE TABLE producto_comprado (
    vendedor INT,
    producto VARCHAR(200),
    comprador INT,
    estado_envio VARCHAR(50),
    estado_compra VARCHAR(50),
    fecha_de_compra DATE,
    forma_de_pago VARCHAR(50),
    PRIMARY KEY (vendedor, producto),
    FOREIGN KEY (vendedor, producto) REFERENCES publicacion(vendedor, producto),
    FOREIGN KEY (comprador) REFERENCES usuario(dni)
);
