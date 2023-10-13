/* tattoo-service-logico: */

CREATE TABLE Colaborador (
    id_colaborador INTEGER PRIMARY KEY,
    nome VARCHAR(30),
    cpf VARCHAR(14),
    email VARCHAR(30),
    redeSocial VARCHAR(30)
);

CREATE TABLE Administrador (
    fpk_Administrador INTEGER PRIMARY KEY
);

CREATE TABLE Tatuador (
    fpk_Tatuador INTEGER PRIMARY KEY
);

CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY,
    nome VARCHAR(30),
    cpf VARCHAR(14),
    email VARCHAR(30),
    redeSocial VARCHAR(30),
    id_fichaAnamnese INT NOT NULL CONSTRAINT fk_cli_ficha REFERENCES fichaAnamnese(id_fichaAnamnese)
);

CREATE TABLE telefone_cliente(
    id INTEGER PRIMARY KEY,
    numero VARCHAR(13),
    fk_id_cliente
);

CREATE TABLE telefone_colaborador(
    id INTEGER PRIMARY KEY,
    numero VARCHAR(13)
    fk_id_colaborador
);

CREATE TABLE Procedimento (
    id_procedimento INTEGER PRIMARY KEY,
    data_agendamento DATE,
    valor_cobrado DOUBLE,
    fk_Tatuador INTEGER,
    fk_Cliente INTEGER,
    fk_Agendador INTEGER
);

CREATE TABLE Material (
    id_material INTEGER PRIMARY KEY,
    nome VARCHAR(30),
    quantidade INTEGER,
    valor_unidade DOUBLE,
    data_compra DATE,
    fk_Procedimento INTEGER,
    fk_Comprador INTEGER
);
 
ALTER TABLE Administrador ADD CONSTRAINT FK_Administrador_2
    FOREIGN KEY (fpk_Administrador)
    REFERENCES Colaborador (id_colaborador)
    ON DELETE CASCADE;
 
ALTER TABLE Tatuador ADD CONSTRAINT FK_Tatuador_2
    FOREIGN KEY (fpk_Tatuador)
    REFERENCES Colaborador (id_colaborador)
    ON DELETE CASCADE;
 
ALTER TABLE Procedimento ADD CONSTRAINT FK_Procedimento_2
    FOREIGN KEY (fk_Tatuador)
    REFERENCES Tatuador (fpk_Tatuador)
    ON DELETE CASCADE;
 
ALTER TABLE Procedimento ADD CONSTRAINT FK_Procedimento_3
    FOREIGN KEY (fk_Cliente)
    REFERENCES Cliente (id_cliente)
    ON DELETE CASCADE;
 
ALTER TABLE Procedimento ADD CONSTRAINT FK_Procedimento_4
    FOREIGN KEY (fk_Agendador)
    REFERENCES Colaborador (id_colaborador)
    ON DELETE CASCADE;
 
ALTER TABLE Material ADD CONSTRAINT FK_Material_2
    FOREIGN KEY (fk_Procedimento)
    REFERENCES Procedimento (id_procedimento)
    ON DELETE CASCADE;
 
ALTER TABLE Material ADD CONSTRAINT FK_Material_3
    FOREIGN KEY (fk_Comprador)
    REFERENCES Administrador (fpk_Administrador)
    ON DELETE CASCADE;

ALTER TABLE telefone_cliente ADD CONSTRAINT fk_cliente_telefone
FOREIGN KEY (fk_id_cliente) REFERENCES cliente(id_cliente)
ON DELETE CASCADE;

ALTER TABLE telefone_colabirador ADD CONSTRAINT fk_colaborador_telefone
FOREIGN KEY (fk_id_colaborador) REFERENCES colaborador(id_colaborador)
ON DELETE CASCADE;



CREATE TABLE fichaAnamnese (
  id_fichaAnamnese INT(11) NOT NULL PRIMARY KEY,
  assinatura TINYINT(4) NOT NULL,
  id_colaborador INT(11) NOT NULL,
  );


CREATE TABLE IF NOT EXISTS `pi_tabela_cliente`.`alergias` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `id_ficha_anamnese` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_alergias_1_idx` (`id_ficha_anamnese` ASC) VISIBLE,
  CONSTRAINT `fk_alergias_1`
    FOREIGN KEY (`id_ficha_anamnese`)
    REFERENCES `pi_tabela_cliente`.`fichaAnamnese` (`idfichaAnamnese`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pi_tabela_cliente`.`medicacoes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `id_ficha_anamnese` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_medicacoes_1_idx` (`id_ficha_anamnese` ASC) VISIBLE,
  CONSTRAINT `fk_medicacoes_1`
    FOREIGN KEY (`id_ficha_anamnese`)
    REFERENCES `pi_tabela_cliente`.`fichaAnamnese` (`idfichaAnamnese`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pi_tabela_cliente`.`doencas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `id_ficha_anamnese` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_doencas_1_idx` (`id_ficha_anamnese` ASC) VISIBLE,
  CONSTRAINT `fk_doencas_1`
    FOREIGN KEY (`id_ficha_anamnese`)
    REFERENCES `pi_tabela_cliente`.`fichaAnamnese` (`idfichaAnamnese`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;