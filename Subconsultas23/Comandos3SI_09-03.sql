/*Criar um relatório que mostre o nome de cada cliente,
 o identificador de sua conta conta com respctivo saldo
  e a data de abertura da mesma (no formato brasileiro:dia/mes/ano*/




SELECT cli.Nome, cv.CONTA_idCONTA, con.saldo, date_format(cv.dataAbertura,"%d/%m/%Y") AS DataAbertura
FROM cliente AS cli 
INNER JOIN conta AS con 
INNER JOIN contavinculada AS cv
ON cli.idCLIENTE = cv.cliente_idCLIENTE 
AND con.idCONTA = cv.CONTA_idCONTA


