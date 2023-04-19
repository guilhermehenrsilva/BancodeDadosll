/*proposta: criar um trigger que registre no log de auditoria
a alteração do cpf de um cliente da agencia*/

delimiter $
CREATE TRIGGER tri_logFiscalizaCPF AFTER UPDATE 
ON cliente 
FOR EACH ROW 
BEGIN 
	SET @mensagem = CONCAT("CPF do cliente: ", NEW.nome, "foi alterado para" , NEW.cpf);
	INSERT INTO auditoria VALUES (NULL, @mensagem, "cliente", NOW(), USER() );
END$
delimiter;