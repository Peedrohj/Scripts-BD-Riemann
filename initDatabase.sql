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
DROP TABLE IF EXISTS Loja_fisica

-- Create tables
CREATE TABLE Aplicativo (
	nome VARCHAR(60) UNIQUE,
	categoria VARCHAR(45) NULL,
	faz_transacao INT NULL,
	PRIMARY KEY (nome)
);

create table Endereco(
	id_endereco VARCHAR(60) NULL, 
	numero INT(5) NULL,
    logradouro VARCHAR(16) NULL,
    cep VARCHAR(8) NULL,
    cidade VARCHAR(95) NULL,
    estado VARCHAR(90) NULL,
    bairro VARCHAR(90) NULL,
    PRIMARY KEY (id_endereco)
);

create table Telefone(
	
);

create table Cartao_credito(
	id_cartao INT(16),
	nivel_cartao VARCHAR(30) NOT NULL,
	bandeira VARCHAR(30) NOT NULL,
    ultimos_quatros_digitos INT(4) NOT NULL,
    validade VARCHAR(10) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
	PRIMARY KEY (id_cartao)
); 