/* proposta: Criar um trigger que registra no LOG na auditoria a inserção de conta com 
seus respectivos dados: idConta, tipo e saldo sugestão para o nome = tri_logInsereConta*/

delimiter $
CREATE TRIGGER tri_logInsereConta  AFTER INSERT	 
ON conta 
FOR EACH ROW 
BEGIN 
	SET @mensagem = CONCAT("Conta inserida: ", NEW.idConta, "do tipo: " , NEW.tipo, 
	"e saldo: ", NEW.saldo);
	INSERT INTO auditoria VALUES (idCONTA, @mensagem, "conta", NOW(), USER() );
END$
delimiter;