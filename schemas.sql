CREATE DATABASE restaurante;
USE restaurante;

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    cpf VARCHAR(14),
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100),
    cargo VARCHAR(100),
    salario DECIMAL(10,2),
    data_admissa DATE 
);

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    cpf VARCHAR(14),
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100),
    data_cadastro DATE
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10,2),
    categoria VARCHAR(100)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_funcionario INT,
    id_produto INT,
    quantidade INT,
    preco DECIMAL(10,2),
    data_pedido DATE,
    status_pedido ENUM('Pendente', 'Concluido', 'Cancelado'),  
    FOREIGN KEY (id_cliente)     REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),  
    FOREIGN KEY (id_produto)     REFERENCES produtos(id_produto)           
);

CREATE TABLE info_produto (
    id_info INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT,
    ingredientes TEXT,
    fornecedor VARCHAR(255),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)  -- corrigido: era "produto"
);