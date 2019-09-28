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

); 

create table Loja_fisica(
	cnpj VARCHAR(14) NULL,
    categoria VARCHAR(30) NULL,
    CONSTRAINT fk_endereco_loja_fisica FOREIGN KEY(id_endereco) REFERENCES Endereco(id_endereco) 
);

create table Faculdade(
	cnpj VARCHAR(14) NULL,
    categoria VARCHAR(30) NULL,
    CONSTRAINT fk_endereco_faculdade FOREIGN KEY(id_endereco) REFERENCES Endereco(id_endereco) 
);