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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='Registra as principais alterações neste BD.';

-- Copiando dados para a tabela panificadoracentral.auditoria: ~67 rows (aproximadamente)
INSERT INTO `auditoria` (`codAuditoria`, `acao`, `tabela`, `dataHora`, `usuario`) VALUES
	(1, 'Cliente inserido: 888888888 Nome: teste e sua data de nascimento 2000-05-02', 'nome', '2023-05-02 10:02:04', 'root@localhost'),
	(2, 'Cliente inserido com o CPF: 7777e com o  Nome:  e sua data de nascimento 0000-00-00', 'nome', '2023-05-02 10:04:06', 'root@localhost'),
	(3, 'Cliente inserido com o CPF: 1324 e com o  Nome: teste e sua data de nascimento 2003-05-02', 'nome', '2023-05-02 10:05:39', 'root@localhost'),
	(4, 'Email do cliente: teste foi alterado para teste.com.br', 'clientes', '2023-05-02 10:18:52', 'root@localhost'),
	(5, NULL, 'clientes', '2023-05-02 10:30:47', 'root@localhost'),
	(6, NULL, 'clientes', '2023-05-02 10:31:04', 'root@localhost'),
	(7, NULL, 'clientes', '2023-05-02 10:31:45', 'root@localhost'),
	(8, 'Cliente inserido com o CPF: 132 e com o  Nome:  e sua data de nascimento 0000-00-00', 'nome', '2023-05-02 10:34:17', 'root@localhost'),
	(9, NULL, 'clientes', '2023-05-02 10:34:34', 'root@localhost'),
	(10, 'Exclusão do Cliente: @nomeCliente ', 'clientes', '2023-05-02 10:36:05', 'root@localhost'),
	(11, 'Exclusão do Cliente: Gabriel otavio ', 'clientes', '2023-05-02 10:37:13', 'root@localhost'),
	(12, 'Cliente inserido com o CPF: 132 e com o  Nome: teste e sua data de nascimento 2000-05-02', 'nome', '2023-05-02 10:38:32', 'root@localhost'),
	(13, 'Exclusão do Cliente: 132teste', 'clientes', '2023-05-02 10:38:36', 'root@localhost'),
	(14, 'Cliente inserido com o CPF: 13245678910 e com o  Nome: arygui e sua data de nascimento 2000-05-02', 'nome', '2023-05-02 10:40:38', 'root@localhost'),
	(15, 'Exclusão do Cliente: aryguide CPF 13245678910', 'clientes', '2023-05-02 10:41:12', 'root@localhost'),
	(16, 'Cliente inserido com o CPF: 132 e com o  Nome: jubileu batata e sua data de nascimento 2049-05-09', 'nome', '2023-05-09 10:22:09', 'root@localhost'),
	(17, 'Exclusão do Cliente: jubileu batata do CPF 132', 'clientes', '2023-05-09 10:22:51', 'root@localhost'),
	(18, 'Cliente inserido com o CPF: 132444 e com o  Nome: teste e sua data de nascimento 1949-05-09', 'nome', '2023-05-09 10:23:11', 'root@localhost'),
	(19, 'Inserção de cliente maiores do que 45 anos: teste', 'clientes', '2023-05-09 10:23:11', 'root@localhost'),
	(20, 'Cliente inserido com o CPF: 1456 e com o  Nome:  e sua data de nascimento 0000-00-00', 'nome', '2023-05-09 10:35:43', 'root@localhost'),
	(21, 'Cliente inserido com o CPF: 1456 e com o  Nome:  e do seu Estado 0SPESRJ', 'nome', '2023-05-09 10:35:43', 'root@localhost'),
	(22, 'Exclusão do Cliente:  do CPF 1456', 'clientes', '2023-05-09 10:35:46', 'root@localhost'),
	(23, 'Cliente inserido com o CPF: 123456 e com o  Nome: testeUF e sua data de nascimento 1945-05-09', 'nome', '2023-05-09 10:36:51', 'root@localhost'),
	(24, 'Inserção de cliente maiores do que 60 anos: testeUF', 'clientes', '2023-05-09 10:36:51', 'root@localhost'),
	(25, 'Cliente inserido com o CPF: 123456 e com o  Nome: testeUF e do seu Estado 0SPESRJ', 'nome', '2023-05-09 10:36:51', 'root@localhost'),
	(26, 'Exclusão do Cliente: testeUF do CPF 123456', 'clientes', '2023-05-09 10:39:09', 'root@localhost'),
	(27, 'Cliente inserido com o CPF: 44444 e com o  Nome: TESTE UF e sua data de nascimento 2000-05-09', 'nome', '2023-05-09 10:39:32', 'root@localhost'),
	(28, 'Cliente inserido com o CPF: 44444 e com o  Nome: TESTE UF e do seu Estado 1', 'nome', '2023-05-09 10:39:32', 'root@localhost'),
	(29, 'Exclusão do Cliente: TESTE UF do CPF 44444', 'clientes', '2023-05-09 10:41:45', 'root@localhost'),
	(30, 'Cliente inserido com o CPF: 444 e com o  Nome: testeUF e sua data de nascimento 2023-05-09', 'nome', '2023-05-09 10:42:03', 'root@localhost'),
	(31, 'Cliente inserido com o CPF: 444 e com o  Nome: testeUF pertencente ao estado de: 1', 'clientes', '2023-05-09 10:42:03', 'root@localhost'),
	(32, 'Exclusão do Cliente: testeUF do CPF 444', 'clientes', '2023-05-09 10:44:52', 'root@localhost'),
	(33, 'Cliente inserido com o CPF: 444 e com o  Nome: TESTEUF e sua data de nascimento 2023-05-09', 'nome', '2023-05-09 10:45:05', 'root@localhost'),
	(34, 'Cliente inserido com o CPF: 444 e com o  Nome: TESTEUF pertencente ao estado de: 1', 'clientes', '2023-05-09 10:45:05', 'root@localhost'),
	(35, 'Exclusão do Cliente: TESTEUF do CPF 444', 'clientes', '2023-05-09 10:56:05', 'root@localhost'),
	(36, 'Cliente inserido com o CPF: 444 e com o  Nome: testeUF e sua data de nascimento 2015-05-09', 'nome', '2023-05-09 10:56:24', 'root@localhost'),
	(37, 'Cliente inserido com o CPF: 444 e com o  Nome: testeUF pertencente a região sudeste ', 'clientes', '2023-05-09 10:56:24', 'root@localhost'),
	(38, 'Cliente inserido com o CPF: 1222 e com o  Nome: testeUF2 e sua data de nascimento 2023-05-10', 'nome', '2023-05-10 07:31:20', 'root@localhost'),
	(39, 'Exclusão do Cliente: testeUF do CPF 444', 'clientes', '2023-05-10 07:32:40', 'root@localhost'),
	(40, 'Exclusão do Cliente: teste do CPF 132444', 'clientes', '2023-05-10 07:32:43', 'root@localhost'),
	(41, 'Exclusão do Cliente: TESTEUF2 do CPF 444', 'clientes', '2023-05-10 07:36:52', 'root@localhost'),
	(42, 'Cliente inserido TESTEUF pertencente a região sudeste ', 'clientes', '2023-05-10 07:37:06', 'root@localhost'),
	(43, NULL, 'clientes', '2023-05-10 07:37:44', 'root@localhost'),
	(44, 'Exclusão do Cliente: TESTEUF do CPF 555', 'clientes', '2023-05-10 07:39:17', 'root@localhost'),
	(45, 'Cliente inserido testeuf pertencente a região sudeste ', 'clientes', '2023-05-10 07:39:31', 'root@localhost'),
	(46, 'Cliente inserido TESTEUF2 pertencente a região sudeste ', 'clientes', '2023-05-10 07:42:00', 'root@localhost'),
	(47, 'Cliente inserido com o CPF: 6666 e com o  Nome: TESTEUF2 e sua data de nascimento 2023-05-10', 'nome', '2023-05-10 07:42:00', 'root@localhost'),
	(48, 'Cliente inserido com o CPF: 5152 e com o  Nome: TESTE03 e sua data de nascimento 2023-05-10', 'nome', '2023-05-10 07:43:54', 'root@localhost'),
	(49, 'Cliente inserido com o CPF: 8552 e com o  Nome: TESTE e sua data de nascimento 0000-00-00', 'nome', '2023-05-10 07:44:47', 'root@localhost'),
	(50, NULL, 'clientes', '2023-05-10 07:45:04', 'root@localhost'),
	(51, 'Exclusão do Cliente: TESTE do CPF 8552', 'clientes', '2023-05-10 07:45:29', 'root@localhost'),
	(52, 'Exclusão do Cliente: TESTEUF2 do CPF 6666', 'clientes', '2023-05-10 07:45:32', 'root@localhost'),
	(53, 'Exclusão do Cliente: testeuf do CPF 555', 'clientes', '2023-05-10 07:45:35', 'root@localhost'),
	(54, 'Exclusão do Cliente: TESTE03 do CPF 5152', 'clientes', '2023-05-10 07:45:37', 'root@localhost'),
	(55, 'Cliente inserido com o CPF: 456 e com o  Nome: TESTE e sua data de nascimento 2023-05-10', 'nome', '2023-05-10 07:45:50', 'root@localhost'),
	(56, 'Cliente inserido com o CPF: 525 e com o  Nome: HENRIQUE e sua data de nascimento 2023-05-10', 'nome', '2023-05-10 07:50:59', 'root@localhost'),
	(57, 'Cliente inserido com o CPF: 858 e com o  Nome: TETSE e sua data de nascimento 2023-05-10', 'nome', '2023-05-10 07:59:00', 'root@localhost'),
	(58, 'Cliente inserido com o CPF: 5555 e com o  Nome: TESTE500 e sua data de nascimento 2023-05-10', 'nome', '2023-05-10 08:00:20', 'root@localhost'),
	(59, 'Exclusão do Cliente: TETSE do CPF 858', 'clientes', '2023-05-10 08:03:01', 'root@localhost'),
	(60, 'Exclusão do Cliente: TESTE500 do CPF 5555', 'clientes', '2023-05-10 08:03:04', 'root@localhost'),
	(61, 'Exclusão do Cliente: HENRIQUE do CPF 525', 'clientes', '2023-05-10 08:03:07', 'root@localhost'),
	(62, 'Exclusão do Cliente: TESTE do CPF 456', 'clientes', '2023-05-10 08:03:11', 'root@localhost'),
	(63, 'Cliente inserido com o CPF: 5555 e com o  Nome: teste e sua data de nascimento 2023-05-10', 'clientes', '2023-05-10 08:03:20', 'root@localhost'),
	(64, 'Produto inserido: 4COCA COLA com a data de validade 2023-06-25e Marca: COLA-COLA', 'produtos', '2023-05-11 09:48:13', 'root@localhost'),
	(65, NULL, 'produtos', '2023-05-11 09:53:38', 'root@localhost'),
	(66, 'Produto inserido: 8FANTA com a data de validade 2023-06-11e Marca: COCA-COLA', 'produtos', '2023-05-11 10:09:47', 'root@localhost'),
	(67, 'Produto inserido: 9pão com a data de validade 2023-06-25 e Marca: Propria', 'produtos', '2023-05-25 10:34:05', 'root@localhost'),
	(68, 'Produto excluído= 9', 'produto', '2023-05-29 16:45:24', 'root@localhost'),
	(69, 'Produto excluído = 4', 'produto', '2023-05-29 16:49:11', 'root@localhost'),
	(70, 'Produto excluído = 3', 'produto', '2023-05-29 16:50:16', 'root@localhost');

