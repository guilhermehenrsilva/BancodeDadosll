#mostrar id nome e telefone dos clinetes que possuem essa informação telefone 
SELECT idCliente, nome, telefone FROM cliente WHERE telefone IS NOT NULL ;

CREATE VIEW agenda1 AS(SELECT idCliente, nome, telefone FROM cliente WHERE telefone IS NOT NULL);

RENAME TABLE agenda1 TO v_agenda1;

#mostrar nomes dos clientes e data de nascimento no formato brasileiro 


SELECT nome, date_format(dataNascimento,"%d/%m/%Y") AS Nascimento
FROM cliente ;
 
CREATE VIEW V_nascimentoClientes AS (SELECT nome, date_format(dataNascimento,"%d/%m/%Y") AS Nascimento
FROM cliente);

CREATE VIEW V_NascimentoOrdemCrescente AS (SELECT nomeCliente, DATE_FORMAT(dataNascimento, "%d/%m/%y") FROM clientes ORDER BY dataNascimento);


CREATE VIEW V_uf AS (SELECT * FROM clientes WHERE uf LIKE "%MG");


SELECT * FROM  v_nascimentoordemcrescente;



CREATE VIEW V_uf AS (SELECT nomeCliente, date_format(dataNascimento,"%d/%m/%y") from clientes WHERE uf LIKE "%MG") 
SELECT * FROM V_uf;