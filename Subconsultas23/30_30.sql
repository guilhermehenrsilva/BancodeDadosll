SELECT cli.nome, con.tipo, con.saldo FROM cliente AS cli  INNER JOIN conta AS con
 INNER JOIN contavinculada AS cv
  ON cli.idCLIENTE = cv.CLIENTE_idCLIENTE
  AND con.IdCONTA = cv.CONTA_idCONTA;