-- Copiando estrutura para tabela panificadoracentral.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.categoria: ~9 rows (aproximadamente)
INSERT INTO `categoria` (`codCategoria`, `nomeCategoria`) VALUES
	(3, 'Refrigerante'),
	(4, 'Chá'),
	(6, 'Farinha de Trigo'),
	(7, 'Sal Refinado'),
	(8, 'Óleo de Soja'),
	(9, 'Fermento Fresco Salgado'),
	(10, 'Fermento Fresco Doce'),
	(11, 'Cobertura Cremosa'),
	(12, 'Pães');

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

-- Copiando dados para a tabela panificadoracentral.clientes: ~6 rows (aproximadamente)
INSERT INTO `clientes` (`cpf`, `nomeCliente`, `dataNascimento`, `telefone`, `email`, `cidadeCliente`, `enderecoCliente`, `bairro`, `cep`, `uf`) VALUES
	('07468454789', 'Gustavo Alves Luiz', '2004-05-14', '(35)9999-0000', 'gustavoalves3@outlook.com', 'Paraguaçu', 'Rua dos Marolos - 77', 'Centro', '37120000', 'MG'),
	('1222', 'testeUF2', '2023-05-10', '', NULL, '', '', '', '', ''),
	('1234', 'Maria Fernandes ', '1999-02-23', '(35)3295-0000', 'maria@fernandes', 'Varginha', 'Rua Tenório - 23', 'Jardim Aurora', '38000', 'MG'),
	('12983639690', 'Aryane Cassimiro Machado', '2003-09-03', '35997430134', 'aryane.@gmail.com', 'Carvalhópolis', 'Rua Primavera - 89', 'Centro', '37760000', 'MG'),
	('13244750648', 'Guilherme Henrique Alves', '1997-12-27', '3599995555', 'guilhermealves@gmail.com', 'Machado', 'Rua dos Ipês - 78', 'Jardim Primavera', '37750000', 'SP'),
	('5555', 'teste', '2023-05-10', '', NULL, '', '', '', '', '');

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

