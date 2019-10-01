SELECT id_endereco, numero, logradouro, cep, cidade, estado, bairro
FROM Riemann.Endereco;

SELECT cpf, nome, data_de_nascimento, id_endereco, genero, nome_mae
FROM Riemann.Pessoa;

SELECT nome, categoria, faz_transacao
FROM Riemann.Aplicativo;

SELECT numero, cpf
FROM Riemann.Telefone;

SELECT id_cartao, nivel_cartao, bandeira, ultimos_quatros_digitos, validade, cpf
FROM Riemann.Cartao_Credito;