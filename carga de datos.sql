CREATE DATABASE IF NOT EXISTS mix_dulce;

USE mix_dulce;

CREATE TABLE IF NOT EXISTS producto (
    id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(20) NOT NULL,
    descripcion VARCHAR(50),
    precio FLOAT NOT NULL
);
    
CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(20) NOT NULL
);
    
CREATE TABLE IF NOT EXISTS pedido (
    id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    precio FLOAT NOT NULL
);
    
CREATE TABLE IF NOT EXISTS proveedor (
    id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(20) NOT NULL
);
    
CREATE TABLE IF NOT EXISTS ingrediente (
    id_ingrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_ingrediente VARCHAR(20) NOT NULL,
    stock INT NOT NULL
);
    
CREATE TABLE IF NOT EXISTS provee (
    id_proveedor INT NOT NULL,
    id_ingrediente INT NOT NULL,
    CONSTRAINT FK_PROVEE_PROVEEDOR FOREIGN KEY (id_proveedor)
        REFERENCES proveedor (id_proveedor),
    CONSTRAINT FK_PROVEE_INGREDIENTE FOREIGN KEY (id_ingrediente)
        REFERENCES ingrediente (id_ingrediente)
);
    
CREATE TABLE IF NOT EXISTS tiene (
    id_producto INT NOT NULL,
    id_ingrediente INT NOT NULL,
    CONSTRAINT FK_TIENE_PRODUCTO FOREIGN KEY (id_producto)
        REFERENCES producto (id_producto),
    CONSTRAINT FK_TIENE_INGREDIENTE FOREIGN KEY (id_ingrediente)
        REFERENCES ingrediente (id_ingrediente)
);
    
    
CREATE TABLE IF NOT EXISTS de (
    id_producto INT NOT NULL,
    id_pedido INT NOT NULL,
    CONSTRAINT FK_DE_PRODUCTO FOREIGN KEY (id_producto)
        REFERENCES producto (id_producto),
    CONSTRAINT FK_DE_PEDIDO FOREIGN KEY (id_pedido)
        REFERENCES pedido (id_pedido)
);
    
CREATE TABLE IF NOT EXISTS compra (
    id_cliente INT NOT NULL,
    id_pedido INT NOT NULL,
    CONSTRAINT FK_COMPRA_CLIENTE FOREIGN KEY (id_cliente)
        REFERENCES cliente (id_cliente),
    CONSTRAINT FK_COMPRA_PEDIDO FOREIGN KEY (id_pedido)
        REFERENCES pedido (id_pedido)
);