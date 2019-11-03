USE Riemann;

-- Read transactions with value between 1 and 2 reais
SELECT cpf, valor
FROM Riemann.Compra_Fisica
WHERE valor BETWEEN 1.00 AND 2.00;

-- Finds all people that contains Mentirosa in name
SELECT cpf, nome, data_de_nascimento, id_endereco, genero, nome_mae
FROM Riemann.Pessoa
WHERE nome LIKE "%Mentirosa%";

-- Finds all address that belongs to People (and not stores or coleges)
SELECT
    *
FROM
    Riemann.Endereco AS E
WHERE
    id_endereco IN
    ( 
        SELECT
    id_endereco
FROM
    Riemann.Pessoa AS P
WHERE
            P.id_endereco = P.id_endereco
    );

-- Finds stores without address
SELECT cnpj, categoria, id_endereco
FROM Riemann.Loja_Fisica
WHERE id_endereco IS NULL;

-- Show all transactions ordered by value
SELECT id_transacao_fisica, cpf, cnpj, id_cartao, parcelamento, tipo_de_pagamento, data_compra, valor
FROM Riemann.Compra_Fisica
ORDER BY valor DESC;

-- Add email table to Pessoa
ALTER TABLE Pessoa
ADD email varchar(255);

-- Change Pessoa value type
ALTER TABLE Pessoa MODIFY nome varchar(120);

-- Remove email collumn
ALTER TABLE Pessoa DROP email;

-- Shows the value per parcel of each parceled transaction
SELECT valor/parcelamento, id_transacao_fisica, cpf, cnpj, id_cartao, parcelamento, tipo_de_pagamento, data_compra, valor
FROM Riemann.Compra_Fisica
WHERE parcelamento IS NOT NULL;

-- Shows the number of People of each gender
SELECT genero, COUNT(genero)
FROM Riemann.Pessoa
GROUP BY genero;

-- Shows all distincts transactions for a person in a store
SELECT DISTINCT cpf, cnpj
FROM Riemann.Compra_Fisica;

-- Shows the number of People of each gender having more than 1 person
SELECT genero, COUNT(genero)
FROM Riemann.Pessoa
GROUP BY genero
HAVING COUNT(genero) > 1;

-- Shows people and address
SELECT
    *
FROM
    Riemann.Pessoa AS P
INNER JOIN  Riemann.Endereco AS E ON P.id_endereco = E.id_endereco;

CREATE VIEW CPFs AS
SELECT cpf, nome
FROM Riemann.Pessoa;

SELECT nome 
FROM CPFs
WHERE nome LIKE "M%";

DELIMITER $$
 
CREATE PROCEDURE GetAllLojas()
BEGIN
    SELECT cnpj, categoria  FROM Riemann.Loja_Fisica;
END $$
 
DELIMITER ;

CALL GetAllLojas()






DELIMITER $$  
CREATE TRIGGER avoid_empty  
    BEFORE INSERT ON Riemann.Compra_Fisica  
        FOR EACH ROW  
        BEGIN  
            IF NEW.parcelamento = ''  
                THEN SET NEW.parcelamento = NULL;  
            END IF;  
        END;$$  
DELIMITER ; 

