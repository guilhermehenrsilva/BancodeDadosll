#Atualização para que cliente 1 tenha dados do telefone
UPDATE cliente SET telefone = "(35)3295-1133" WHERE idCliente = 2;

#relatorio para conferir dados dos clientes 
SELECT * FROM cliente;

#subconsulta para mostrar contas vinculadas de cliente com telefone
SELECT * FROM contavinculada AS cv WHERE cv.CLIENTE_idCLIENTE IN 
(SELECT cli.idCLIENTE from cliente AS cli WHERE cli.telefone IS NOT NULL)

SELECT * FROM contavinculada;
SELECT * FROM conta;
SELECT * FROM cliente;

UPDATE conta SET saldo = saldo + 5 WHERE idConta IN
 (SELECT conta_idConta FROM contavinculada WHERE CLIENTE_idCliente IN
  (SELECT idCliente FROM cliente WHERE RG LIKE "SP%"))
  SELECT * FROM conta;
  
  
  #EXCLUIR AS CONTAS VINCULADAS AOS CLIENTE SEM RG
  #ENTENDIMENTO DA SITUAÇÃO-PROBLEMA
  
SELECT * FROM contavinculada;
SELECT * FROM cliente;

DELETE FROM contavinculada WHERE CLIENTE_idCliente IN 
(SELECT idCliente FROM cliente WHERE rg IS NULL);

SELECT * FROM cliente;

