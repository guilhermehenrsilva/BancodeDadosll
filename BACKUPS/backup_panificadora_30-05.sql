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
DROP DATABASE IF EXISTS `panificadoracentral`;
CREATE DATABASE IF NOT EXISTS `panificadoracentral` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `panificadoracentral`;

-- Copiando estrutura para tabela panificadoracentral.auditoria
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE IF NOT EXISTS `auditoria` (
  `codAuditoria` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(400) DEFAULT NULL,
  `tabela` varchar(50) DEFAULT NULL,
  `dataHora` datetime DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codAuditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='Registra as principais alterações neste BD.';

-- Copiando dados para a tabela panificadoracentral.auditoria: ~4 rows (aproximadamente)
INSERT INTO `auditoria` (`codAuditoria`, `acao`, `tabela`, `dataHora`, `usuario`) VALUES
	(78, 'Cliente inserido com o CPF: 1 e com o  Nome: guilherme e sua data de nascimento 1997-12-27', 'clientes', '2023-05-30 16:38:58', 'root@localhost'),
	(79, 'Produto inserido: 10PÃO com a data de validade 2023-07-20 e Marca: Própria', 'produtos', '2023-05-30 16:41:35', 'root@localhost'),
	(80, 'Produto vendido = PÃO Quantidade = 10.00 para a venda = 10.00', 'itemvenda', '2023-05-30 16:45:48', 'root@localhost'),
	(84, 'Produto vendido = PÃO Quantidade = 10.00 para a venda = 17', 'itemvenda', '2023-05-30 16:48:13', 'root@localhost');

-- Copiando estrutura para tabela panificadoracentral.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.categoria: ~1 rows (aproximadamente)
INSERT INTO `categoria` (`codCategoria`, `nomeCategoria`) VALUES
	(1, 'COMIDAS');

-- Copiando estrutura para tabela panificadoracentral.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `cpf` varchar(20) NOT NULL,
  `nomeCliente` varchar(200) NOT NULL,
  `dataNascimento` date NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `cidadeCliente` varchar(100) NOT NULL,
  `enderecoCliente` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.clientes: ~1 rows (aproximadamente)
INSERT INTO `clientes` (`cpf`, `nomeCliente`, `dataNascimento`, `telefone`, `email`, `cidadeCliente`, `enderecoCliente`, `bairro`, `cep`, `uf`) VALUES
	('1', 'guilherme', '1997-12-27', '111', 'guilherme@gmail.com', 'Machado', 'rua jornalista, 135', 'centro', '3775000', 'mg');

-- Copiando estrutura para tabela panificadoracentral.fornecedores
DROP TABLE IF EXISTS `fornecedores`;
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `cnpj` varchar(45) NOT NULL,
  `nomeFornecedor` varchar(200) NOT NULL,
  `telefoneFornecedor` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `enderecoFornecedor` varchar(200) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidadeFornecedor` varchar(200) NOT NULL,
  `cep` varchar(45) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.fornecedores: ~1 rows (aproximadamente)
INSERT INTO `fornecedores` (`cnpj`, `nomeFornecedor`, `telefoneFornecedor`, `email`, `enderecoFornecedor`, `bairro`, `cidadeFornecedor`, `cep`, `uf`) VALUES
	('1', 'comidas LTDA', '3295', 'comidas@comidas.com', 'rua industria , 3015', 'industrial', 'machado', '37750000', 'MG');

-- Copiando estrutura para tabela panificadoracentral.produtos
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `codProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nomeProduto` varchar(200) NOT NULL,
  `precoVenda` decimal(10,0) NOT NULL,
  `margemLucro` decimal(10,0) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL,
  `marcaProduto` varchar(100) NOT NULL,
  `qtdEstoque` decimal(10,2) DEFAULT NULL,
  `FORNECEDORES_cnpj` varchar(45) NOT NULL,
  `CATEGORIA_codCategoria` int(11) NOT NULL,
  PRIMARY KEY (`codProduto`,`FORNECEDORES_cnpj`,`CATEGORIA_codCategoria`),
  KEY `fk_PRODUTOS_FORNECEDORES1_idx` (`FORNECEDORES_cnpj`),
  KEY `fk_PRODUTOS_CATEGORIA1_idx` (`CATEGORIA_codCategoria`),
  CONSTRAINT `fk_PRODUTOS_CATEGORIA1` FOREIGN KEY (`CATEGORIA_codCategoria`) REFERENCES `categoria` (`codCategoria`),
  CONSTRAINT `fk_PRODUTOS_FORNECEDORES1` FOREIGN KEY (`FORNECEDORES_cnpj`) REFERENCES `fornecedores` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.produtos: ~1 rows (aproximadamente)
INSERT INTO `produtos` (`codProduto`, `nomeProduto`, `precoVenda`, `margemLucro`, `dataValidade`, `marcaProduto`, `qtdEstoque`, `FORNECEDORES_cnpj`, `CATEGORIA_codCategoria`) VALUES
	(10, 'PÃO', 1, 0, '2023-07-20', 'Própria', 80.00, '1', 1);

-- Copiando estrutura para tabela panificadoracentral.produtos_venda
DROP TABLE IF EXISTS `produtos_venda`;
CREATE TABLE IF NOT EXISTS `produtos_venda` (
  `VENDAS_GERAL_codVendaG` int(11) NOT NULL,
  `PRODUTOS_codProduto` int(11) NOT NULL,
  `qtdprodutos` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`VENDAS_GERAL_codVendaG`,`PRODUTOS_codProduto`),
  KEY `fk_VENDAS_GERAL_has_PRODUTOS_PRODUTOS1_idx` (`PRODUTOS_codProduto`),
  KEY `fk_VENDAS_GERAL_has_PRODUTOS_VENDAS_GERAL1_idx` (`VENDAS_GERAL_codVendaG`),
  CONSTRAINT `fk_VENDAS_GERAL_has_PRODUTOS_PRODUTOS1` FOREIGN KEY (`PRODUTOS_codProduto`) REFERENCES `produtos` (`codProduto`),
  CONSTRAINT `fk_VENDAS_GERAL_has_PRODUTOS_VENDAS_GERAL1` FOREIGN KEY (`VENDAS_GERAL_codVendaG`) REFERENCES `vendas_geral` (`codVendaG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.produtos_venda: ~2 rows (aproximadamente)
INSERT INTO `produtos_venda` (`VENDAS_GERAL_codVendaG`, `PRODUTOS_codProduto`, `qtdprodutos`) VALUES
	(16, 10, 10.00),
	(17, 10, 10.00);

-- Copiando estrutura para tabela panificadoracentral.vendas_geral
DROP TABLE IF EXISTS `vendas_geral`;
CREATE TABLE IF NOT EXISTS `vendas_geral` (
  `codVendaG` int(11) NOT NULL AUTO_INCREMENT,
  `datahoraVenda` datetime NOT NULL,
  `tipoVenda` enum('À Vista','Cartão Débito','Cartão Crédito') NOT NULL,
  `nomeVendedor` varchar(200) NOT NULL,
  `CLIENTES_cpf` varchar(20) NOT NULL,
  PRIMARY KEY (`codVendaG`,`CLIENTES_cpf`),
  KEY `fk_VENDAS_GERAL_CLIENTES_idx` (`CLIENTES_cpf`),
  CONSTRAINT `fk_VENDAS_GERAL_CLIENTES` FOREIGN KEY (`CLIENTES_cpf`) REFERENCES `clientes` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.vendas_geral: ~2 rows (aproximadamente)
INSERT INTO `vendas_geral` (`codVendaG`, `datahoraVenda`, `tipoVenda`, `nomeVendedor`, `CLIENTES_cpf`) VALUES
	(16, '2023-05-30 16:42:26', 'À Vista', 'ronaldo', '1'),
	(17, '2023-05-30 16:47:50', 'À Vista', 'ronaldo', '1');

-- Copiando estrutura para view panificadoracentral.v_clientesordemcrescende
DROP VIEW IF EXISTS `v_clientesordemcrescende`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clientesordemcrescende` (
	`nomeCliente` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`cpf` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`telefone` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view panificadoracentral.v_nascimentoordemcrescente
DROP VIEW IF EXISTS `v_nascimentoordemcrescente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_nascimentoordemcrescente` (
	`nomeCliente` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`DATE_FORMAT(dataNascimento, "%d/%m/%Y")` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view panificadoracentral.v_uf
DROP VIEW IF EXISTS `v_uf`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_uf` (
	`nomeCliente` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`date_format(dataNascimento,"%d/%m/%y")` VARCHAR(8) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para procedure panificadoracentral.new_alteraCategoria
DROP PROCEDURE IF EXISTS `new_alteraCategoria`;
DELIMITER //
CREATE PROCEDURE `new_alteraCategoria`(
	IN `codCatAlterado` int,
	IN `nomeCatAlterado` varchar(45)
)
BEGIN
	SELECT COUNT(*) INTO @contador  FROM categoria AS c
	WHERE c.codCategoria = codCatAlterado;
	SELECT "Alterada com sucesso!!";
if(@contador = 0)	
	then SELECT "Categoria não encontrada!!!!" AS erro;
	else
	update categoria set  nomeCategoria=nomeCatAlterado where codCategoria=codCatAlterado;
END if;	
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_alteraClientes
DROP PROCEDURE IF EXISTS `new_alteraClientes`;
DELIMITER //
CREATE PROCEDURE `new_alteraClientes`(
	IN `cpfcodigo` varchar(20),
	IN `nomeAlt` varchar(200),
	IN `dataAlt` date,
	IN `telefoneAlt` varchar(20),
	IN `emailAlt` varchar(200),
	IN `cidadeClienteAlt` varchar(100),
	IN `enderecoAlt` varchar(200),
	IN `bairroAlt` varchar(200),
	IN `cepAlt` varchar(20),
	IN `ufAlt` varchar (2)
)
BEGIN

	SELECT COUNT(*) INTO @contador  FROM clientes AS c
	WHERE c.cpf = cpfcodigo;
if(@contador = 0)	
	then SELECT "Cliente não encontrado!!!!" AS erro;
	else
	update clientes set nomeCliente=nomeAlt, dataNascimento=dataAlt, telefone=telefoneAlt, email=emailAlt, 
    cidadeCliente=cidadeClienteAlt, enderecoCliente=enderecoAlt, bairro=bairroAlt, cep=cepAlt, uf=ufAlt where cpf=cpfcodigo;

END if;
    

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_alteraFornecedor¹
DROP PROCEDURE IF EXISTS `new_alteraFornecedor¹`;
DELIMITER //
CREATE PROCEDURE `new_alteraFornecedor¹`(
	IN `cnpjAlt` varchar(45),
	IN `nomeFornAlt` varchar(200),
	IN `telefoneFornAlt` varchar(20),
	IN `emailFornAlt` varchar(200),
	IN `enderecoFornAlt` varchar(200),
	IN `bairroFornAlt` varchar(100),
	IN `cidadeFornAlt` varchar(200),
	IN `cepFornAlt` varchar(45),
	IN `ufFornAlt` char(2)
)
BEGIN
	SELECT COUNT(*) INTO @contador  FROM fornecedores AS f
	WHERE f.cnpj = cnpjAlt;
	SELECT "Alterado com sucesso!!"; 
if(@contador = 0)	
	then SELECT "Fornecedor não encontrado!!!!" AS erro;
	else
	update fornecedores set  nomeFornecedor = nomeFornAlt 
		where cnpj = cnpjAlt;
    update fornecedores set  telefoneFornecedor = telefoneFornAlt 
		where cnpj = cnpjAlt;
    update fornecedores set  email = emailFornAlt 
		where cnpj = cnpjAlt;
    update fornecedores set  enderecoFornecedor = enderecoFornAlt 
		where cnpj = cnpjAlt;
	update fornecedores set  bairro = bairroFornAlt 
		where cnpj = cnpjAlt;
	update fornecedores set  cidadeFornecedor = cidadeFornAlt 
		where cnpj = cnpjAlt;
	update fornecedores set  cep = cepFornAlt
		where cnpj = cnpjAlt;
    update fornecedores set  uf = ufFornAlt
		where cnpj = cnpjAlt;  
END if;		  
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_alteraProduto
DROP PROCEDURE IF EXISTS `new_alteraProduto`;
DELIMITER //
CREATE PROCEDURE `new_alteraProduto`(
	IN `codProdAlt` int,
	IN `nomeProdAlt` varchar(200),
	IN `precoVendaAlt` decimal(10.0),
	IN `margemLucroAlt` decimal(10.0),
	IN `dataValidadeAlt` date,
	IN `marcaProdAlt` varchar(100),
	IN `qtdEstoqueAlt` decimal(10.2),
	IN `fornecedorAlt` varchar(45),
	IN `categoriaAlt` int
)
BEGIN 
	SELECT COUNT(*) INTO @contador  FROM produtos AS c
	WHERE c.codProduto = codProdAlt;
	SELECT "Produto alterado com Sucesso!!";
if(@contador = 0)	
	then SELECT "Produto não encontrado!!" AS erro;
	else
	update produtos set
	nomeProduto=nomeProdAlt,
		precoVenda=precoVendaAlt,
			margemLucro=margemLucroAlt,
				dataValidade=dataValidadeAlt,
  					 marcaProduto=marcaProdAlt,
						qtdEstoque=qtdEstoqueAlt,
							FORNECEDORES_cnpj=fornecedorAlt,
								CATEGORIA_codcategoria=categoriaAlt
	where codProduto=codProdAlt;
	
END if;
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_alteraVenda
DROP PROCEDURE IF EXISTS `new_alteraVenda`;
DELIMITER //
CREATE PROCEDURE `new_alteraVenda`(in codVendaGAlt int, in datahoraVendaAlt datetime, in tipoVendaAlt enum ('À Vista','Cartão Débito','Cartão Crédito'), in nomeVendedorAlt varchar(200), in cpfClienteConsumidorAlt varchar(20))
BEGIN
	update vendas_geral set datahoraVenda=datahoraVendaAlt, tipoVenda=tipoVendaAlt, nomeVendedor=nomeVendedorAlt, CLIENTES_cpf=cpfClienteConsumidorAlt where codVendaG=codVendaGAlt;

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_deleteCategoria
DROP PROCEDURE IF EXISTS `new_deleteCategoria`;
DELIMITER //
CREATE PROCEDURE `new_deleteCategoria`(
	IN `codCatExcluir` int
)
BEGIN
	SELECT COUNT(*) INTO @contador  FROM categoria AS c
	WHERE c.codCategoria = codCatExcluir ;
	SELECT "Excluida com sucesso!!"; 
if(@contador = 0)	
	then SELECT "Categoria não encontrada!!!!" AS erro;
	else
	delete from categoria where codCategoria = codCatExcluir;
END if;	
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_deleteCliente
DROP PROCEDURE IF EXISTS `new_deleteCliente`;
DELIMITER //
CREATE PROCEDURE `new_deleteCliente`(
	IN `cpfcodigo` varchar(20)
)
BEGIN
	SELECT COUNT(*) INTO @contador  FROM clientes AS c
	WHERE c.cpf = cpfcodigo;
if(@contador = 0)	
	then SELECT "Cliente não encontrado!!!!" AS erro;
	delete from clientes where cpf=cpfcodigo;
END if;
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_deleteFornecedor
DROP PROCEDURE IF EXISTS `new_deleteFornecedor`;
DELIMITER //
CREATE PROCEDURE `new_deleteFornecedor`(in cnpjExcluir varchar(45))
BEGIN
	delete from fornecedores where cnpj=cnpjExcluir;
	

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_deleteProduto
DROP PROCEDURE IF EXISTS `new_deleteProduto`;
DELIMITER //
CREATE PROCEDURE `new_deleteProduto`(
	IN `codProdExcluir` int
)
BEGIN

SELECT COUNT(*) INTO @contador FROM produtos
WHERE codProduto = codProdExcluir;

if (@contador = 0)
	then SELECT "Produto não encontrado" AS erro;
	ELSE 
		DELETE FROM produtos WHERE codProduto = codProdExcluir;
		SET @mensagem = CONCAT("Produto excluído = ",codProdExcluir,nomeProduto);
		INSERT INTO auditoria VALUES(NULL,@mensagem,"produto",NOW(),USER());
END if;		
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_deleteVenda
DROP PROCEDURE IF EXISTS `new_deleteVenda`;
DELIMITER //
CREATE PROCEDURE `new_deleteVenda`(in codExcluirVenda int)
BEGIN
	delete from vendas_geral where codVendaG=codExcluirVenda; 

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_insereCategoria
DROP PROCEDURE IF EXISTS `new_insereCategoria`;
DELIMITER //
CREATE PROCEDURE `new_insereCategoria`(in nomeNovaCat varchar(45))
BEGIN
	insert into categoria(codCategoria,nomeCategoria)
    values (null, nomeNovaCat);
   
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_insereClientes
DROP PROCEDURE IF EXISTS `new_insereClientes`;
DELIMITER //
CREATE PROCEDURE `new_insereClientes`(in cpfNovo varchar(20), in nomeNovo varchar(100), in dataNova date, 
in telefoneNovo varchar(20), in emailNovo varchar(200),in cidadeClienteNovo varchar (100),  in enderecoNovo varchar(100), in bairroNovo varchar(100),
 in cepNovo varchar(20), in ufNovo varchar(20))
BEGIN

	insert into clientes(cpf, nomeCliente, dataNascimento, telefone, email, cidadeCliente, enderecoCliente, bairro, cep, uf)
    values (cpfNovo, nomeNovo, dataNova, telefoneNovo, emailNovo,cidadeClienteNovo, enderecoNovo, bairroNovo, cepNovo, ufNovo);
   
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_insereFornecedor
DROP PROCEDURE IF EXISTS `new_insereFornecedor`;
DELIMITER //
CREATE PROCEDURE `new_insereFornecedor`(in cnpjNovo varchar(45), in nomeNovoForn varchar(200), in telefoneNovoForn varchar(20),
										in emailNovoForn varchar(200), in enderecoNovoForn varchar(200), in bairroNovoForn varchar(100), 
                                        in cidadeNovoForn varchar(200), in cepNovoForn varchar(45), in ufNovoForn char(2))
BEGIN
	insert into fornecedores(cnpj,nomeFornecedor, telefoneFornecedor, email,enderecoFornecedor, bairro, cidadeFornecedor, cep, uf)
    values (cnpjNovo, nomeNovoForn, telefoneNovoForn, emailNovoForn, enderecoNovoForn, bairroNovoForn, cidadeNovoForn, cepNovoForn, ufNovoForn);
    

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_insereProduto
DROP PROCEDURE IF EXISTS `new_insereProduto`;
DELIMITER //
CREATE PROCEDURE `new_insereProduto`(in nomeNovoProd varchar(200),in precoNovoVenda decimal(10.0),
									in margemNovoLucro decimal(10.0), in dataNovoValidade date, 
                                    in marcaNovoProd varchar(100), in qtdNovoEstoque decimal(10.2), in fornecedorProd varchar(45), in categoriaProd int)
BEGIN 
	insert into produtos(codProduto,nomeProduto,precoVenda,margemLucro,dataValidade,marcaProduto,qtdEstoque,FORNECEDORES_cnpj,CATEGORIA_codCategoria) 
    values(null,nomeNovoProd, precoNovoVenda, margemNovoLucro, dataNovoValidade, marcaNovoProd,qtdNovoEstoque, fornecedorProd, categoriaProd);
	

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_insereVenda
DROP PROCEDURE IF EXISTS `new_insereVenda`;
DELIMITER //
CREATE PROCEDURE `new_insereVenda`(in datahoraNovaVenda datetime, in tipoNovaVenda enum ('À Vista','Cartão Débito','Cartão Crédito'),
									in nomeVendedorNovaVenda varchar(200), in cpfClienteConsumidor varchar(20))
BEGIN
	insert into vendas_geral(codVendaG, datahoraVenda, tipoVenda, nomeVendedor, CLIENTES_cpf)
    values(null, datahoraNovaVenda, tipoNovaVenda, nomeVendedorNovaVenda, cpfClienteConsumidor);
	

END//
DELIMITER ;

-- Copiando estrutura para trigger panificadoracentral.tri_atualizaEstoque
DROP TRIGGER IF EXISTS `tri_atualizaEstoque`;
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
DROP TRIGGER IF EXISTS `tri_baixaEstoque`;
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
DROP TRIGGER IF EXISTS `tri_InsereProdutos`;
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
DROP TRIGGER IF EXISTS `tri_LogAlteraEmailCli`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogAlteraEmailCli` BEFORE UPDATE ON `clientes` FOR EACH ROW BEGIN 
	SET @mensagem = CONCAT("Email do cliente: ", NEW.nomeCliente, " foi alterado para " , NEW.Email);
	INSERT INTO auditoria VALUES (NULL, @mensagem, "clientes", NOW(), USER() );
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger panificadoracentral.tri_LogDeleteCli
DROP TRIGGER IF EXISTS `tri_LogDeleteCli`;
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
DROP TRIGGER IF EXISTS `tri_LogInsereCliente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogInsereCliente` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN 
	SET @mensagem = CONCAT("Cliente inserido com o CPF: ", NEW.cpf, " e com o  Nome: ", 
	NEW.nomeCliente, " e sua data de nascimento ", NEW.dataNascimento);
	INSERT INTO auditoria VALUES (NULL, @mensagem, "clientes", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger panificadoracentral.tri_logInsereClienteUF
DROP TRIGGER IF EXISTS `tri_logInsereClienteUF`;
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
DROP TRIGGER IF EXISTS `tri_RegistraLogClienteMaiores60anos`;
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

-- Copiando estrutura para view panificadoracentral.v_clientesordemcrescende
DROP VIEW IF EXISTS `v_clientesordemcrescende`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clientesordemcrescende`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_clientesordemcrescende` AS (SELECT nomeCliente, cpf, telefone FROM clientes ORDER BY nomeCliente) ;

-- Copiando estrutura para view panificadoracentral.v_nascimentoordemcrescente
DROP VIEW IF EXISTS `v_nascimentoordemcrescente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_nascimentoordemcrescente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_nascimentoordemcrescente` AS (SELECT nomeCliente, DATE_FORMAT(dataNascimento, "%d/%m/%Y") FROM clientes ORDER BY dataNascimento) ;

-- Copiando estrutura para view panificadoracentral.v_uf
DROP VIEW IF EXISTS `v_uf`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_uf`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_uf` AS (SELECT nomeCliente, date_format(dataNascimento,"%d/%m/%y") from clientes WHERE uf LIKE "%MG") ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
