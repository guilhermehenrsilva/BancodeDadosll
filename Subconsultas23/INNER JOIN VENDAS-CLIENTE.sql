SELECT v.codVenda, date_format(v.dataHora,"%d/%m/%Y %H:%i:%s")
	FROM venda
	AS v INNER JOIN cliente AS c 
	ON v.CLIENTE_codCliente = c.codCliente