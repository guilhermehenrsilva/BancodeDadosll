SELECT * FROM vendas_geral ;

SELECT * FROM vendas_geral HAVING CLIENTES_cpf 
IN (SELECT cpf FROM clientes WHERE tipoVenda = "Cartão Débito");
