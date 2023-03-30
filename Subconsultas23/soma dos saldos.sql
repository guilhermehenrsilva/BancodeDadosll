#exemplo de subconsulta com HAVING E GROUP BY 

#relatorios de todas as contas 
SELECT * FROM conta;

#relatório com a soma de todos os saldos
SELECT SUM(saldo) FROM conta where tipo = "poupança";

SELECT tipo, format(SUM(saldo),2) AS somaSaldo FROM conta GROUP BY tipo;

SELECT format(AVG(saldo),2) FROM conta;


#relatório das contas  mostrando o tipo e a soma dos respectivos saldos tendo 
#sendo essa soma maior  que a média dos saldos 

SELECT tipo, SUM(saldo) AS somaSaldo FROM conta GROUP BY tipo
HAVING somaSaldo > (SELECT AVG(saldo) FROM conta);