#transação para colocar os nomes dos clientes em letras maiusculas desde que possuam telefone cadastrado

SELECT * FROM cliente ;
BEGIN;
	UPDATE cliente SET nome = UPPER(nome) WHERE telefone IS NOT NULL ;

#COMMIT;
ROLLBACK;
SELECT * FROM cliente;