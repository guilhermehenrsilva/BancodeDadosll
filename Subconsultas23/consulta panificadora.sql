#SELECT * FROM clientes # HAVING CLIENTE_clientes IN
(SELECT cpf FROM clientes WHERE 
FLOOR(DATEDIFF(CURDATE(),dataNascimento) / 365) > 18);