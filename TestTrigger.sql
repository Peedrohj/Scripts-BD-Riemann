USE Riemann;

INSERT INTO Compra_Fisica
    (id_transacao_fisica, cpf, cnpj, id_cartao, parcelamento, tipo_de_pagamento, data_compra, valor)
VALUES("5", '43157231547', "92863080000127", "5258134325674997", "hj", "Credito a vista", "01/10/2019", 1.42);

DELIMITER $$  
CREATE TRIGGER avoid_empty  
    BEFORE INSERT ON Riemann.Compra_Fisica  
        FOR EACH ROW  
        BEGIN  
            IF NOT NEW LIKE REGEXP_LIKE(parcelamento,'^-?[0-9]+$')
                THEN SET NEW.parcelamento = NULL;  
            END IF;  
        END;$$  
DELIMITER ; 
DROP TRIGGER  avoid_empty;

INSERT INTO Compra_Fisica
    (id_transacao_fisica, cpf, cnpj, id_cartao, parcelamento, tipo_de_pagamento, data_compra, valor)
VALUES("5", '43157241547', "92863087000127", "5258134325524997", "hj", "Credito a vista", "01/11/2019", 1.42);