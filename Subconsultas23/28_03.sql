SELECT * FROM cliente;
DESC cliente;

INSERT INTO cliente(idCliente, nome, cpf, dataNascimento) 
VALUES (NULL,"Fabiana Silva","999.999.999-99","1970-12-02");

#criação de uma tabela cirtual - VIEW para ordenar 
#os clientes em ordem alfabetica crescente
CREATE VIEW v_ClientesOrdemCrescende AS
 (SELECT * FROM cliente ORDER BY nome)
 
 SHOW TABLES ;
 
 #verificando dos dados de uma view 
 
 SELECT idCliente ,nome, cpf FROM v_clientesordemcrescende;