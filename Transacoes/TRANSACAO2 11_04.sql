#transação para confirmar a inserção de 3 clientes 

SELECT * FROM cliente ;
BEGIN;
	INSERT INTO cliente VALUES(NULL, "Fernando Telles","444", "444", "1975-05-12","(35)3295-1111");
	INSERT INTO cliente VALUES(NULL, "Alessando Silva","555", "555", "1982-04-21","(35)3295-5555");
	INSERT INTO cliente VALUES(NULL, "Gustavo Pereira","666", "666", "1975-03-19","(35)3295-6666"); 
COMMIT;
ROLLBACK;
SELECT * FROM cliente;