-- Copiando dados para a tabela panificadoracentral.fornecedores: ~3 rows (aproximadamente)
INSERT INTO `fornecedores` (`cnpj`, `nomeFornecedor`, `telefoneFornecedor`, `email`, `enderecoFornecedor`, `bairro`, `cidadeFornecedor`, `cep`, `uf`) VALUES
	('01564520000185', 'Sem limites', '353355-9600', 'semlimites@semlimites.com', 'avenida brasil - 320', 'recanto feliz', 'pouso alegre ', '37800132', 'MG'),
	('02497520000187', 'Herboflora LTDA', '32956330', 'herboflora@herboflora.com', 'Rua industria - 48', 'Industrial 2', 'Paraguaçu', '37750001', 'MG'),
	('23000000', 'Ambev', '354444000', 'ambev03@gmail.com', 'Avenida Dom Pedro - 152', 'Recanto Industrial ', 'Pouso Alegre ', '39560000', 'MG');

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
if(@contador = 0)	
	then SELECT "Categoria não encontrada!!!!" AS erro;
	update categoria set codCategoria=codCatAlterado where nomeCategoria=nomeCatAlterado;
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
if(@contador = 0)	
	then SELECT "Fornecedor não encontrado!!!!" AS erro;
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
if(@contador = 0)	
	then SELECT "Produto não encontrado!!!!" AS erro;
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
	SELECT "excluida com sucesso!";
