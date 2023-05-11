BEGIN
UPDATE produto
SET produto.quantidadeEstoque = quantidadeEstoque - NEW.quantidade
WHERE codProduto = new.PRODUTO_codProduto;

SELECT nome INTO @nomeProd FROM produto WHERE codProduto = NEW.PRODUTO_codProduto;

SET @mensagem = CONCAT("Produto vendido = ", @nomeProd ," Quantidade = ", NEW.quantidade , "para a venda = ", NEW.VENDA_codVenda);

INSERT INTO auditoria VALUES(NULL, @mensagem, "itemVenda", NOW(), USER());
END