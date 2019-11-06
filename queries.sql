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

-- Shows people and address using natural join
SELECT *
FROM Riemann.Pessoa NATURAL JOIN Riemann.Endereco;


-- Shows people and address
SELECT
    *
FROM
    Riemann.Pessoa AS P
INNER JOIN  Riemann.Endereco AS E ON P.id_endereco = E.id_endereco;

-- Left outer join - it returns everyone one with null in data_compra and valor if has no transactions
SELECT P.cpf, nome, data_de_nascimento, id_endereco, genero, nome_mae, data_compra, valor
FROM Riemann.Pessoa as P
LEFT OUTER JOIN Riemann.Compra_Fisica as C
ON P.cpf = C.cpf;

-- Right outer join - Returns only data from people that has transactions
SELECT P.cpf, nome, data_de_nascimento, id_endereco, genero, nome_mae, data_compra, valor
FROM Riemann.Pessoa as P
RIGHT OUTER JOIN Riemann.Compra_Fisica as C
ON P.cpf = C.cpf;

-- IT returns all combinations with nullable values
SELECT * FROM Riemann.Pessoa as P
LEFT JOIN Riemann.Compra_Fisica as C ON P.cpf = C.cpf
UNION ALL
SELECT * FROM Riemann.Pessoa as P
RIGHT JOIN Riemann.Compra_Fisica as C ON P.cpf = C.cpf
WHERE P.cpf IS NULL;

-- Filters the transaction with the lowest price in query
SELECT valor FROM Riemann.Compra_Fisica WHERE valor > ANY (SELECT valor FROM Riemann.Compra_Fisica);

-- Select everyone's with transactions that costs more than 1 R$
SELECT nome FROM Riemann.Pessoa AS P 
WHERE EXISTS (SELECT valor FROM Riemann.Compra_Fisica as C WHERE c.valor > 1 AND P.cpf = C.cpf );

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

CALL GetAllLojas();

DELIMITER $$  
CREATE TRIGGER avoid_empty  
    BEFORE INSERT ON Riemann.Compra_Fisica
        FOR EACH ROW
        BEGIN
            IF NEW.parcelamento IS NULL THEN
                SET NEW.parcelamento = 0;
            END IF;  
        END;$$ 
DELIMITER ;

INSERT INTO Compra_Fisica
    (id_transacao_fisica, cpf, cnpj, id_cartao, parcelamento, tipo_de_pagamento, data_compra, valor)
VALUES("6", "12311889634", "92863080000127", "5258134325674997", NULL, "Credito a vista", "05/11/2019", 11.69);

DELIMITER $$
CREATE FUNCTION FlagGenero(
    genero VARCHAR(15)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE flag VARCHAR(2);
	IF genero LIKE 'M%' THEN
        SET flag = 'M';
    ELSEIF genero LIKE 'F%' THEN
        SET flag = 'F';
	ELSE
		SET flag ='N';
    END IF;
    RETURN (flag);
END$$
DELIMITER ;
DROP FUNCTION IF EXISTS FlagGenero;
SELECT
    cpf,
    FlagGenero(genero)
FROM
    Riemann.Pessoa;