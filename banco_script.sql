create database meuMenu;
-- drop database meuMenu;
use meuMenu;

CREATE TABLE  `usuario` (
  `idusuario` INT ,
  `nome` VARCHAR(45) ,
  `sobrenome` VARCHAR(45) ,
  `cpf` CHAR(8) ,
  `email` VARCHAR(45) ,
  `tipoComidaPreferida` VARCHAR(45) ,
  `senha` VARCHAR(45) ,
  PRIMARY KEY (`idusuario`));


-- -----------------------------------------------------
-- Table `restaurante`
-- -----------------------------------------------------
CREATE TABLE  `restaurante` (
	`idrestaurante` INT ,
	`fkUsuario` INT ,
	`nome` VARCHAR(45) ,
	`cnpj` CHAR(14) ,
	`especialidade` VARCHAR(45) ,
	`telefone` VARCHAR(45) ,
	`site` VARCHAR(45) ,
	`estrela` INT ,
	PRIMARY KEY (`idrestaurante`),
    FOREIGN KEY (`fkUsuario`)
    REFERENCES `usuario` (`idusuario`));


-- -----------------------------------------------------
-- Table `endereco`
-- -----------------------------------------------------
CREATE TABLE  `endereco` (
	`idendereco` INT ,
	`fkRestaurante` INT ,
	`fkUsuario` INT ,
	`cep` VARCHAR(45) ,
	`numero` VARCHAR(45) ,
	`complemento` VARCHAR(45) ,
	PRIMARY KEY (`idendereco`),
    FOREIGN KEY (`fkRestaurante`)
    REFERENCES `restaurante` (`idrestaurante`),
    FOREIGN KEY (`fkUsuario`)
    REFERENCES `usuario` (`idusuario`)
    )
;


-- -----------------------------------------------------
-- Table `cardapio`
-- -----------------------------------------------------
CREATE TABLE  `cardapio` (
	`idcardapio` INT ,
	`fkRestaurante` INT ,
	`nome` VARCHAR(45) ,
	`preco` DOUBLE ,
	`estiloGastronomico` VARCHAR(45) ,
    `qtd_carboidratos` varchar(45),
    `qtd_proteinas` varchar(45),
    `qtd_acucar` varchar(45),
    `qtd_calorias` varchar(45),
    `qtd_gorduras_totais` varchar(45),
	PRIMARY KEY (`idcardapio`, `fkRestaurante`),
    FOREIGN KEY (`fkRestaurante`)
    REFERENCES `restaurante` (`idrestaurante`));


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
CREATE TABLE  `review` (
	`dataHora` datetime,
	`fkRestaurante` INT ,
	`fkUsuario` INT ,
	`descricao` VARCHAR(45) ,
	`nt_comida` DOUBLE ,
	`nt_ambiente` DOUBLE ,
	`nt_atendimento` DOUBLE ,
	`foto` VARCHAR(45) ,
	PRIMARY KEY (`dataHora`, `fkRestaurante`, `fkUsuario`),
    FOREIGN KEY (`fkRestaurante`)
    REFERENCES `restaurante` (`idrestaurante`),
    FOREIGN KEY (`fkUsuario`)
    REFERENCES `usuario` (`idusuario`));


-- -----------------------------------------------------
-- Table `favorito`
-- -----------------------------------------------------
CREATE TABLE  favorito (
	`fkUsuario` INT ,
	`fkRestaurante` INT ,
	`fl_favorito` TINYINT ,
	PRIMARY KEY (`fkUsuario`, `fkRestaurante`),
    FOREIGN KEY (`fkUsuario`)
    REFERENCES usuario(idusuario),
    FOREIGN KEY (`fkRestaurante`)
    REFERENCES restaurante (idrestaurante)
);

select * from favorito;
-- -----------------------------------------------------
-- Table `funcionamento`
-- -----------------------------------------------------
CREATE TABLE funcionamento (
	`idfuncionamento` INT ,
	`fkRestaurante` INT ,
	`fl_segunda` TINYINT ,
	`fl_terca` TINYINT ,
	`fl_quarta` TINYINT ,
	`fl_quinta` TINYINT ,
	`fl_sexta` TINYINT ,
	`fl_sabado` TINYINT ,
	`fl_domingo` TINYINT ,
	`hrAbertura` DATE ,
	`hrEncerramento` DATE ,
	PRIMARY KEY (`idfuncionamento`),
	FOREIGN KEY (`fkRestaurante`)
    REFERENCES restaurante (idrestaurante)
    );


-- -----------------------------------------------------
-- Table  `acessibilidade`
-- -----------------------------------------------------
CREATE TABLE  acessibilidade (
	`idacessibilidade` INT,
	`fl_visual` TINYINT,
	`fl_sonora` TINYINT,
	`fl_cadeirante` TINYINT,
	`fkRestaurante` INT,
	PRIMARY KEY (`idacessibilidade`, `fkRestaurante`),
	FOREIGN KEY (`fkRestaurante`)
	REFERENCES restaurante (idrestaurante)
);
 
