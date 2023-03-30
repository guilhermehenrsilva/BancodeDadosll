/*Mostrar as contas desde que os saldos sejam iguais ou maiores que a media dos saldos */ 


SELECT * FROM conta;
SELECT SUM(saldo) FROM conta;
SELECT format(SUM(saldo),2) FROM conta;
SELECT COUNT(*) FROM conta;
SELECT SUM(saldo) / COUNT(*) FROM conta;
SELECT AVG(saldo) FROM conta;
#subconsulta
SELECT * FROM conta WHERE saldo >= (SELECT AVG(saldo) FROM conta) ;