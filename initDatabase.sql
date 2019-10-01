-- drop database Riemann
-- Create project database
DROP DATABASE IF EXISTS Riemann;
CREATE DATABASE IF NOT EXISTS Riemann;
USE Riemann;

-- Drop tables
DROP TABLE IF EXISTS Aplicativo;
DROP TABLE IF EXISTS Endereco;
DROP TABLE IF EXISTS Telefone;
DROP TABLE IF EXISTS Cartao_Credito;
DROP TABLE IF EXISTS Compra_Fisica;
DROP TABLE IF EXISTS Compra_Online;
DROP TABLE IF EXISTS Renda_Media;
DROP TABLE IF EXISTS Filiacao;
DROP TABLE IF EXISTS Inidicacao;
DROP TABLE IF EXISTS Faculdade;
DROP TABLE IF EXISTS Loja_Fisica;

-- Create tables
CREATE TABLE Aplicativo (
	nome VARCHAR(60) NOT NULL,
	categoria VARCHAR(45) NULL,
	faz_transacao BIT NULL DEFAULT 0,
	PRIMARY KEY (nome)
);

CREATE TABLE Endereco(
	id_endereco VARCHAR(60) NOT NULL, 
	numero INT(5) NULL,
    logradouro VARCHAR(90) NULL,
    cep VARCHAR(8) NULL,
    cidade VARCHAR(95) NULL,
    estado VARCHAR(90) NULL,
    bairro VARCHAR(90) NULL,
    PRIMARY KEY (id_endereco)
);

CREATE TABLE Pessoa(
	cpf VARCHAR(11) NOT NULL,
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
    cpf VARCHAR(11) NOT NULL, 
	CONSTRAINT fk_pessoa_faculdade FOREIGN KEY (cpf) REFERENCES Pessoa (cpf)
);

CREATE TABLE Cartao_Credito(
	id_cartao VARCHAR(16),
	nivel_cartao VARCHAR(30) NOT NULL,
	bandeira VARCHAR(30) NOT NULL,
    ultimos_quatros_digitos VARCHAR(4) NOT NULL,
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
	cpf VARCHAR(11) NOT NULL,
	cnpj VARCHAR(14) NOT NULL,
	id_cartao VARCHAR(16),
	CONSTRAINT fk_compra_fisica_cpf FOREIGN KEY(cpf) REFERENCES Pessoa(cpf),
	CONSTRAINT fk_compra_fisica_cnpj FOREIGN KEY(cnpj) REFERENCES Loja_Fisica(cnpj),
	CONSTRAINT fk_compra_fisica_id_cartao FOREIGN KEY(id_cartao) REFERENCES Cartao_Credito(id_cartao),
	parcelamento INT(5) NULL,
	tipo_de_pagamento VARCHAR(30) NULL,
	data_compra VARCHAR(10) NULL,
	valor FLOAT(60,2) NULL,
	PRIMARY KEY (id_transacao_fisica)
);

CREATE TABLE Estuda(
	cnpj VARCHAR(14) NOT NULL,
    cpf VARCHAR(11) NOT NULL, 
    data_inicio VARCHAR(10) NULL,
    bolsa BOOLEAN NULL,
    valor_mensalidade FLOAT(60,2) NULL,
    matricula VARCHAR(60) NULL,
    PRIMARY KEY(cpf, cnpj),
	INDEX fk_compra_fisica_cpf_idx(cpf),
	INDEX fk_compra_fisica_cnpj_idx(cnpj),
	CONSTRAINT fk_estuda_cpf FOREIGN KEY(cpf) REFERENCES Pessoa(cpf),
	CONSTRAINT fk_estuda_cnpj FOREIGN KEY(cnpj) REFERENCES Faculdade(cnpj)
);

CREATE TABLE Compra_Online(
	id_transacao_online VARCHAR(60) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	id_cartao VARCHAR(16),
	nome_aplicativo VARCHAR(60) NOT NULL,
	CONSTRAINT fk_compra_online_cpf FOREIGN KEY(cpf) REFERENCES Pessoa(cpf),
	CONSTRAINT fk_compra_online_nome_aplicativo FOREIGN KEY(nome_aplicativo) REFERENCES Aplicativo(nome),
	CONSTRAINT fk_compra_online_id_cartao FOREIGN KEY(id_cartao) REFERENCES Cartao_Credito(id_cartao),
	parcelamento INT(5) NULL,
	tipo_de_pagamento VARCHAR(30) NULL,
	data_compra VARCHAR(10) NULL,
	valor FLOAT(60,2) NULL,
	assinatura BOOLEAN NULL,
	PRIMARY KEY (id_transacao_online)
);

CREATE TABLE Renda_Media(
	cpf VARCHAR(11) NOT NULL,
	CONSTRAINT fk_renda_media_cpf FOREIGN KEY(cpf) REFERENCES Pessoa(cpf),
	categoria VARCHAR(60) NULL,
	data_recebimento VARCHAR(10) NULL,
	valor FLOAT(60, 2) NULL,
	PRIMARY KEY(cpf)
);

CREATE TABLE Filiacao(
	cpf_responsavel VARCHAR(11) NOT NULL,
	cpf_dependente VARCHAR(11) NOT NULL,
	CONSTRAINT fk_filiacao_cpf_dependente FOREIGN KEY(cpf_dependente) REFERENCES Pessoa(cpf),
	CONSTRAINT fk_filiacao_cpf_responsavel FOREIGN KEY(cpf_responsavel) REFERENCES Pessoa(cpf),
	PRIMARY KEY(cpf_responsavel,cpf_dependente)
);

CREATE TABLE Indicacao(
	cpf_indicado VARCHAR(11) NOT NULL,
	cpf_indica VARCHAR(11) NOT NULL,
	CONSTRAINT fk_indicacao_cpf_indicado FOREIGN KEY(cpf_indicado) REFERENCES Pessoa(cpf),
	CONSTRAINT fk_indicacao_cpf_indica FOREIGN KEY(cpf_indica) REFERENCES Pessoa(cpf),
	PRIMARY KEY(cpf_indicado,cpf_indica)
);

CREATE TABLE Usa(
	cpf_usuario VARCHAR(11) NOT NULL,
    nome_aplicativo VARCHAR(60) NOT NULL,
	CONSTRAINT fk_usa_cpf_dependente FOREIGN KEY(cpf_usuario) REFERENCES Pessoa(cpf),
	CONSTRAINT fk_usa_nome_aplicativo FOREIGN KEY(nome_aplicativo) REFERENCES Aplicativo(nome),
	PRIMARY KEY(cpf_usuario,nome_aplicativo)
);