CREATE DATABASE IF NOT EXISTS restaurante;

USE restaurante;

CREATE TABLE cliente(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(20) NOT NULL,
sexo CHAR(1) CHECK (sexo IN ('m', 'f', 'o')),
idade INT NOT NULL,
nascimento DATE NOT NULL,
pontos INT DEFAULT 0
);

CREATE TABLE prato(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(20) NOT NULL,
descricao VARCHAR(50) NOT NULL,
valor DECIMAL (10, 2) NOT NULL,
disponibilidade BOOLEAN NOT NULL
);

CREATE TABLE fornecedor(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(20) NOT NULL,
 estado_origem CHAR(2) CHECK (estado_origem IN (
        'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT',
        'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO',
        'RR', 'SC', 'SP', 'SE', 'TO'
    )) NOT NULL
);

CREATE TABLE ingrediente (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(20) NOT NULL,
data_fabricacao DATE NOT NULL,
data_validade DATE,
quantidade INT CHECK (quantidade >= 0),
observacao VARCHAR(50) NOT NULL
);

CREATE TABLE usos (
id_prato INT,
id_ingrediente INT,
PRIMARY KEY (id_prato, id_ingrediente),
FOREIGN KEY (id_prato) REFERENCES prato(id),
FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id)
);

CREATE TABLE venda (
id INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
id_prato INT NOT NULL,
quantidade INT CHECK (quantidade > 0),
dia DATE NOT NULL,
hora TIME NOT NULL,
valor DECIMAL(10, 2) CHECK (valor >= 0),
FOREIGN KEY (id_cliente) REFERENCES cliente(id),
FOREIGN KEY (id_prato) REFERENCES prato(id)
);

CREATE TABLE usuario (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(20) NOT NULL,
senha VARCHAR(20) NOT NULL,
tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('Administrador', 'Gerente', 'Funcionario'))
);