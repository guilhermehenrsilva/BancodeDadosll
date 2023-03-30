SHOW DATABASES;
USE agencia3si2023;
SELECT * FROM cliente;

#Descrição da tabela CONTA e inserção de registro

DESC conta;

INSERT INTO conta VALUES (NULL, "salario", 800.50, "abc123");
SELECT * FROM conta;
INSERT INTO conta VALUES (NULL, "poupança", 1250.00, "teste");
INSERT INTO conta VALUES (NULL, "poupança", 3000.00, "senha12");
INSERT INTO conta VALUES (NULL, "Corrente", 125.1, "*23AB*");  

#Mostrar o valor financeiro em poder da agência
SELECT format(SUM(saldo),2) FROM conta;

#Mostrar o menor saldo
SELECT format(MIN(saldo),2) AS "Menor Saldo" FROM conta;

#mostrar p maior saldo;
SELECT format(MAX(saldo),2) AS "Maior Saldo" FROM conta;

#Mostrar a média dos saldos 
SELECT format(AVG(saldo),2) AS "média Saldo" FROM conta;

#Mostrar os dados da conta com maior saldo
SELECT * FROM conta ORDER BY saldo DESC LIMIT 1;

#descrever a tabela de contas vinculadas e inserir dados
DESC contavinculada;
INSERT INTO contavinculada VALUES (1, 1,"2022-12-20");
INSERT INTO contavinculada VALUES (2, 3,"2023-01-05");
INSERT INTO contavinculada VALUES (3, 2,"2023-02-08");
INSERT INTO contavinculada VALUES (4, 4,"2023-03-04");
SELECT * FROM contavinculada;

# Criar um relatório que mostre o nome de cada cliente o identificador de sua conta
#de sua conta com os respectivo saldo 
#e data de abertura da mesma (no formato brasileiro dia/mêe/ano */


SELECT  * FROM cliente INNER JOIN CONTAVINCULADA ORDER BY idCliente  asc ;

##Relatório com união ao centro de duas tabelas: PRODUTO e CATEGORIA
#select p.codProduto, p.nome, p.precoVenda, c.nome as categoria
#from produto as p inner join categoria as c
#on p.CATEGORIA_codCategoria = c.codCategoria;

SELECT c.idcliente, c.nome, c.dataNascimento FROM cliente AS c INNER JOIN conta AS p 
ON p.CONTA_idConta = c.idcliente;
