CREATE SCHEMA IF NOT EXISTS `Gerencial` DEFAULT CHARACTER SET utf8 ;
USE `Gerencial` ;

-- -----------------------------------------------------
-- Table `Gerencial`.`banco`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Gerencial`.`banco` (
  `id` INT(10) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `agencia` VARCHAR(15) NOT NULL ,
  `conta_corrente` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Gerencial`.`cliente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Gerencial`.`cliente` (
  `id` INT(10) NOT NULL AUTO_INCREMENT ,
  `tipo_cliente` ENUM('PF','PJ') NOT NULL ,
  `nome` VARCHAR(250) NOT NULL ,
  `data_nascimento` DATE NOT NULL ,
  `sexo` VARCHAR(10) NOT NULL ,
  `telefone` VARCHAR(10) NOT NULL ,
  `celular` VARCHAR(10) ,
  `rg` INT(14) NOT NULL ,
  `cpf` INT(11) NOT NULL ,
  `ie` INT(10) NOT NULL ,
  `cnpj` INT(14) NOT NULL ,
  `endereco` VARCHAR(250) NOT NULL ,
  `estado` VARCHAR(50) NOT NULL ,
  `bairro` VARCHAR(50) NOT NULL ,
  `cidade` VARCHAR(50) NOT NULL ,
  `cep` INT(10) NOT NULL ,
  `pai` VARCHAR(250) NOT NULL ,
  `mae` VARCHAR(250) NOT NULL ,
  `email` VARCHAR(80) NOT NULL ,
  `observacao` TEXT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;
