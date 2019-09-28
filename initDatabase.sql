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

);

create table Telefone(

);

create table Cartao_credito(

); 