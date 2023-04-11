#comando para mostrar total financeiro da agencia 
SELECT SUM(saldo) FROM conta;


#comando para criar  a view chamada v_TotalFinanceiro
CREATE VIEW v_TotalFinanceiro AS (SELECT SUM(saldo) FROM conta);

#comando para visualizar o conteúdo da view
SELECT * FROM v_TotalFinanceiro;