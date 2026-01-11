CREATE DATABASE cadastro_clientes;

USE cadastro_clientes;

CREATE TABLE estado (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    uf CHAR(2) NOT NULL UNIQUE,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    id_estado INT NOT NULL,
    
    CONSTRAINT fk_cliente_estado
        FOREIGN KEY (id_estado)
        REFERENCES estado(id_estado)
);

CREATE TABLE tipo_telefone (
    id_tipo_telefone INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE cliente_telefone (
    id_cliente_telefone INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_tipo_telefone INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    
    CONSTRAINT fk_ct_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),
        
    CONSTRAINT fk_ct_tipo
        FOREIGN KEY (id_tipo_telefone)
        REFERENCES tipo_telefone(id_tipo_telefone),
        
    CONSTRAINT uk_cliente_numero
        UNIQUE (id_cliente, numero)
);