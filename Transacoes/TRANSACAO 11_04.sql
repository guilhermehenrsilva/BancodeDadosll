#transação para atualização DO saldo das contas DO tipo poupança em 10%

SELECT * FROM conta;
BEGIN;
	UPDATE conta SET saldo = saldo * 1.10
	WHERE tipo = "Poupança";
ROLLBACK;
SELECT * FROM conta;