-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.24-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para panificadoracentral
CREATE DATABASE IF NOT EXISTS `panificadoracentral` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `panificadoracentral`;

-- Copiando estrutura para trigger panificadoracentral.tri_atualizaEstoque
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_atualizaEstoque` AFTER UPDATE ON `produtos_venda` FOR EACH ROW BEGIN

if (NEW.qtdProdutos > OLD.qtdProdutos)
	then UPDATE produtos SET qtdEstoque = qtdEstoque - (NEW.qtdProdutos - OLD.qtdProdutos)
			WHERE codProduto = NEW.PRODUTOS_codProduto;
	ELSE if (NEW.qtdProdutos < OLD.qtdProdutos)
				then UPDATE produtos SET qtdEstoque = qtdEstoque + (OLD.qtdProdutos - NEW.qtdProdutos)
				WHERE codProduto = NEW.PRODUTOS_codProduto;
			END if;
END if;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger panificadoracentral.tri_baixaEstoque
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_baixaEstoque` BEFORE INSERT ON `produtos_venda` FOR EACH ROW BEGIN
UPDATE produtos SET qtdEstoque = qtdEstoque - NEW.qtdprodutos
WHERE codProduto = NEW.PRODUTOS_codProduto;

SELECT nomeProduto INTO @nomeProd FROM produtos WHERE codProduto = NEW.PRODUTOS_codProduto;

SET @mensagem = CONCAT("Produto vendido = ", @nomeProd, " Quantidade = ", NEW.qtdprodutos,
" para a venda = ", NEW.VENDAS_GERAL_codVendaG);

INSERT INTO auditoria VALUES(NULL, @mensagem, "itemvenda", NOW(), USER());

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger panificadoracentral.tri_InsereProdutos
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_InsereProdutos` AFTER INSERT ON `produtos` FOR EACH ROW BEGIN 
	SET @mensagem = 
	CONCAT("Produto inserido: ", NEW.codProduto, 
	NEW.nomeProduto, " com a data de validade ", NEW.dataValidade, " e Marca: ", NEW.marcaProduto);
	INSERT INTO auditoria VALUES (NULL, @mensagem, "produtos", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger panificadoracentral.tri_LogAlteraEmailCli
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogAlteraEmailCli` BEFORE UPDATE ON `clientes` FOR EACH ROW BEGIN 
	SET @mensagem = CONCAT("Email do cliente: ", NEW.nomeCliente, " foi alterado para " , NEW.Email);
	INSERT INTO auditoria VALUES (NULL, @mensagem, "clientes", NOW(), USER() );
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger panificadoracentral.tri_LogDeleteCli
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogDeleteCli` AFTER DELETE ON `clientes` FOR EACH ROW BEGIN 
	SELECT cpf  INTO @cpfCliente FROM clientes 
	WHERE cpf = OLD.cpf;
	
	SET @mensagem = CONCAT("Exclusão do Cliente: ", OLD.nomeCliente, " do CPF ", OLD.cpf);
	INSERT INTO auditoria 
	VALUES (NULL, @mensagem , "clientes" , NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger panificadoracentral.tri_LogInsereCliente
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogInsereCliente` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN 
	SET @mensagem = CONCAT("Cliente inserido com o CPF: ", NEW.cpf, " e com o  Nome: ", 
	UPPER (NEW.nomeCliente), " e sua data de nascimento ", NEW.dataNascimento);
	INSERT INTO auditoria VALUES (NULL, @mensagem, "clientes", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger panificadoracentral.tri_logInsereClienteUF
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_logInsereClienteUF` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN 
	/*IF (NEW.uf="SP" OR NEW.uf="MG" OR NEW.uf="RJ" OR NEW.uf="ES")
	then
	SET @mensagem = CONCAT("Cliente inserido " , NEW.nomeCliente, 
	" pertencente a região sudeste " );
	INSERT INTO auditoria VALUES(NULL, @mensagem, "clientes", NOW(), USER());
	END if;*/
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger panificadoracentral.tri_RegistraLogClienteMaiores60anos
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_RegistraLogClienteMaiores60anos` AFTER INSERT ON `clientes` FOR EACH ROW #resgitra na tabela auditoria, todos os clientes que tem a idade superior a 60 anos
BEGIN
 SELECT FLOOR(DATEDIFF(CURDATE(), dataNascimento)/365) 
  INTO @idade FROM clientes WHERE cpf = NEW.cpf;
  
  if (@idade > 60) 
  	then
  		SET @mensagem = CONCAT("Inserção de cliente maiores do que 60 anos: " , NEW.nomeCliente);
  		INSERT INTO auditoria VALUES(null, @mensagem, "clientes", NOW(), USER());
  	END if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