if(@contador = 0)	
	then SELECT "Categoria não encontrada!!!!" AS erro;
	delete from categoria where codCategoria=codCatExcluir;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.produtos: ~1 rows (aproximadamente)
INSERT INTO `produtos` (`codProduto`, `nomeProduto`, `precoVenda`, `margemLucro`, `dataValidade`, `marcaProduto`, `qtdEstoque`, `FORNECEDORES_cnpj`, `CATEGORIA_codCategoria`) VALUES
	(8, 'FANTA', 3, NULL, '2023-06-11', 'COCA-COLA', NULL, '23000000', 3);

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

-- Copiando dados para a tabela panificadoracentral.produtos_venda: ~1 rows (aproximadamente)
INSERT INTO `produtos_venda` (`VENDAS_GERAL_codVendaG`, `PRODUTOS_codProduto`, `qtdprodutos`) VALUES
	(6, 8, 10.00);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.vendas_geral: ~3 rows (aproximadamente)
INSERT INTO `vendas_geral` (`codVendaG`, `datahoraVenda`, `tipoVenda`, `nomeVendedor`, `CLIENTES_cpf`) VALUES
	(6, '2023-03-20 20:42:02', 'Cartão Crédito', 'Gustavo', '13244750648'),
	(12, '2023-03-20 20:58:06', 'Cartão Débito', 'Suzana', '12983639690'),
	(15, '2023-03-20 20:59:03', 'Cartão Débito', 'Gustavo', '13244750648');

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
