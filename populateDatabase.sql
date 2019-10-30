
-- Populate Endereco
INSERT INTO Endereco
    (id_endereco, numero, logradouro, cep, cidade, estado, bairro)
VALUES('1', 22, 'Rua Quarenta e dois', "53080430", "Olinda", "Pernambuco", "Rio Doce");
INSERT INTO Endereco
    (id_endereco, numero, logradouro, cep, cidade, estado, bairro)
VALUES('2', 93, 'Rua Soledade e anjo', "52380430", "Recife", "Pernambuco", "Boa Viagem");
INSERT INTO Endereco
    (id_endereco, numero, logradouro, cep, cidade, estado, bairro)
VALUES('3', 02, 'Rua Parnamirim', "52380420", "Recife", "Pernambuco", "Aflitos");
INSERT INTO Endereco
    (id_endereco, numero, logradouro, cep, cidade, estado, bairro)
VALUES('4', 42, 'Avenida Brasil', "51872340", "Jaboatão", "Pernambuco", "Morro dos macacos");
INSERT INTO Endereco
    (id_endereco, numero, logradouro, cep, cidade, estado, bairro)
VALUES('5', 77, 'Avenida Cais do Apolo', "52872231", "Recife", "Pernambuco", "Bairro do Recife");
INSERT INTO Endereco
    (id_endereco, numero, logradouro, cep, cidade, estado, bairro)
VALUES('6', 00, 'Rua Professor Luiz Freire', "53032743", "Recife", "Pernambuco", "Cidade Universitária");

-- Populate Pessoa
INSERT INTO Pessoa
    (cpf, nome, data_de_nascimento, id_endereco, genero, nome_mae)
VALUES
    ("10097142441", "Otacilio Maia Fakersom", "14/11/1996", '1', 'masculino', 'Liliam Freire');
INSERT INTO Pessoa
    (cpf, nome, data_de_nascimento, id_endereco, genero, nome_mae)
VALUES
    ("43157231547", "Maria Mentirosa", "01/03/2002", '2', 'feminino', 'Laura Mentirosa');
INSERT INTO Pessoa
    (cpf, nome, data_de_nascimento, id_endereco, genero, nome_mae)
VALUES
    ("12871289732", "Laura Mentirosa", "11/05/1940", '2', 'feminino', 'Paula Mentirosa');

-- Populate Aplicativo
INSERT INTO Aplicativo
    (nome, categoria, faz_transacao)
VALUES
    ("Tinder", "Casual/Paquera", 1);
INSERT INTO Aplicativo
    (nome, categoria, faz_transacao)
VALUES
    ("Uber", "Mobilidade", 1);
INSERT INTO Aplicativo
    (nome, categoria, faz_transacao)
VALUES
    ("Guia de Bolso", "Finanças", 0);

-- Populate Telefone
INSERT INTO Telefone
    (numero, cpf)
VALUES
    (34316829, "43157231547");
INSERT INTO Telefone
    (numero, cpf)
VALUES
    (999724356, "43157231547");
INSERT INTO Telefone
    (numero, cpf)
VALUES
    (999597078, "10097142441");

-- Populate Cartão de Crédito
INSERT INTO Cartao_Credito
    (id_cartao, nivel_cartao, bandeira, ultimos_quatros_digitos, validade, cpf)
VALUES
    ("5258134325674997", "Platinum", "Mastercard", "0021", "02/29", "43157231547");
INSERT INTO Cartao_Credito
    (id_cartao, nivel_cartao, bandeira, ultimos_quatros_digitos, validade, cpf)
VALUES
    ("4556780233046280", "Nanquim", "Visa", "5123", "01/23", "10097142441");
-- Person out of Pessoa's base
INSERT INTO Cartao_Credito
    (id_cartao, nivel_cartao, bandeira, ultimos_quatros_digitos, validade, cpf)
VALUES
    ("6011620456406247", "Top Blaster", "Discover", "3126", "09/32", "10394152453");

-- Populate Loja Fisica
INSERT INTO Loja_Fisica
    (cnpj, categoria, id_endereco)
VALUES
    ("92863080000127", "Atacado", '4');
INSERT INTO Loja_Fisica
    (cnpj, categoria, id_endereco)
VALUES
    ("34160873000183", "Sorveteria", NULL);

-- Populate Faculdade
INSERT INTO Faculdade
    (cnpj, categoria, id_endereco)
VALUES
    ("96367632000167", "Privada", '5');
INSERT INTO Faculdade
    (cnpj, categoria, id_endereco)
VALUES
    ("98247507000149", "Publica", '6');

-- Populate compra_fisica
INSERT INTO Compra_Fisica
    (id_transacao_fisica, cpf, cnpj, id_cartao, parcelamento, tipo_de_pagamento, data_compra, valor)
VALUES("1", '43157231547', "92863080000127", "5258134325674997", NULL, "Credito a vista", "01/10/2019", 4099.52);
INSERT INTO Compra_Fisica
    (id_transacao_fisica, cpf, cnpj, id_cartao, parcelamento, tipo_de_pagamento, data_compra, valor)
VALUES("2", '43157231547', "92863080000127", "5258134325674997", 2, "Credito a vista", "01/10/2019", 30.12);
INSERT INTO Compra_Fisica
    (id_transacao_fisica, cpf, cnpj, id_cartao, parcelamento, tipo_de_pagamento, data_compra, valor)
VALUES("3", '43157231547', "92863080000127", "5258134325674997", NULL, "Credito a vista", "01/10/2019", 0.12);
INSERT INTO Compra_Fisica
    (id_transacao_fisica, cpf, cnpj, id_cartao, parcelamento, tipo_de_pagamento, data_compra, valor)
VALUES("4", '43157231547', "92863080000127", "5258134325674997", 4, "Credito a vista", "01/10/2019", 1.12);
INSERT INTO Compra_Fisica
    (id_transacao_fisica, cpf, cnpj, id_cartao, parcelamento, tipo_de_pagamento, data_compra, valor)
VALUES("5", '43157231547', "92863080000127", "5258134325674997", NULL, "Credito a vista", "01/10/2019", 1.42);

-- Populate Estuda
INSERT INTO Estuda
    (cnpj, cpf, data_inicio, bolsa, valor_mensalidade, matricula)
VALUES
    ("96367632000167", "43157231547", "01/03/2018", 0, 2300.00, "2018101021");

-- Populate Renda Mensal
INSERT INTO Renda_Media
    (cpf, categoria, data_recebimento, valor)
VALUES("10097142441", "Renda fixa", "Dia 30", 1400.00);

-- Populate Filicacao
INSERT INTO Filiacao
    (cpf_responsavel, cpf_dependente)
VALUES("12871289732", "43157231547");

-- Populate Indicação
INSERT INTO Indicacao
    (cpf_indicado, cpf_indica)
VALUES("10097142441", "43157231547");

-- Populate Usa
INSERT INTO Usa
    (cpf_usuario, nome_aplicativo)
VALUES("10097142441", "Guia de Bolso");

