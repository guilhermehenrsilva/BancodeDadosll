#Relatório consolidado para mostrar todas as vendas para determinado cliente

SELECT v.codVenda, DATE_FORMAT(v.dataHora,"%d/%m/%Y %H:%i:%s")AS dataHora, c.nome
FROM venda AS v INNER JOIN cliente AS c
ON v.CLIENTE_codCliente = c.codCliente
WHERE v.CLIENTE_codCliente = 2
ORDER BY v.codVenda;