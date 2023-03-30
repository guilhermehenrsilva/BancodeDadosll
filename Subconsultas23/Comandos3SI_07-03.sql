#Mostrar BDs instalados 
SHOW DATABASES; 
    
#indicar qual DB será usado
USE agencia3si2023;

#mostrar as tabelas (entidades) do BD em uso
SHOW TABLES;

#Descrever a estrutura de uma tabela especifica
DESC cliente;

#inserir um cliente por vez (comando)
#preenchendo apenas campos obrigatórios
INSERT INTO cliente (idCliente, Nome, cpf, dataNascimento)
 VALUES (NULL,"Guilherme", "132.447.506-48","1997-12-27");
 
 INSERT INTO cliente (idCliente, Nome, cpf, dataNascimento)
 VALUES (NULL,"Pedro Augusto Telles", "99.036.036.66","1956-12-23");
 
 #inserir varios clientes por vez (comando)
#preenchendo apenas campos obrigatórios

INSERT INTO cliente (idCliente, Nome, cpf, dataNascimento)
 VALUES (NULL,"Rosalia Alves", "777.036.036-77","1997-12-27"),
 (NULL,"Lúcia Silviano", "444.036.444-77","1974-04-24");
 
#relatório dos clientes em ordem alfabética decrescente 
SELECT * FROM cliente ORDER BY nome asc;

