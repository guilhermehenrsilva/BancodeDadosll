# propposta: cris um trigger (tri_logApagaContaVinculada)
#que registre na auditoria a exclusão de uma conta vinculada 




delimiter $
CREATE TRIGGER tri_logApagaContaVinculada
AFTER DELETE
ON contavinculada
FOR EACH ROW 
BEGIN 
	SELECT nome INTO @nomeCliente FROM cliente 
	WHERE idCliente = OLD.CLIENTE_idCliente;
	
	SET @mensagem = CONCAT("Exclusão de Conta do Cliente: ", @nomeCliente);
	INSERT INTO auditoria 
	VALUES (NULL, @mensagem , "contavinculada" , NOW(), USER());
END$
delimiter;