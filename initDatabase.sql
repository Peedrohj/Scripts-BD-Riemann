
-- Create project database
CREATE DATABASE Riemann;
USE Riemann;

-- Drop tables
DROP TABLE IF EXISTS Aplicativo;
DROP TABLE IF EXISTS Endereco;
DROP TABLE IF EXISTS Telefone;
DROP TABLE IF EXISTS Cartao_credito;
DROP TABLE IF EXISTS Compra_fisica;
DROP TABLE IF EXISTS Compra_online;
DROP TABLE IF EXISTS Renda_media;
DROP TABLE IF EXISTS Filiacao;
DROP TABLE IF EXISTS Inidicacao;
DROP TABLE IF EXISTS Faculdade;
DROP TABLE IF EXISTS Loja_fisica;

-- Create tables
CREATE TABLE Aplicativo (
	nome VARCHAR(60) UNIQUE,
	categoria VARCHAR(45) NULL,
	faz_transacao INT NULL,
	PRIMARY KEY (nome)
);

CREATE TABLE Endereco(
	id_endereco VARCHAR(60) NOT NULL, 
	numero INT(5) NULL,
    logradouro VARCHAR(16) NULL,
    cep VARCHAR(8) NULL,
    cidade VARCHAR(95) NULL,
    estado VARCHAR(90) NULL,
    bairro VARCHAR(90) NULL,
    PRIMARY KEY (id_endereco)
);
CREATE TABLE Pessoa(
	cpf INT(11) NOT NULL,
	nome VARCHAR(90) NULL,
	data_de_nascimento VARCHAR(10) NULL,
	id_endereco VARCHAR(60) NULL, 
	CONSTRAINT fk_endereco_pessoa FOREIGN KEY (id_endereco) REFERENCES Endereco (id_endereco),
	genero VARCHAR(15) NULL,
	nome_mae VARCHAR(90) NULL,
	PRIMARY KEY (cpf)
);

CREATE TABLE Telefone(
	numero VARCHAR(13) NULL,
    cpf INT(11) NOT NULL, 
	CONSTRAINT fk_pessoa_faculdade FOREIGN KEY (cpf) REFERENCES Pessoa (cpf)
);

CREATE TABLE Cartao_Credito(
	id_cartao INT(16),
	nivel_cartao VARCHAR(30) NOT NULL,
	bandeira VARCHAR(30) NOT NULL,
    ultimos_quatros_digitos INT(4) NOT NULL,
    validade VARCHAR(10) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
	PRIMARY KEY (id_cartao)
); 

CREATE TABLE Loja_Fisica(
	cnpj VARCHAR(14) NOT NULL,
    categoria VARCHAR(30) NULL,
    id_endereco VARCHAR(60) NULL,
    CONSTRAINT fk_endereco_loja_fisica FOREIGN KEY(id_endereco) REFERENCES Endereco(id_endereco),
	PRIMARY KEY (cnpj)
);

CREATE TABLE Faculdade(
	cnpj VARCHAR(14) NOT NULL,
    categoria VARCHAR(30) NULL,
    id_endereco VARCHAR(60) NULL,
    CONSTRAINT fk_endereco_faculdade FOREIGN KEY(id_endereco) REFERENCES Endereco(id_endereco),
	PRIMARY KEY(cnpj)
);

CREATE TABLE Compra_Fisica(
id_transacao_fisica VARCHAR(60) NOT NULL,
cpf INT(11) NOT NULL,
cnpj VARCHAR(14) NOT NULL,
id_cartao INT(16),
CONSTRAINT fk_compra_fisica_cpf FOREIGN KEY(cpf) REFERENCES Pessoa(cpf),
CONSTRAINT fk_compra_fisica_cnpj FOREIGN KEY(cnpj) REFERENCES Loja_Fisica(cnpj),
CONSTRAINT fk_compra_fisica_id_cartao FOREIGN KEY(id_cartao) REFERENCES Cartao_Credito(id_cartao),
parcelamento INT(5) NULL,
tipo_de_pagamento VARCHAR(30) NULL,
data_compra VARCHAR(10) NULL,
valor FLOAT(60,2) NULL,
PRIMARY KEY (id_transacao_fisica)
);