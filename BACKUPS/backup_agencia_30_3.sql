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


-- Copiando estrutura do banco de dados para agencia3si2023
DROP DATABASE IF EXISTS `agencia3si2023`;
CREATE DATABASE IF NOT EXISTS `agencia3si2023` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `agencia3si2023`;

-- Copiando estrutura para tabela agencia3si2023.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `dataNascimento` date NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si2023.cliente: ~6 rows (aproximadamente)
INSERT INTO `cliente` (`idCLIENTE`, `nome`, `cpf`, `rg`, `dataNascimento`, `telefone`) VALUES
	(1, 'Telma Almeida', '123.456.789-10', 'MG 10.100.888', '1980-11-25', '(35)3295-9700'),
	(2, 'Roberto Silva', '035.888.888-24', NULL, '1975-05-21', '(35)3295-1133'),
	(3, 'Guilherme Henrique', '132.447.506-48', NULL, '1997-12-27', NULL),
	(4, 'Rosalia Alves', '777.036.036-77', NULL, '1997-12-27', NULL),
	(5, 'Lúcia Silviano', '444.036.444-77', NULL, '1974-04-24', NULL);

-- Copiando estrutura para tabela agencia3si2023.conta
DROP TABLE IF EXISTS `conta`;
CREATE TABLE IF NOT EXISTS `conta` (
  `idCONTA` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Salário','Corrente','Poupança') NOT NULL,
  `saldo` float NOT NULL,
  `senha` char(8) NOT NULL,
  PRIMARY KEY (`idCONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si2023.conta: ~4 rows (aproximadamente)
INSERT INTO `conta` (`idCONTA`, `tipo`, `saldo`, `senha`) VALUES
	(1, 'Salário', 810.5, 'abc123'),
	(2, 'Poupança', 1250, 'teste'),
	(3, 'Poupança', 3020, 'senha12'),
	(4, 'Corrente', 125.1, '*23AB*');

-- Copiando estrutura para tabela agencia3si2023.contavinculada
DROP TABLE IF EXISTS `contavinculada`;
CREATE TABLE IF NOT EXISTS `contavinculada` (
  `CLIENTE_idCLIENTE` int(11) NOT NULL,
  `CONTA_idCONTA` int(11) NOT NULL,
  `dataAbertura` date NOT NULL,
  PRIMARY KEY (`CLIENTE_idCLIENTE`,`CONTA_idCONTA`),
  KEY `fk_CLIENTE_has_CONTA_CONTA1_idx` (`CONTA_idCONTA`),
  KEY `fk_CLIENTE_has_CONTA_CLIENTE_idx` (`CLIENTE_idCLIENTE`),
  CONSTRAINT `fk_CLIENTE_has_CONTA_CLIENTE` FOREIGN KEY (`CLIENTE_idCLIENTE`) REFERENCES `cliente` (`idCLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENTE_has_CONTA_CONTA1` FOREIGN KEY (`CONTA_idCONTA`) REFERENCES `conta` (`idCONTA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si2023.contavinculada: ~4 rows (aproximadamente)
INSERT INTO `contavinculada` (`CLIENTE_idCLIENTE`, `CONTA_idCONTA`, `dataAbertura`) VALUES
	(1, 1, '2022-12-20'),
	(2, 3, '2023-03-30'),
	(3, 2, '2023-03-30'),
	(4, 4, '2023-03-30');

-- Copiando estrutura para view agencia3si2023.v_clientesordemcrescende
DROP VIEW IF EXISTS `v_clientesordemcrescende`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clientesordemcrescende` (
	`idCLIENTE` INT(11) NOT NULL,
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`cpf` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`rg` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`dataNascimento` DATE NOT NULL,
	`telefone` VARCHAR(45) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si2023.v_contasclientes
DROP VIEW IF EXISTS `v_contasclientes`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_contasclientes` (
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`tipo` ENUM('Salário','Corrente','Poupança') NOT NULL COLLATE 'utf8_general_ci',
	`saldo` FLOAT NOT NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si2023.v_totalfinanceiro
DROP VIEW IF EXISTS `v_totalfinanceiro`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_totalfinanceiro` (
	`SUM(saldo)` DOUBLE NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si2023.v_clientesordemcrescende
DROP VIEW IF EXISTS `v_clientesordemcrescende`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clientesordemcrescende`;
CREATE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `v_clientesordemcrescende` AS (SELECT * FROM cliente ORDER BY nome) ;

-- Copiando estrutura para view agencia3si2023.v_contasclientes
DROP VIEW IF EXISTS `v_contasclientes`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_contasclientes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_contasclientes` AS SELECT cli.nome, con.tipo, con.saldo FROM cliente AS cli  INNER JOIN conta AS con
 INNER JOIN contavinculada AS cv
  ON cli.idCLIENTE = cv.CLIENTE_idCLIENTE
  AND con.IdCONTA = cv.CONTA_idCONTA ;

-- Copiando estrutura para view agencia3si2023.v_totalfinanceiro
DROP VIEW IF EXISTS `v_totalfinanceiro`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_totalfinanceiro`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_totalfinanceiro` AS (SELECT SUM(saldo) FROM conta) ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
