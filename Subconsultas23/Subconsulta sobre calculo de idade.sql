/*Mostrar as contas vinculadas aos clientes com idade superior a 45anos contas vinculadas */agencia3si2023

SELECT cpf FROM clientes WHERE 
FLOOR(DATEDIFF(CURDATE(),dataNascimento) / 365) > 20);

SELECT * FROM vendas_geral ;

SELECT * FROM vendas_geral HAVING CLIENTES_cpf 
IN (SELECT cpf FROM clientes WHERE tipoVenda = "Cartão Débito");

